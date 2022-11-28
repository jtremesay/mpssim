module CPU(
    input [31:0] instr,
    output [31:0] pc,
    input [31:0] rval,
    output [31:0] wval, addr,
    output write,
    input clock, nreset
);
    // Program counter
    wire [31:0] pc_next;
    ProgramCounter c_pc(
        .pc(pc), 
        .pc_next(pc_next),
        .clock(clock), 
        .nreset(nreset)
    );

    PCLogic c_pclogic(
        .pc_next(pc_next),
        .pc(pc), 
        .jump_addr(jump_addr),
        .branch_addr(imm_ext),
        .jump(jump),
        .branch(branch),
        .zero(alu_zero),
    );



    // Instruction decode
    wire [4:0] sr1, sr2, dr;
    wire [15:0] imm;
    wire [25:0] jump_addr;
    wire [5:0] alu_func, op;
    InstructionDecoder c_id(
        .sr1(sr1),
        .sr2(sr2),
        .dr(dr),
        .imm(imm),
        .jump_addr(jump_addr),
        .alu_func(alu_func),
        .instr(instr),
        .op(op)
    );

    // Control unit
    wire dr_sel, jump, branch, mem_to_reg, alu_op, mem_write, alu_sel, dr_write;
    Control c_ctrl(
        .dr_sel(dr_sel), 
        .jump(jump), 
        .branch(branch), 
        .mem_to_reg(mem_to_reg),
        .alu_op(alu_op), 
        .mem_write(write), 
        .alu_sel(alu_sel), 
        .dr_write(dr_write),
        .op(op)
    );

    // Register file
    wire [31:0] s1, s2, d;
    RegisterFile c_regfile(
        .s1(s1),
        .s2(s2),
        .sr1(sr1),
        .sr2(sr2),
        .dr(dr_sel ? dr : sr2),
        .d(d),
        .dr_write(dr_write)
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
        .func(alu_func)
    );

    // ALU
    wire [31:0] alu_z;
    wire alu_zero;
    ALU alu(
        .z(alu_z),
        .zero(alu_zero),
        .a(s1),
        .b(alu_sel ? imm_ext : s2),
        .mode(alu_mode)
    );

    // Memory
    assign wval = s2;
    assign addr = alu_z;

    // Write back
    assign d = mem_to_reg ? rval : alu_z;
endmodule