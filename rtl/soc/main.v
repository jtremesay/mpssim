module main(
    output [31:0] instr, pc, rval, wval, addr,
    output write,
    input clock, nreset
);
    wire [31:0] instr, pc;
    ROM instr_mem(
        .val(instr),
        .addr(pc)
    );

    wire [31:0] rval, wval, addr;
    wire write;
    RAM data_mem(
        .rval(rval),
        .wval(wval),
        .addr(addr),
        .we(write)
    );

    CPU cpu(
        .instr(instr),
        .pc(pc),
        .rval(rval),
        .wval(wval),
        .addr(addr),
        .write(write),
        .clock(clock),
        .nreset(nreset)
    );
endmodule