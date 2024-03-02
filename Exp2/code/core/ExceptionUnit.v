`timescale 1ns / 1ps

module ExceptionUnit(
    input clk, rst,
    input csr_rw_in,
    input[1:0] csr_wsc_mode_in,
    input csr_w_imm_mux,
    input[11:0] csr_rw_addr_in,
    input[31:0] csr_w_data_reg,
    input[4:0] csr_w_data_imm,

    output[31:0] csr_r_data_out,

    input interrupt,
    input illegal_inst,
    input l_access_fault,
    input s_access_fault,
    input ecall_m,

    input mret,

    input[31:0] epc_cur,
    input[31:0] epc_next,

    output[31:0] PC_redirect,
    output redirect_mux,

    output reg_FD_flush, reg_DE_flush, reg_EM_flush, reg_MW_flush, 
    output RegWrite_cancel
);

    reg[11:0] csr_raddr, csr_waddr;
    reg[31:0] csr_wdata;
    reg csr_w;
    reg[1:0] csr_wsc;

    wire[31:0] mstatus;

    CSRRegs csr(.clk(clk),.rst(rst),.csr_w(csr_w),.raddr(csr_raddr),.waddr(csr_waddr),
        .wdata(csr_wdata),.rdata(csr_r_data_out),.mstatus(mstatus),.csr_wsc_mode(csr_wsc));

    //According to the diagram, design the Exception Unit

    reg flush_trap;
    reg flush_mret;
    reg cancel_write;
    reg redirect;

    assign reg_FD_flush = flush_trap | flush_mret;
    assign reg_DE_flush = flush_trap | flush_mret;
    assign reg_EM_flush = flush_trap | flush_mret;
    assign reg_MW_flush = flush_trap ;

    assign RegWrite_cancel = cancel_write;
    assign redirect_mux = redirect;
    assign PC_redirect = csr_r_data_out;

    wire mstatus_mie;
    wire mstatus_mpie;

    assign mstatus_mie = mstatus[3];
    assign mstatus_mpie = mstatus[7];

    wire[31:0] mstatus_enter;
    wire[31:0] mstatus_exit;

    assign mstatus_enter = {mstatus[31:8], mstatus_mie, mstatus[6:4], 1'b0, mstatus[2:0]};
    assign mstatus_exit  = {mstatus[31:8], 1'b1, mstatus[6:4], mstatus_mpie, mstatus[2:0]};


    reg[31:0] epc;
    wire trap;
    reg  after_interrupt;
    wire[31:0] exception_code;
    reg[31:0] reg_exception_code;


    assign trap = interrupt | illegal_inst | l_access_fault | s_access_fault | ecall_m;
    assign exception_code = interrupt ? 32'h8000_0000 : illegal_inst ? 32'd2 : ecall_m ? 32'd11 : s_access_fault ? 32'd7 : 32'd5;

    localparam STATE_IDLE = 2'b00;
    localparam STATE_MEPC = 2'b01;
    localparam STATE_MCAUSE = 2'b10;
    localparam STATE_MTVAL = 2'b11;

    reg[1:0] CurrState;
    reg[1:0] NextState;

    localparam MSTATUS = 12'h300;
    localparam MIE     = 12'h304;
    localparam MTVEC   = 12'h305;
    localparam MEPC    = 12'h341;
    localparam MCAUSE  = 12'h342;
    localparam MTVAL   = 12'h343;
    localparam MIP     = 12'h344;

    reg count;

    always @(posedge clk or posedge rst)begin
        if(rst) begin
            CurrState = STATE_IDLE;
        end
        else begin 
        CurrState = NextState;

        if(mstatus_mie && trap)begin
            epc = interrupt ? epc_next : epc_cur;
            reg_exception_code = exception_code;
        end
        end
        //after_interrupt <= interrupt;
        //count <= after_interrupt;
        after_interrupt = interrupt;
    end

    always @* begin

        if(rst)count=0;

        case(CurrState)
            STATE_IDLE:begin
                if(mstatus_mie && trap && !interrupt)begin
                    csr_w = 1;
                    csr_wsc = 2'b01;
                    csr_waddr = MSTATUS;
                    csr_wdata = mstatus_enter;
                    flush_trap = 1;//tune
                    cancel_write = ~interrupt;
                    //epc <= interrupt ? epc_next : epc_cur;
                    NextState = STATE_MEPC;
                    //reg_exception_code <= exception_code;
                end
                else if(mstatus_mie && trap && interrupt)begin
                    if(count == 0)begin
                        csr_w = 1;
                        csr_wsc = 2'b01;
                        csr_waddr = MSTATUS;
                        csr_wdata = mstatus_enter;
                        flush_trap = 1;//tune
                        cancel_write = ~interrupt;
                        //epc <= interrupt ? epc_next : epc_cur;
                        NextState = STATE_MEPC;
                        //reg_exception_code <= exception_code;
                        count = 1;
                    end
                    else begin
                        count = after_interrupt;
                        flush_mret = 0;
                        redirect = 0;
                        NextState = STATE_IDLE;
                    end
                end



/*
    mret：机器模式异常返回 从机器模式异常处理程序返回。将pc设置成CSRs[mepc]，
    将特权级设置成CSRs[mstatus].MPP，CSRs[mstatus].MIE设置成CSRs[mstatus].MPIE
    并且将CSRs[mstatus].MPIE设置为1；并且，如果支持用户模式，则将CSRs[mstatus].MPP
    设置为0。
*/
                else if(mret)begin
                    csr_w = 1;
                    csr_wsc = 2'b01;
                    csr_waddr = MSTATUS;
                    csr_wdata = mstatus_exit;
                    csr_raddr = MEPC;
                    redirect = 1;
                    flush_mret = 1;
                    NextState = STATE_IDLE;
                end
                else if(csr_rw_in)begin
                    csr_w = 1;
                    csr_wsc = csr_wsc_mode_in;
                    csr_raddr = csr_rw_addr_in;
                    csr_waddr = csr_rw_addr_in;
                    csr_wdata = csr_w_imm_mux ? {27'b0, csr_w_data_imm} : csr_w_data_reg;
                    NextState = STATE_IDLE;
                end
                else begin
                    csr_w = 0;
                    flush_trap = after_interrupt ? 0 : trap;
                    flush_mret = 0;
                    cancel_write = 0;
                    redirect = 0;
                    NextState = STATE_IDLE;
//                    if(trap)begin
//                        flush_trap <= 1;
//                    end
//                    else begin
//                        flush_trap <= 0;
//                    end

                end
            end
            STATE_MEPC:begin
                csr_w = 1;
                csr_wsc = 2'b01;
                csr_waddr = MEPC;
                csr_wdata = epc;
                csr_raddr = MTVEC;
                redirect = 1;
                cancel_write = 0;
                NextState = STATE_MCAUSE;

            end
            STATE_MCAUSE:begin
                csr_w = 1;
                csr_wsc = 2'b01;
                csr_waddr = MCAUSE;
                csr_wdata = reg_exception_code;
                flush_trap = 0;
                 redirect = 0;

                NextState = STATE_IDLE;

               // NextState <= STATE_MTVAL;
            end

        endcase
    end
endmodule