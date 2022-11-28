module InstructionDecoder(
    output [4:0] sr1, sr2, dr,
    output [15:0] imm,
    output [25:0] jump_addr,
    output [5:0] alu_func,
    output [5:0] alu_func, op,
    input [31:0] instr
);
    assign sr1 = instr[25:21];
    assign sr2 = instr[20:16];
    assign dr = instr[15:11];
    assign imm = instr[15:0];
    assign jump_addr = instr[25:0];
    assign alu_func = instr[5:0];
    assign op = instr[31:26];
endmodule