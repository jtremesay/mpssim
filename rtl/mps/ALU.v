module ALU( 
    output [31:0] z, 
    output zero,
    input [31:0] a, b, 
    input [3:0] mode
);
    assign z = a + b;
    assign zero = z == 0;
endmodule