/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Aplicar mascara para SB e SH
 *
 * @author Ismael Cesar (ismael.cesar@ufrpe.br)
 */
 
 
 
 
 module APPLYMASK(CHOSEN_MASK, DATA, O, S);
 
input OPCODE;
input DATA;
output O;
input S;

//Sinal que vai determinar se vai aplicar a mascara de HALFWORD O BYTE
wire [1:0]CHOSEN_MASK;
wire [31:0] DATA;
wire [31:0] O;
wire S;

initial begin
	
	case(CHOSEN_MASK)
		2'h0: begin
			O = DATA;
		end
	
	endcase
end
 
 endmodule