module ProgramCounter(
    output reg [31:0] pc, 
    input [31:0] pc_next,
    input clock, nreset
);
    always @(posedge clock, negedge nreset) begin
        if (!nreset) begin
            pc <= 0;
        end else begin
            pc <= pc_next;
        end
    end
endmodule
