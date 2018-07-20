/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Mux 3 para 1.
 *
 * @author Ismael Cesar (ismael.cesar@ufrpe.br)
 */
 
 
 
 `define RETURN_ADDRES_REG_NUMBER 32'h1F; //31 -> Endereço de RA no MIPS reference data
 `define PC_ADDRES_REG_NUMBER 	 32'h1F; //31 -> Endereço de RA no MIPS reference data
 
 /*Sinal que entra no MUX é modificado
	Caso a instrução seja  jal, O mux manda o RA como registrador destino
 */
 
module MUX31(A,
				 B,
				 O,
				 S);

parameter DATA_WIDTH = 32;
parameter SIGNAL_WIDTH = 2;

input A;
input B;
input S;
output O;

wire [DATA_WIDTH-1:0] A;
wire [DATA_WIDTH-1:0] B;
wire  [DATA_WIDTH-1:0] O;
wire [SIGNAL_WIDTH-1:0]S;

assign O = (S == 2'h0)? A: (S == 2'h1)? B : `RETURN_ADDRES_REG_NUMBER;


endmodule