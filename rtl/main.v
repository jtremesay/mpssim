module main(
    input clock, nreset
);
    wire [31:0] imem_val, imem_addr;
    ROM instr_mem(
        .val(imem_val),
        .addr(imem_addr)
    );

    wire [31:0] dmem_rval, dmem_wval, dmem_addr;
    wire dmem_we;
    RAM data_mem(
        .rval(dmem_rval),
        .wval(dmem_wval),
        .addr(dmem_addr)
        .we(dmem_we)
    );

    CPU cpu(
        .imem_val(imem_val),
        .imem_addr(imem_addr),
        .dmem_rval(dmem_rval),
        .dmem_wval(dmem_wval),
        .dmem_addr(dmem_addr),
        .dmem_we(dmem_we),
        .clock(clock),
        .nreset(nreset)
    );
endmodule