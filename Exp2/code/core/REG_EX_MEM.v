`timescale 1ns / 1ps

module   REG_EX_MEM(input clk,                                      //EX/MEM Latch
                    input rst,
                    input EN,                                       //流水寄存器使�??
                    input flush,                                    //异常时清除异常指令并等待中断处理(保留)�??
                    input [31:0] IR_EX,                             //当前执行指令(测试)
                    input [31:0] PCurrent_EX,                       //当前执行指令存储器指�??
                    input [31:0] ALUO_EX,                           //当前ALU执行输出：有效地�??或ALU操作
                    input [31:0] B_EX,                              //ID级读出寄存器B数据：CPU输出数据
                    input [4:0]  rs1_EX, rd_EX,                    //传�?�当前指令写目的寄存器地�??
                    input [31:0] rs1_data_EX,
                    input DatatoReg_EX,                      //传�?�当前指令REG写数据�?�道选择
                    input RegWrite_EX,                              //传�?�当前指令寄存器写信�??
                    input WR_EX,                                    //传�?�当前指令存储器读写信号
                    input[2:0] u_b_h_w_EX,
                    input mem_r_EX,
                    input csr_rw_EX,
                    input csr_w_imm_mux_EX,
                    input mret_EX,
                    input[1:0] exp_vector_EX,

                    output reg[31:0] PCurrent_MEM,                  //锁存传�?�当前指令地�??
                    output reg[31:0] IR_MEM,                        //锁存传�?�当前指�??(测试)
                    output reg[31:0] ALUO_MEM,                      //锁存ALU操作结果：有效地�??或ALU操作
                    output reg[31:0] Datao_MEM,                     //锁存传�?�当前指令输出mem_r数据
                    output reg[4:0]  rd_MEM,                        //锁存传�?�当前指令写目的寄存器地�??
                    output reg[4:0]  rs1_MEM,
                    output reg[31:0] rs1_data_MEM,
                    output reg       DatatoReg_MEM,                 //锁存传�?�当前指令REG写数据�?�道选择
                    output reg       RegWrite_MEM,                  //锁存传�?�当前指令寄存器写信�??
                    output reg       WR_MEM,                         //锁存传�?�当前指令存储器读写信号
                    output reg[2:0]  u_b_h_w_MEM,
                    output reg       mem_r_MEM,
                    output reg       isFlushed,
                    output reg       csr_rw_MEM,
                    output reg       csr_w_imm_mux_MEM,
                    output reg       mret_MEM,
                    output reg[1:0]  exp_vector_MEM
                );

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            IR_MEM         <= 0;
            PCurrent_MEM   <= 0;
            rd_MEM         <= 0;
            rs1_MEM        <= 0;
            RegWrite_MEM   <= 0;
            WR_MEM         <= 0;
            mem_r_MEM      <= 0;
            isFlushed      <= 0;
            csr_rw_MEM     <= 0;
            mret_MEM       <= 0;
            exp_vector_MEM <= 0;
        end
        else if(EN) begin                                      //EX级正常传输到MEM�??
            if(flush) begin
                IR_MEM         <= 0;
                PCurrent_MEM   <= PCurrent_EX;
                rd_MEM         <= 0;
                rs1_MEM        <= 0;
                RegWrite_MEM   <= 0;
                WR_MEM         <= 0;
                mem_r_MEM      <= 0;
                isFlushed      <= 1;
                csr_rw_MEM     <= 0;
                mret_MEM       <= 0;
                exp_vector_MEM <= 0;
            end
            else begin
                IR_MEM            <= IR_EX;
                PCurrent_MEM      <= PCurrent_EX;                 //传�?�锁存当前指令地�??
                ALUO_MEM          <= ALUO_EX;                     //锁存有效地址或ALU操作
                Datao_MEM         <= B_EX;                        //传�?�锁存CPU输出数据
                DatatoReg_MEM     <= DatatoReg_EX;                //传�?�锁存REG写数据�?�道选择
                RegWrite_MEM      <= RegWrite_EX;                 //传�?�锁存目的寄存器写信�??
                WR_MEM            <= WR_EX;                       //传�?�锁存存储器读写信号
                rd_MEM            <= rd_EX;                       //传�?�锁存写目的寄存器地�??
                rs1_MEM           <= rs1_EX;
                rs1_data_MEM      <= rs1_data_EX;
                u_b_h_w_MEM       <= u_b_h_w_EX;
                mem_r_MEM         <= mem_r_EX;
                isFlushed         <= 0;
                csr_rw_MEM        <= csr_rw_EX;
                csr_w_imm_mux_MEM <= csr_w_imm_mux_EX;
                mret_MEM          <= mret_EX;
                exp_vector_MEM    <= exp_vector_EX;
            end
        end
    end

endmodule