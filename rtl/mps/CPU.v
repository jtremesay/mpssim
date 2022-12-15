module CPU(
    input [31:0] instr,
    output [31:0] pc,
    input [31:0] rval,
    output [31:0] wval, addr,
    output write,
    input clock, nreset
);
    // Program counter
    wire [31:0] next_pc;
    ProgramCounter c_pc(
        .pc(pc), 
        .next_pc(next_pc),
        .clock(clock), 
        .nreset(nreset)
    );

    // Instruction decode
    wire [4:0] reg_s, reg_t, reg_d;
    wire [15:0] imm;
    wire [25:0] jump_addr;
    wire [5:0] func, op;
    InstructionDecoder c_id(
        .op(op),
        .func(func),
        .reg_s(reg_s),
        .reg_t(reg_t),
        .reg_d(reg_d),
        .imm(imm),
        .jump_addr(jump_addr),
        .instr(instr)
    );

    // Control unit
    wire reg_d_sel, jump, branch, mem_to_reg, mem_write, alu_sel, reg_write;
    wire [0:0] alu_op;
    Control c_ctrl(
        .reg_d_sel(reg_d_sel), 
        .jump(jump), 
        .branch(branch), 
        .mem_to_reg(mem_to_reg),
        .mem_write(write), 
        .alu_sel(alu_sel), 
        .reg_write(reg_write),
        .alu_op(alu_op), 
        .op(op)
    );

    // Register file
    wire [31:0] s, t, d;
    RegisterFile c_regfile(
        .s(s),
        .t(t),
        .reg_s(reg_s),
        .reg_t(reg_t),
        .reg_d(reg_d_sel ? reg_d : reg_t),
        .d(d),
        .reg_write(reg_write)
    );

    // Sign extender
    wire [31:0] imm_ext;
    SignExtender c_se(
        .imm_ext(imm_ext),
        .imm(imm)
    );

    // ALU control
    wire [3:0] alu_mode;
    ALUControl c_aluctrl(
        .mode(alu_mode),
        .op(alu_op),
        .func(func)
    );

    // ALU
    wire [31:0] alu_z;
    wire alu_zero;
    ALU alu(
        .z(alu_z),
        .zero(alu_zero),
        .a(s),
        .b(alu_sel ? imm_ext : t),
        .mode(alu_mode)
    );

    // Memory
    assign wval = t;
    assign addr = alu_z;

    // Write back
    assign d = mem_to_reg ? rval : alu_z;

    // PC next
    PCNext pc_next(
        .next_pc(next_pc),
        .pc(pc),
        .imm(imm_ext),
        .addr(jump_addr),
        .jump(jump),
        .branch(branch),
        .zero(alu_zero)
    );
endmodule