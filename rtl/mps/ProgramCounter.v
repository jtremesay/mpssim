module ProgramCounter(
    output reg [31:0] pc, 
    input [25:0] jump_addr, 
    input [31:0] branch_addr,
    input jump, branch, zero,
    input clock, nreset
);
    wire [31:0] pc_inc = pc + 4;
    wire [31:0] pc_jump = {pc[31:28], (jump_addr << 2)};
    wire [31:0] pc_branch = pc_inc + (branch_addr << 2);
    always @(posedge clock, negedge nreset) begin
        if (!nreset) begin
            pc <= 0;
        end else begin
            pc <= jump ? pc_jump : (branch & zero) ? pc_branch : pc_inc;
        end
    end
endmodule
