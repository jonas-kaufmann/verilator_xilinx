`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// RAM256X1S primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
/* verilator tracing_off */
module RAM256X1S
#(
    parameter [255:0] INIT = 256'h0,
    parameter   [0:0] IS_WCLK_INVERTED = 1'b0
)
/* verilator tracing_on */
(
    // Write clock
    input  wire       WCLK,
    // Write enable
    input  wire       WE,
    // Read / Write address
    input  wire [7:0] A,
    // Data in
    input  wire       D,
    // Data out
    output wire       O
);
/* verilator tracing_off */
    // 256 x 1-bit Select RAM
    reg  [255:0] _r_mem;
    
    // Power-up value
    initial begin : INIT_STATE
        _r_mem = INIT;
    end
    
    // Synchronous memory write
    generate
        if (IS_WCLK_INVERTED) begin : GEN_WCLK_NEG
            always @(negedge WCLK) begin : MEM_WRITE
            
                if (WE) begin
                    _r_mem[A] <= D;
                end
            end
        end
        else begin : GEN_WCLK_POS
            always @(posedge WCLK) begin : MEM_WRITE
            
                if (WE) begin
                    _r_mem[A] <= D;
                end
            end
        end
    endgenerate
    
    // Asynchronous memory read
    assign O = _r_mem[A];

endmodule
/* verilator coverage_on */
