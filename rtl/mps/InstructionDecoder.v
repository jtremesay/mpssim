module InstructionDecoder(
    output [5:0] op, func,
    output [4:0] reg_s, reg_t, reg_d,
    output [15:0] imm,
    output [25:0] jump_addr,
    input [31:0] instr
);
    assign op = instr[31:26];
    assign func = instr[5:0];
    assign reg_s = instr[25:21];
    assign reg_t = instr[20:16];
    assign reg_d = instr[15:11];
    assign imm = instr[15:0];
    assign jump_addr = instr[25:0];
endmodule