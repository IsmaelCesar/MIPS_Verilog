/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Controle da MUX41
 *
 * @author Ismael cesar (ismael.cesar@ufrpe.br)
 */
 
`define RETURN_ADDRES_REG_NUMBER 32'h1F;
`define ZERO_REG_NUMBER 32'h00;
 
 module MUX41(
    A,
	 B,
    O1,
	 O2,
	 S
 );
 
 input A;
 input B;
 output O1;
 output O2;
 input S;
 
 wire [5:0]A;
 wire [5:0]B;
 wire [5:0]O1;
 wire [5:0]O2;
 wire S;
 
 assign O1 = (S == 1)?  A : 32'h1F;
 assign O2 = (S == 1)?  B : 32'h00;
  
 endmodule  