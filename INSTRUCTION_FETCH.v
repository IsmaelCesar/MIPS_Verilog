/*
*	Pegango o Program counter e adicionando mais quatro
*	
* Authors Grupo 4: 
* Lucas Francisco
* Pedro Assis
* Igor Rodrigues
* Ismael Cesar
*/

module INSTRUCTION_FETCH(clk,rst,pc_out,constant_4,adder_pc_4);

input clk;
input rst;
input pc_out;
input constant_4;

output adder_pc_4;

wire clk;
wire rst;
wire [31:0]constant_4;
wire [31:0] pc_out;

reg [31:0]adder_pc_4;

always@(posedge clk)
begin
	//Caso o reset for igual a zero
	if(rst!= 1) 
	begin
		adder_pc_4 = pc_out + constant_4;
	end
	else begin
		//Zerando a saida do program counter
		adder_pc_4 = 32'h00000000;
	end
end

endmodule