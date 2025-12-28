`timescale 1ns / 1ps


module ALU_8bit(
    input [7:0]A,B,
    input [3:0]ALU_Sel,
    output reg [7:0]ALU_Result
    );
    
    always @(*) begin
    
    case(ALU_Sel)
    
    4'b0000: ALU_Result = A+B; // Addition
    4'b0001: ALU_Result = A-B; // Subtraction
 // 4'b0010: ALU_Result = A*B; // Multiplication is not possible with 8 bit register requires 16 bits
    4'b0011: ALU_Result = A/B; //Division
    4'b0100: ALU_Result = A<<1; //Left Shift by 1 bit
    4'b0101: ALU_Result = A>>1; // Right Shift by 1 bit
    4'b0110: ALU_Result = {A[6:0],A[7]}; // Left Rotation by 1 bit
    4'b0111: ALU_Result = {A[0],A[7:1]}; // Right Rotation by 1bit
    4'b1000: ALU_Result = A&B; //AND
    4'b1001: ALU_Result = A|B; // OR
    4'b1010: ALU_Result = A^B; // XOR
    4'b1011: ALU_Result = ~(A&B); // NAND
    4'b1100: ALU_Result = ~(A|B); // NOR
    4'b1101: ALU_Result = ~(A^B); // XNOR
    4'b1110: ALU_Result = (A>B)?8'b1:8'b0; // Greater comparision
    4'b1111: ALU_Result = (A==B)?8'b1:8'b0; // Equal comparision 
    default: ALU_Result = 8'bX;
    endcase
 
    end
    
endmodule
