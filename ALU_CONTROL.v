/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Controle da ULA
 *
 * @author Andr� Aziz (andre.caraujo@ufrpe.br)
 */
module ALU_CONTROL (
  funct,
  op,
  control
);

input funct;
input op;
output control;

wire [5:0] funct;
wire [5:0] op;
wire [3:0] control;

assign control = (op == 6'b000000) ? 4'b0010 :
                 (op == 6'b000001) ? 4'b0110 :
						//Tipo I -> O próprio OP code da instruçao é utilizado
					  (op == 6'001101) ? 4'b0001 : //ori
					  (op == 6'001100) ? 4'b0000 : //andi
					  (op == 6'001001) ? 4'b0100 : //addiu
					  (op == 6'001010) ? 4'b0111 : //slti
					  (op == 6'001011) ? 4'b0110 : //sltiu
					  
					  //Tipo R -> Pois precisam do campo funct
                 (op == 6'b00010 && funct == 6'b100101) ? 4'b0001 :
					  (op == 6'b00010 && funct == 6'b100110) ? 4'b0011 : //XOR
					  (op == 6'b00010 && funct == 6'b100000) ? 4'b0010 :
                 (op == 6'b00010 && funct == 6'b100010) ? 4'b0110 :
                 (op == 6'b00010 && funct == 6'b100100) ? 4'b0000 :
                 (op == 6'b00010 && funct == 6'b101010) ? 4'b0111 :
					  (op == 6'b00010 && funct == 6'b101011) ? 4'b1000 : //mult
					  (op == 6'b00010 && funct == 6'b100001) ? 4'b0100 : //addu
					  (op == 6'b00010 && funct == 6'b100011) ? 4'b0101 : //subu
					  (op == 6'b00010 && funct == 6'b101011) ? 4'b0110 : //sltu
					  (op == 6'b00010 && funct == 6'b101011) ? 4'b1001 : //multu
                  4'b0000;

endmodule