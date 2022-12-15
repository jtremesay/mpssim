module RegisterFile(
    output [31:0] s, t, 
    input [4:0] reg_s, reg_t, reg_d, 
    input [31:0] d, 
    input reg_write
);
    reg [31:0] registers [31:1]; // r0 is read-only, we only declare r1 to r31
    assign s = reg_s == 0 ? 0 : registers[reg_s];
    assign t = reg_t == 0 ? 0 : registers[reg_t];
    always @(*) begin
        if (reg_write && reg_d > 0) begin
            registers[reg_d] <= d;
        end
    end
endmodule