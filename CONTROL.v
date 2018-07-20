/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * Controle
 *
 * @author Andr� Aziz (andre.caraujo@ufrpe.br)
 */

`define OPCODE_TIPO_R 6'b000000
`define OPCODE_ADDI   6'b001000
`define OPCODE_LW     6'b100011
`define OPCODE_SW     6'b101011
`define OPCODE_BEQ    6'b000100
`define OPCODE_BNE    6'b000101
`define OPCODE_J      6'b000010

//Outros OPCODES de intruçoes do tipo I
`define OPCODE_ORI    6'b001101
`define OPCODE_ANDI   6'b001100
`define OPCODE_SLTI   6'b001010
`define OPCODE_SLTIU  6'b001011
		//Opcodes para dados unsigned
`define OPCODE_ADDIU  6'b001001

		//Outros tipos de Stores and Loads
`define OPCODE_SB     6'b101001
`define OPCODE_SH     6'b101000
`define OPCODE_LH     6'b100001
`define OPCODE_LB     6'b100000	
`define OPCODE_LHU    6'b100101
`define OPCODE_LBU    6'b100100
`define OPCODE_LUI    6'b001111

`define OPCODE_JAL 	 6'b000011

`define ALUOP_ADDI    6'b000000
`define ALUOP_LW      6'b000000
`define ALUOP_SW      6'b000000
`define ALUOP_BEQ     6'b000001
`define ALUOP_TIPO_R  6'b000010

module CONTROL(
  nrst,
  opcode,
  branch,
  read_mem,
  write_mem,
  write_reg,
  mux_write_rt_rd,
  mux_alu_src_reg_imm,
  alu_op,
  mux_branch_jump,
  mux_pc_branch,
  mux_reg_src_alu_mem,
  mux_j_type_addr_to_write  
);

input nrst;
input opcode;
output branch;
output read_mem;
output write_mem;
output write_reg;
output  mux_write_rt_rd;
output mux_alu_src_reg_imm;
output alu_op;
output mux_branch_jump;
output mux_pc_branch;
output mux_reg_src_alu_mem;
output mux_j_type_addr_to_write;

wire nrst;
wire [5:0] opcode;
reg branch;
reg read_mem;
reg write_mem;
reg write_reg;
reg [1:0]mux_write_rt_rd;
reg mux_alu_src_reg_imm;
reg [5:0] alu_op;
reg mux_branch_jump;
reg mux_pc_branch;
reg mux_reg_src_alu_mem;
reg mux_j_type_addr_to_write;

initial begin
  branch 		= 0;
  read_mem 		= 0;
  write_mem 		= 0;
  write_reg 		= 0;
  alu_op 		= `ALUOP_TIPO_R;
  mux_write_rt_rd 	= 1;
  mux_alu_src_reg_imm 	= 0;
  mux_branch_jump 	= 1;
  mux_pc_branch 	= 0;
  mux_reg_src_alu_mem 	= 1;
  mux_j_type_addr_to_write = 1;
end

always @(nrst, opcode) begin : decode_thread

  if (nrst == 0) begin
    branch 		= 0;
    read_mem 		= 0;
    write_mem 		= 0;
    write_reg 		= 0;
    alu_op 		= `ALUOP_TIPO_R;
    mux_write_rt_rd 	= 1;
    mux_alu_src_reg_imm = 0;
    mux_branch_jump 	= 1;
    mux_pc_branch 	= 0;
    mux_reg_src_alu_mem = 1;  
	 mux_j_type_addr_to_write = 1;
  end
  else begin
    case (opcode)
 
    `OPCODE_TIPO_R: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `ALUOP_TIPO_R;
      mux_write_rt_rd 		= 1;
      mux_alu_src_reg_imm 	= 0;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 1;
		mux_j_type_addr_to_write = 1;		
    end
  
    `OPCODE_ADDI: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `ALUOP_ADDI;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 1;  
		mux_j_type_addr_to_write = 1;
    end
 
    `OPCODE_LW: begin
      branch 			= 0;
      read_mem 			= 1;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `ALUOP_LW;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 0;  
		mux_j_type_addr_to_write = 1;
    end

    `OPCODE_SW: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 1;
      write_reg 		= 0;
      alu_op 			= `ALUOP_SW;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 0;  
		mux_j_type_addr_to_write = 1;
    end

    `OPCODE_BEQ: begin
      branch 			= 1;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 0;
      alu_op 			= `ALUOP_BEQ;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 0;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 1;
      mux_reg_src_alu_mem 	= 0;  
		mux_j_type_addr_to_write = 1;
    end
	 
	 `OPCODE_BNE: begin
      branch 			= 1;//Fio que vai para o a porta and para ser comparado com o ZERO da ula
      read_mem 		= 0;
      write_mem 		= 0;
      write_reg 		= 0;
      alu_op 			= `ALUOP_BEQ;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 0;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 1;
      mux_reg_src_alu_mem 	= 0;  
		mux_j_type_addr_to_write = 1;
    end
		
	//Implementando as instruçoes tipo I
	`OPCODE_ORI: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `OPCODE_ORI;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 1;  
		mux_j_type_addr_to_write = 1;
    end
	 
	 `OPCODE_LUI: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `OPCODE_LUI;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 1;  
		mux_j_type_addr_to_write = 1;
    end
	 
	 `OPCODE_ANDI: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `OPCODE_ANDI;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 1;  
		mux_j_type_addr_to_write = 1;
    end
	
	`OPCODE_SLTI: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `OPCODE_SLTI;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 1;  
		mux_j_type_addr_to_write = 1;
    end
	 
	 `OPCODE_SLTIU: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `OPCODE_SLTIU;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 1;
      mux_branch_jump 		= 1;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 1;  
		mux_j_type_addr_to_write = 1;
    end
		
    `OPCODE_J: begin
      branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 0;
      alu_op 			= `ALUOP_TIPO_R;
      mux_write_rt_rd 		= 0;
      mux_alu_src_reg_imm 	= 0;
      mux_branch_jump 		= 0;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 0;  
		mux_j_type_addr_to_write = 1;
    end
	 
	 `OPCODE_JAL: begin
		branch 			= 0;
      read_mem 			= 0;
      write_mem 		= 0;
      write_reg 		= 1;
      alu_op 			= `ALUOP_TIPO_R;
      mux_write_rt_rd 		= 2;
      mux_alu_src_reg_imm 	= 0;
      mux_branch_jump 		= 0;
      mux_pc_branch 		= 0;
      mux_reg_src_alu_mem 	= 0;
		mux_j_type_addr_to_write = 0; // Escreve em $RA
	 end
	 
    endcase
  end
end

endmodule
