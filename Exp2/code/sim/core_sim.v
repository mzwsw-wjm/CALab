`timescale 1ns / 1ps

module core_sim;
    reg clk, rst;
    reg inter;

    RV32core core(
        .debug_en(1'b0),
        .debug_step(1'b0),
        .debug_addr(7'b0),
        .debug_data(),
        .clk(clk),
        .rst(rst),
        .interrupter(inter)
    );

    initial begin
        clk = 0;
        rst = 1;
        inter = 1'b0;
        #2 rst = 0;
        #207 inter = 1'b1;
        //#20 inter = 1'b0;
    end

    always #1 clk = ~clk;

endmodule