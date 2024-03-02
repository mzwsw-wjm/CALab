// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Dec 29 10:31:29 2022
// Host        : LAPTOP-GIMOV2AL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/lenovo/Desktop/Exp6/Exp6/Exp6.srcs/sources_1/ip/multiplier/multiplier_sim_netlist.v
// Design      : multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "multiplier,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module multiplier
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [63:0]P;

  wire [31:0]A;
  wire [31:0]B;
  wire CLK;
  wire [63:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "6" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  multiplier_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "32" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "32" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "6" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "63" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module multiplier_mult_gen_v12_0_16
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [31:0]A;
  input [31:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [63:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [31:0]A;
  wire [31:0]B;
  wire CLK;
  wire [63:0]P;
  wire [47:0]PCASC;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "6" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  multiplier_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
ZqI7Lq/aGyAcoaejBEIk07VX9jYIkvdeTPQu9dSbDEADopcPNa+0k8THWemULZmXocovtHBV2sQ+
UG9Mr3L0hg==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
R4vPs+jPUBq40hDi8U6b9avbUk2Eb50U4A+mDDli/Y0olyqpMjS2bHK8VDjTVAFuQ+H3qih0cQYm
+ik1m47VLNMfNDfRLbftE2okRK8Kx81MRcEafr+7z29VxyL2KSwmOKbcDCEkIT1VX5y+96x7q9/g
O5zX1cVuj6hrFncQjBI=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RHGRLed4zRtfx3HaMZFysMR3Ua1JohlSUQn/uIq0QNaCK2P96ztDgqQoqe6ZQ11betfsHTRFzq/1
66ClFz6QxXME/fh2KrrXSgUZxYxwfstEZlyOThrSfu+qzCsdk0R654q7wyvVT8+Lni3RuXc5nFXx
raCVZl6qLm50r3EadUq562wDBW7iVkrMp3OgccKyJyw39sT1Jc+0IkzHuHqjKA44tfGTOOSTHNUj
YgsyeZCJS72pabS90ZfprHyjsELB7Bxw/M9/XLEV7l1LP+SCDJFvOP5dNLZDBmwYIJ5OoU7247Tk
wYu3m6ZFZNnTwWGI9SAZJyiXILRa8hVZPL9TSA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OU7rNiePgxinwm/ruLBNeniAmTTLdwPhOZ1i35IGtDWXtaPoMnsPLRF6vnJo1xeYUES1MIlBqaG4
FUeyfrnBl3ofk5rfTbxL16dBcEtA8Z/duJARcLCIBD/J+xf2VlSqIo8dG9Ww8/L9pBTHpNAObSOU
o17xArTTrLfHWXZRGfRwuRpGlTLTYOMvS1AGhQcPbXjHrlijOoz3XigDVsnyGbHfkSgOlGBCnyDS
TPebi8IC8YIl88ieW+lqTL6jl+3DZ55iTfCJKbFt/HrE1Uou1l+60xI/9h9XhrNzE5ANic5eFmyC
tdncsHEBtx+UfZhyFrHV8z72yZoLCX2rOJ+IJA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GUoHfgebfwQKNkw122kR1rRfB4ZFf7/0xjFIvV3auOQ9RcZO2jgecvvtUAn3nocoMNPW1jFFZW0u
xgkVDSrwVJrMR/obpu7gqo1n1FD2E5BpOJV2Gwso9aZGhgTdfd0mINfCxPi4lxUYuTw1vd+iNkBH
peC7j2xzDHSu6o2S58c=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lW3oa+bS7VSdBch0q4Lk4kIel2MxeXNlqo+JkBKYCThE5vtBv3Mob32tRj6s2h8BAos9XGsKRu0r
zWpu3cgAnv8lYIL4/UPBP9T+caGqWHHoGULrLn4zuybUvPzfGPj+ANXGfPXBomTO48UgPFWBnBA2
3vlOjCiOyKLMQAUrg8RqpfdYfcnwHxk8ebrE+lZJf6NCQtrqGu/EnH7PYFH/8MSQa6yey02fLQ2J
HenzdGNam7fu3z20gETHgePuewowRrJu5bEZOzlor2RrSnb0hcSbcO4/KSA9EcbmjzBMjE5uRYAM
1y+0t4rNGr+0XAjpp8m6B8lGF+m1jIGYMJ55eQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AYjoOGO5c2rCxRUY5RbgjfKwpMKJQrCDGPu9wzqv2ZhoT9Trod7xJlCnzNNU4kNJPTgmDf05Bkoo
EvR1hgWeTmTgCGdy7Qci0Z0L3pdxnOg9i69qsJO1qAW46sOYPeZHpvATo3irsreTIyOEcblYRdLh
Raj2T02eEhljrx1UdWXHwIq6kJGwbPaiMRXRJewJ75w53lF3nNUwTYgttUbm/hKuK4MTBvyDWlHF
UReBw5kEbERTaRF91+HNJUeoBgfLIgVhtPzX3Yzqy4fl1PxZ0BzAGNRQWfLI4TBSyl64znmxdzaS
+wcpSJ3OHZL4sBSIwGqpZ8UuNr53DWWwkd5lqw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F93W5rP9wRsskpVAtvm9VhlFJY5TOuivcFKT2bVYmeqxn925TMU0N0nDRJZmC+O7NbtC0kbL9Hfv
iPaQAjkvtWKCEafU216A83pjNwYVINq3GbStXAtCrvf3KbYJMQPnr6FzKWLa0RlmEqf2z1LRIJMY
cR3LKzziLGgP+oQLz6W3siXeoyqxsbDm+dasSbu2YxzGAvkTos4kX2slGrQzxYSQogS6j/MzVgIk
Vhsm3BYDbtVT5TsiHGfRfi137tS2Q9o11KN44GT+JYigwORe+GyKi5xjI6kGPl1N1DK12TlRGsgC
Wq2YWMn2ABYXE2F8mkwPOJqSaaAR0S5MMCjkaQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EO2KlFB8vWgjeXvua8SEZL2APl0WfdPtqoF/0VTjBDZhkKh8T7GBS9tSSrCin7kHRBUGF6hOUPK2
V0JQtp4yW7c3oVbMN2ePIV7UdtkAszA2lMqOqeKJbWn0TfxRWL5adG+jGlhhYEbaT6tkCGPbbtbk
y5Kew5kT3RyGP8Rb0tim3cGvqi2BdBxqdc5Sb+Vyj0havZUyZo1AsjuLnNukDIYIrPCtqOY22MTp
VlNOr/u23OIMx+xx7Z4aOvZacPCxfg662ljyHetf5a0wu31WI6zf/69lkXq1iWJtHgEJn2iDpIWs
bSWDEtGgKAFHGKVAoc0vIGP3aPG6DIsqRyQ90Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ng5JEfqSjxR7RygN8j9cQ2flfktaSxI7i5nYUg56eABht1A7t+qV77zOiMZ+92AwdWnvu0kdy8pI
iGPTdwMiLJEMG73BnrLAHUsVFfm9kjhOIGUIpbcqFFQSIuRAKCZcT03k+PZwGg2NLo5gQW2Tg5+E
lEBWkSvKYejya8HoeCToptVEnMpmJjTvqF2pLrCwRxDUd0OguoYiLHZbIK05H24Q6WbGaUMv7eXJ
MXc91X1FN2PXktu5v1SH7zOTHFWsjhw6sI4Rfgtg1fkHh//xkBaEYOI7+x9lvtjhLJt5ZxqI/35w
58v9WNCp5IOy2k65W5c83tS8iw1PmX/sdZBwNA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xJPDRStGinCaV5qgos8n7G8TnRgJQxi5CFgUM84+jN38kAc12kw4o4ksKU7xpHkgQW6X2nVkJfje
4CaQpTNLBV3kY95/Wuj0WUrjKRbbZK8lm5DDfU3sbhGbRZnmJIsm1KslKHDnHiQLyEw9GIVoK9qA
HPvmGlSTDqJxYDwkbrsA7ArmVJiLL10j/XN+HyukAWPrKmB0nyoD3FDNENTW362GqOZRJr+riLLq
INVxN5AEM1IMsf/48qy9UtxDUhV68ATybRiuFQ2s1zj8kCmUMlbhjMsRR5Wfmq3pwbWWdw86M3jU
iYNpVhlXJVnvorJfHWKj/n46g8KdIlyQzTcrEw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 57488)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
