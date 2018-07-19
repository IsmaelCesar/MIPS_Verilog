/*
*Universidade Federal Rural de Pernambuco
*Modulo para comparaçao de branch implementando 
*BEQ ou BNE
*O módulo pega o sinal Z da ula e o sinal branch
*Da unidade de controle e verifica se a operacao
*a ser efetuada é de BEQ ou BNE
*Mandando o sinal para o MUX
*
*
*@author Ismael Cesar
*/


module CMP_BRANCH(
	branch,
	Z,
	S
);

input branch;
input Z;

wire branch;
wire Z;

reg S;
output S;
always@* begin
	S = ((branch & Z) || (branch & !Z));
end	

endmodule