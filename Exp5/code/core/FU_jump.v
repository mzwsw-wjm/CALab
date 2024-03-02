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
        < �Ὣ���ݰ����޷��������߼�����⣬LT�ֳ����������
        1. a > 0 && b > 0 && a < b
        2. a < 0 && b < 0 && a < b
        3. a <= 0 && b >= 0(�ȺŲ�ͬʱȡ)
        �ڲ������ϵ�У������ϴ��ߣ������޷��������Ҳ�ϴ����� ~(a[31] ^ b[31]) ��֤a��bͬ�š�
        ��a��b���ʱ����֤a�Ǹ�����b���ڵ���0��
        ��a == 0ʱ��b������������a��bͬ�������㡣
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
        c��һ��һλ���źţ�������ʾbranchָ���Ƿ�������jal�Լ�jalrָ�ͬ��
        Bϵ��ָ�����ת����������cmp32�������Ǳ�����תָ�����ת����ͬʱ������
        ����ת������

        ���Ĳ��ֱ��������ź�ȷʵ�Ƕ�Ӧ����תָ���ֹ�����ϵĴ����ұߵĲ���
        ��ʾ��ת�������㣬Ӧ�÷�����ת��

        c == 1 ��ʾ��ת������c == 0 ��ʾ��ת�������� 
    */

    assign cmp_res = ((EQ & res_EQ) |
                (NE & res_NE) | 
                (LT & res_LT) |
                (LTU & res_LTU) |
                (GE & res_GE) |
                (GEU & res_GEU));          //to fill sth. in ()


    /*
        jalr��PC+4����rd�Ĵ���������ת��rs1+offset��
    */
    assign PC_jump = imm_reg + (JALR_reg ? rs1_data_reg : PC_reg);
    assign PC_wb = PC_reg + 4;
    //assign cmp_res = c;

    //fill end

endmodule
