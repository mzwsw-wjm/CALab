`timescale 1ps/1ps

module HazardDetectionUnit(
    input clk,
    input Branch_ID, rs1use_ID, rs2use_ID,
    input[1:0] hazard_optype_ID,
    input[4:0] rd_EXE, rd_MEM, rs1_ID, rs2_ID, rs2_EXE,
    output PC_EN_IF, reg_FD_EN, reg_FD_stall, reg_FD_flush,
        reg_DE_EN, reg_DE_flush, reg_EM_EN, reg_EM_flush, reg_MW_EN,
    output forward_ctrl_ls,
    output[1:0] forward_ctrl_A, forward_ctrl_B
);
            //according to the diagram, design the Hazard Detection Unit
     reg[1:0] hazard_optype_EX, hazard_optype_MEM;
     wire hazard_EXE1, hazard_EXE2, hazard_MEM1, hazard_MEM2, hazard_load_stall, hazard_Load1, hazard_Load2, hazard_LS;
     
     initial begin
        hazard_optype_EX <= 2'b00;
        hazard_optype_MEM <= 2'b00;
     end
     
     always @(posedge clk) begin
        if(hazard_load_stall)begin
            hazard_optype_EX <= 2'b00;
            hazard_optype_MEM <= hazard_optype_EX;
        end
        else begin
            hazard_optype_EX <= hazard_optype_ID;
            hazard_optype_MEM <= hazard_optype_EX;
        end
     end
     
     //case1:ALU+ALU,ID+EX
     assign hazard_EXE1 = (hazard_optype_ID == 2'b01) & (hazard_optype_EX == 2'b01) & (rd_EXE != 0) & (rd_EXE == rs1_ID) 
                            & (rs1use_ID);
     assign hazard_EXE2 = (hazard_optype_ID == 2'b01) & (hazard_optype_EX == 2'b01) & (rd_EXE != 0) & (rd_EXE == rs2_ID) 
                            & (rs2use_ID);
     
     //case2:ALU+ALU,ID+MEM
     assign hazard_MEM1 = (~hazard_EXE1) & (hazard_optype_ID == 2'b01) & (hazard_optype_MEM == 2'b01) &
                          (rd_MEM != 0) & (rd_MEM == rs1_ID) & rs1use_ID;
     assign hazard_MEM2 = (~hazard_EXE2) & (hazard_optype_ID == 2'b01) & (hazard_optype_MEM == 2'b01) &
                          (rd_MEM != 0) & (rd_MEM == rs2_ID) & rs2use_ID;
     
     //case3:Load+ALU,ID+EXE
     assign hazard_load_stall = (hazard_optype_EX == 2'b10) & (hazard_optype_ID == 2'b01) & 
                                (rd_EXE != 0) & (((rd_EXE == rs1_ID) & rs1use_ID) | ((rd_EXE == rs2_ID) & rs2use_ID));

     //case4:Load+ALU,ID+MEM
     assign hazard_Load1 = (hazard_optype_ID == 2'b01) & (hazard_optype_MEM == 2'b10) &
                           (rd_MEM != 0) & (rd_MEM == rs1_ID) & rs1use_ID;
     assign hazard_Load2 = (hazard_optype_ID == 2'b01) & (hazard_optype_MEM == 2'b10) &
                           (rd_MEM != 0) & (rd_MEM == rs2_ID) & rs2use_ID;                           
     //case5:Load+Save,EX+MEM
     assign hazard_LS = (hazard_optype_EX == 2'b11) & (hazard_optype_MEM == 2'b10) & 
                        (rd_MEM != 0) & (rd_MEM == rs2_EXE);
                        
     assign forward_ctrl_A = {2{hazard_EXE1}} & 2'b01 |
                             {2{hazard_MEM1}} & 2'b10 |
                             {2{hazard_Load1}}& 2'b11 ;
     assign forward_ctrl_B = {2{hazard_EXE2}} & 2'b01 |
                             {2{hazard_MEM2}} & 2'b10 |
                             {2{hazard_Load2}}& 2'b11 ;
                             
     assign forward_ctrl_ls =  hazard_LS;
     
     assign reg_FD_stall = hazard_load_stall;
     assign PC_EN_IF = ~hazard_load_stall;
      
     assign reg_FD_EN = 1;
     assign reg_FD_flush = Branch_ID;
     
     assign reg_DE_EN = 1;
     assign reg_DE_flush = hazard_load_stall;
     
     assign reg_EM_EN = 1;
     assign reg_EM_flush = 0;
     
     assign reg_MW_EN = 1;
     
endmodule