/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Unidade L�gica e Aritm�tica - ULA - de 32 bits.
 *
 * @author Andr� Aziz (andre.caraujo@ufrpe.br)
 */

module ULA (
  A,   	      // Operando A
  B,           // Operando B
  S,           // Resultado
  OP,          // Sele��o da opera��o
  Z            // Indica que o resultado � zero.
);

input [31:0] A;
input [31:0] B;
input [3:0] OP;
output [31:0] S;
output Z;

wire signed [31:0] A, B;


reg unsigned [31:0] C,D;
//reg unsigned [31:0] E;

wire [3:0] OP;
reg signed [31:0] S;
reg Z;

initial begin
  S = 0;
  Z = 0;
end
	
always @ (A or B or OP) begin : operacoes_ula
	
	//Fazendo atribuiçoes para registradores usigned *GAMBIARRA!!!!!
	if(A < 32'h0)begin
		C = -A;
	 end
	 else begin
		C = A;
	 end
	 if(B < 32'h0)begin
		D = -B;
	 end
	 else begin
		D = B;
	 end

  case (OP)
		  
  // S = A & B
  4'b0000: begin 
    S = A & B;
  end
			
  // S = A | B
  4'b0001: begin
    S = A | B;  
  end
		    
  // S = A + B
  4'b0010: begin
    S = A + B;
  end
	
  // S = A - B 
  4'b0110: begin
    S = A - B;
  end

  // S = A < B
  4'b0111: begin
    S = (A < B) ? 1 : 0;
  end
		  
  // S = ~(A | B)
  4'b1100: begin
    S = ~(A | B);
  end

  // S = A ^ B 
  4'b0011: begin
	 S = A ^ B;
  end
  
  //Operaçoes que são unsigned
  //S = unsigned A + B 
  4'b0100: begin 	 
	 S = C + D;
  end
  
  //S = unsigned A - B 
  4'b0101: begin 
	 S = C - D;
  end
  
  //S = unsigned (A < B)? 1 : 0; 
  4'b1011: begin 
	 S =  (C < D)? 1 : 0;
  end
  
  // S = A * B
  4'b1000:begin
	 S = A  * B;
  end
  
  //S = unsigned A * B
  4'b1001:begin
	 S = C * B;
  end
  
  //LUI
  4'b1010:begin
	 S = B << 16;
  end
  
  4'b1100:begin
   S = A + (B & 32'h000000ff);
  end
  
  4'b1101:begin
   S = A + (B & 32'h0000ffff);
  end
  
  //Se for break 
  4'b1111:begin
	 $finish;
  end
  
  default: begin
    S = 0;
  end

  endcase

  Z = (S == 0) ? 1'b1 : 1'b0;	
end

endmodule
