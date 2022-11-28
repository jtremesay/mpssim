module ROM #(
    parameter SIZE=256
) (
    output reg [31:0] val, 
    input [31:0] addr
);
    reg [31:0] data [SIZE - 1:0];

    always @(*) begin
        val <= data[addr];
    end

endmodule