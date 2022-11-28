module PCLogic(
    output [31:0] pc_next,
    input [31:0] pc, 
    input [25:0] jump_addr, 
    input [31:0] branch_addr,
    input jump, branch, zero,
);
    wire [31:0] pc_inc = pc + 4;
    wire [31:0] pc_jump = {pc[31:28], (jump_addr << 2)};
    wire [31:0] pc_branch = pc_inc + (branch_addr << 2);
    assign pc_next = jump ? pc_jump : (branch & zero) ? pc_branch : pc_inc;
endmodule
