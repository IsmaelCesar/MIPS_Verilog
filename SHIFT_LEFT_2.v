/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Shift left de 2 bits.
 *
 * @author Andr� Aziz (andre.caraujo@ufrpe.br)
 */
module SHIFT_LEFT_2(
  A,
  O
);

input A;
output O;

wire [31:0] A;
wire [31:0] O;

//assign O = A << 2;

assign O[31:2] = A[29:0];
assign O[1:0] = 0;

endmodule