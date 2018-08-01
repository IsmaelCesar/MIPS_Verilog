/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Aplicar mascara para SB e SH
 *
 * @author Ismael Cesar (ismael.cesar@ufrpe.br)
 */
 
 `define MASK_HALFWORD = 32'h0000ffff
 `define MASK_BYTE = 32'h000000ff
 
module APPLYMASK(CHOSEN_MASK, DATA, O); 
 
//input OPCODE;
input DATA;
input CHOSEN_MASK;
output O;

//Sinal que vai determinar se vai aplicar a mascara de HALFWORD O BYTE
//wire [5:0] OPCODE;
wire [1:0]CHOSEN_MASK;
wire [31:0] DATA;
wire [31:0] O;


assign O = (CHOSEN_MASK == 2'b00)? DATA: (CHOSEN_MASK == 2'b01)? DATA & 32'h0000ffff : DATA & 32'h000000ff;

/*initial begin
	
	case(CHOSEN_MASK)
		
		2'b00:begin
			O = A;
		end
		
		2'b01:begin
			O = A & MASK_HALFWORD;
		end
		
		2'b10:begin
			O = A & MASK_BYTE;
		end	
	endcase
end
 */
 endmodule