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


module CMP_BRANCH(branch,Z,S);

wire branch;
wire Z;

input branch;
input branch;

reg S;
output S;

assign S = ((branch && Z) || (branch && !Z));
	

endmodule