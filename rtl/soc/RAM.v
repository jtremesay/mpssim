module RAM #(
    parameter SIZE=256
) (
    output [31:0] rval, 
    input [31:0] wval, addr, 
    input we
);
    reg [31:0] data [SIZE - 1:0];

    assign rval = data[addr];
    always @(*) begin
        if (we) begin
            data[addr] <= wval;
        end
    end
endmodule