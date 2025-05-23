`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// MUXF7_L primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
/* verilator tracing_off */
module MUXF7_L
(
    input  wire I0, I1,
    input  wire S,
    output wire LO
);

    assign LO = (S) ? I1 : I0;

endmodule
/* verilator coverage_on */
