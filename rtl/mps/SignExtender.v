module SignExtender(
    output [31:0] imm_ext, 
    input [15:0] imm
);
    assign imm_ext = { {16{imm[15]}}, imm};
endmodule
