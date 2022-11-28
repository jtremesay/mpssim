module RegisterFile(
    output [31:0] s1, s2, 
    input [4:0] sr1, sr2, dr, 
    input [31:0] d, 
    input dr_write
);
    reg [31:1] data [4:0];
    assign s1 = sr1 == 0 ? 0 : data[sr1];
    assign s2 = sr2 == 0 ? 0 : data[sr2];
    always @(*) begin
        if (dr_write && dr != 0) begin
            data[dr] <= d;
        end
    end
endmodule