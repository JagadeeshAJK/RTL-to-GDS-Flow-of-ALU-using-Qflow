module ALU_tb;
reg [7:0] At, Bt;
reg [3:0] selectt;
reg clkt;
wire [7:0] ALU_outt;
wire Carry_outt;
integer i;
ALU test(.A(At),.B(Bt),.select(selectt),.clk(clkt),.ALU_out(ALU_outt),.Carry_out(Carry_outt));

initial begin
clkt=1'b0;
forever 
#1 clkt=~clkt;

end


initial
begin

$dumpfile("alu.vcd");
$dumpvars(0,ALU_tb);
At=8'd30;
Bt=8'd20;
selectt=4'd0;

for(i=0;i<15;i=i+1)
begin
selectt = i;
#10;
end

#10 $finish;
end


endmodule
