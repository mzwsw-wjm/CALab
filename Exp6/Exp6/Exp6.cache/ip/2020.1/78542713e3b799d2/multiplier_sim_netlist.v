// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu Dec 29 10:31:28 2022
// Host        : LAPTOP-GIMOV2AL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ multiplier_sim_netlist.v
// Design      : multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "multiplier,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintex7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16_viv i_mult
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
p8HMRgbl+cxxd3vbL8WHCUcQgrJcpthpR32znNIZI/I/KaopWLaicRpbbLGoLGezhmGTBhRpk5Wh
PDooS57u/rzGKca5qgl8mL0aR8dELzKI9TsBFCHIqfmzCvfv+SXlW5jeWc41PRoIpDBaqPZE/CHM
Z6sc8nK0itKd/Hed7U2bga7ktDiQ3U3/D637Kk4dGnRt7OQMx9n9SsqGWZvpiRROFXUELQWBEloc
NgX1UFxsPDFjWcqCKbc5AHx7fbqx49VNvmZPXsUGvhLQBszZlcC7RDcUfSxN0s7AcBk2KVS+u39i
Gp0SLMZYBPXeFk7e68jE3pwZpHilKTaVLmkyKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
21Bewp0CFsy6rcaVpV2kD0K8Sx2n7p84dk/4iAMFmSQYh430YgfabucnO4FNMsTbZmtehcE6OORg
dKvlKqNJZ5w6wHt8w6pXy5wrEvzOLgNG3xuSEi6t7VIqh1zyobnbsgKcUwDAAnO7dwQ3L95UK53X
az4YUsqX8nIoJYcL2zrwj1lIPmnnfoV2PSwHA5JaOGaCFD9W4mRdiaq9kLT/G4p0sEm7OItVfKft
ll6bKrb+Adx2WpY3BjeyvAmUSNSbaXuW4Eq8NC3/0hoHRSJDVWkHOvOJo/y6DCO9thxPNeynGCRq
sSFEElbAldTfFIPvZh+Q4sQZoDmFBesLhq42dw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 57760)
`pragma protect data_block
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
QqQf0ornuTnF+LhZY14Pd88XwA==
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
