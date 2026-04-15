`timescale 1ns / 1ps
module instructionMemory#(
    parameter OPERAND_LENGTH = 31
)(
    input  wire [OPERAND_LENGTH:0] instAddress,
    output reg  [31:0]             instruction
);
    reg [7:0] memory [0:255];

    initial begin
        $readmemh("instruction.mem", memory);
    end

    always @(*) begin
        instruction[7:0]   = memory[instAddress]; //lsb (to right)
        instruction[15:8]  = memory[instAddress + 1];
        instruction[23:16] = memory[instAddress + 2];
        instruction[31:24] = memory[instAddress + 3];// msb to left
        //0x(31:24)(23:16)(15:8)(7:0)
    end
endmodule