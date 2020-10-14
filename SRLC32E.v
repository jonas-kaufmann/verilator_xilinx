`timescale  1 ps / 1 ps
//
// SRLC32E primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2020 Frédéric REQUIN
// License : BSD
//

module SRLC32E
(
    // Clock
    input  wire       CLK,
    // Clock enable
    input  wire       CE,
    // Bit output position
    input  wire [4:0] A,
    // Data in
    input  wire       D,
    // Data out
    output wire       Q,
    // Cascading data out
    output wire       Q31
);
    parameter [31:0] INIT = 32'h00000000;
    
    // 32-bit shift register
    reg  [31:0] _r_srl;
    
    // Power-up value
    initial begin
        _r_srl = INIT;
    end
    
    // Shifter logic
    always @(posedge CLK) begin : SHIFTER_32B
    
        if (CE) begin
            _r_srl <= { _r_srl[30:0], D };
        end
    end
    
    // Data out
    assign Q   = _r_srl[A];
    
    // Cascading data out
    assign Q31 = _r_srl[31];

endmodule
