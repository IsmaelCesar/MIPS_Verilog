/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Mem�ria de instru��es.
 *
 * @author Andr� Aziz (andreaziz@deinfo.ufrpe.br)
 */
//`define MEMORY_HEX
 
module IMEM (
  address,
  instruction
);

parameter SIZE = 32'h0800;
//<Endereco absoluto>
parameter MEMORY_FILE = "memory.bin"; // Tem que colocar o endereço absoluto pra funcionar normalmente

input address;
output instruction;

wire [31:0] address;
wire [31:0] instruction;
reg [31:0] ROM [0:(SIZE>>2)-1];

initial begin : load_default_memory
  integer   index;
  
  for (index = 0; index < (SIZE>>2); index = index + 1)
	ROM[index] = 0;
  
  $readmemh(MEMORY_FILE, ROM);
  
end

assign instruction = ROM[(address-4)>>2];  

endmodule