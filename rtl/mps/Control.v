`include "opcodes.inc.v"

module Control(
    output reg_d_sel, jump, branch, mem_to_reg, mem_write, alu_sel, reg_write,
    output [0:0] alu_op,
    input [5:0] op
);
    assign jump = 0;
endmodule