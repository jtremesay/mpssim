module PCNext(
    output [31:0] next_pc,
    input [31:0] pc, imm,
    input [25:0] addr,
    input jump, branch, zero
);
    wire [31:0] pc_inc = pc + 4;
    wire [31:0] pc_jump = {pc_inc[31:28], (addr << 2)};
    wire [31:0] pc_branch = pc_inc + (imm << 2);
    assign next_pc = jump ? pc_jump : (branch & zero) ? pc_branch : pc_inc;
endmodule