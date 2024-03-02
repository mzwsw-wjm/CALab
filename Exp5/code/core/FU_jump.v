`timescale 1ns / 1ps

module FU_jump(
	input clk, EN, JALR,
	input[2:0] cmp_ctrl,
	input[31:0] rs1_data, rs2_data, imm, PC,
	output[31:0] PC_jump, PC_wb,
	output cmp_res, finish
);

    reg state;
    assign finish = state == 1'b1;
	initial begin
        state = 0;
    end

	reg JALR_reg;
	reg[2:0] cmp_ctrl_reg;
	reg[31:0] rs1_data_reg, rs2_data_reg, imm_reg, PC_reg;

    always@(posedge clk)begin
        if(EN & ~state)begin
            JALR_reg <= JALR;
            cmp_ctrl_reg <= cmp_ctrl;
            rs1_data_reg <= rs1_data;
            rs2_data_reg <= rs2_data;
            imm_reg <= imm;
            PC_reg <= PC;
            state <= 1'b1;
        end
        else begin
            state <= 1'b0;
        end
    end
    
    parameter cmp_EQ  = 3'b001;//beq  rs1,rs2,offset : branch if equal.
    parameter cmp_NE  = 3'b010;//bne  rs1,rs2,offset : branch if not equal.
    parameter cmp_LT  = 3'b011;//blt  rs1,rs2,offset : branch if less than.
    parameter cmp_LTU = 3'b100;//bltu rs1,rs2,offset : branch if less than, unsigned.
    parameter cmp_GE  = 3'b101;//bge  rs1,rs2,offset : branch if greater than or equal. 
    parameter cmp_GEU = 3'b110;//begu rs1,rs2,offset : branch if greater than or equal, unsigned.

    /*
        < 会将数据按照无符号数的逻辑来理解，LT分成三种情况：
        1. a > 0 && b > 0 && a < b
        2. a < 0 && b < 0 && a < b
        3. a <= 0 && b >= 0(等号不同时取)
        在补码的体系中，负数较大者，按照无符号数理解也较大。所以 ~(a[31] ^ b[31]) 保证a，b同号。
        在a，b异号时，保证a是负数，b大于等于0。
        在a == 0时，b是正数，按照a，b同号理解计算。
    */

    wire[31:0] a = rs1_data_reg;
    wire[31:0] b = rs2_data_reg;
    //wire c;

    wire res_EQ  = a == b;
    wire res_NE  = ~res_EQ;
    wire res_LT  = (a[31] & ~b[31]) || (~(a[31] ^ b[31]) && a < b);
    wire res_LTU = a < b;
    wire res_GE  = ~res_LT;
    wire res_GEU = ~res_LTU;

    wire EQ  = cmp_ctrl_reg == cmp_EQ ; 
    wire NE  = cmp_ctrl_reg == cmp_NE ; 
    wire LT  = cmp_ctrl_reg == cmp_LT ; 
    wire LTU = cmp_ctrl_reg == cmp_LTU;
    wire GE  = cmp_ctrl_reg == cmp_GE ; 
    wire GEU = cmp_ctrl_reg == cmp_GEU;

    /*
        c是一个一位的信号，用来表示branch指令是否发生。和jal以及jalr指令不同，
        B系列指令的跳转存在条件。cmp32的作用是表明跳转指令和跳转条件同时成立，
        即跳转发生。

        左侧的部分表明控制信号确实是对应的跳转指令，防止阶码上的错误，右边的部分
        表示跳转条件满足，应该发生跳转。

        c == 1 表示跳转发生；c == 0 表示跳转不发生。 
    */

    assign cmp_res = ((EQ & res_EQ) |
                (NE & res_NE) | 
                (LT & res_LT) |
                (LTU & res_LTU) |
                (GE & res_GE) |
                (GEU & res_GEU));          //to fill sth. in ()


    /*
        jalr将PC+4放入rd寄存器，并跳转到rs1+offset。
    */
    assign PC_jump = imm_reg + (JALR_reg ? rs1_data_reg : PC_reg);
    assign PC_wb = PC_reg + 4;
    //assign cmp_res = c;

    //fill end

endmodule
