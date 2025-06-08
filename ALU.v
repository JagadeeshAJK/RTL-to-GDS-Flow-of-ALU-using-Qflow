module ALU(

input [7:0] A, B,
input [3:0] select,
input clk,
output [7:0] ALU_out,
output Carry_out

);

reg [7:0] ALU_result;
wire [8:0] tmp;


assign ALU_out = ALU_result;
assign tmp = {1'b0, A} + {1'b0,B};
assign Carry_out = tmp[8];



always @(posedge clk)
begin

case (select)
4'b0000: //Addition
ALU_result = A + B;
4'b0001: //Substractin
ALU_result = A - B;
4'b0010: //Multiplication
ALU_result = A*B ;
4'b0011: //Division
ALU_result = A / B;
4'b0100: //Logical left shift on A
ALU_result = A <<1 ;
4'b0101: //Logical shift right on A
ALU_result = A >>1 ;
4'b0110: //Rotate left on A
ALU_result = {A[6:0], A[7]};
4'b0111: //Rotate right on A
ALU_result = {A[0], A[7:1]};
4'b1000: //Logical AND
ALU_result = A &B;
4'b1001: //Logical OR 
ALU_result = A |B;
4'b1010: //Logical xor
ALU_result = A ^ B;
4'b1011: //Logical NAND
ALU_result =~( A & B);
4'b1100: //Logical NOR
ALU_result = ~(A+B);
4'b1101: //Logical XNOR
ALU_result = ~(A^B);
4'b1110: //Greater comparision
ALU_result = (A>B)?8'd1:8'd0;
4'b1111: // Equal Comparision
ALU_result = ( A==B )?8'd1:8'd0;

default:
ALU_result = A + B;

endcase

end //ending of case

endmodule
