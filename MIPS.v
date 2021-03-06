/**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 * 
 * MIPS Top Level
 *
 * @author Andr� Aziz (andre.caraujo@ufrpe.br)
 */
module MIPS (
  clk, 
  nrst
);

input clk;
input nrst;

wire clk;
wire nrst;

wire [31:0] FOUR_CONST;

wire [31:0] PC_out;

wire [31:0] ADDER_PC_INCR_out;

wire [31:0] IMEM_instr;

wire [31:0] MUX_PC_BRANCH_out;
wire [31:0] MUX_BRANCH_JUMP_out;
wire [31:0] MUX_ALU_SRC_REG_IMM_out;


wire [31:0] MUX_REG_SRC_ALU_MEM_out;
wire [31:0] MUX_REG_SELECT_JAL_ALU_MEM_out;

wire [4:0] MUX_WRITE_RT_RD_out;

wire [31:0] REGISTER_BANK_read_data_1_out;
wire [31:0] REGISTER_BANK_read_data_2_out;

wire [31:0] SIGN_EXTEND_out;

wire [31:0] SHIFT_BRANCH_out;

wire [31:0] ADDER_BRANCH_out;

wire [31:0] ULA_out;
wire ULA_zero;

wire [3:0] ALU_CONTROL_out;

wire [31:0] DMEM_out;

wire [31:0] SHIFT_JUMP_out;

wire CONTROL_branch;
wire CMP_BRANCH_OUT;
wire CONTROL_read_mem;
wire CONTROL_write_mem;
wire CONTROL_write_reg;
wire [1:0]CONTROL_mux_write_rt_rd;
wire CONTROL_mux_alu_src_reg_imm;
wire [5:0] CONTROL_alu_op;
wire CONTROL_mux_branch_jump;
wire CONTROL_mux_pc_branch;
wire CONTROL_mux_reg_src_alu_mem;
wire CONTROL_mux_j_type_addr_to_write;
wire CONTROL_mux_j_type_addr_to_read;
assign FOUR_CONST = 4;

//Implementacoes  para jr
wire [5:0] select_jr_or_instruction_addr_out1;
wire [5:0] select_jr_or_instruction_addr_out2;
wire [31:0] mux_set_return_addr_out;

//MASK
wire [31:0] APPLYMASK_out;
wire [1:0] CONTROL_apply_mask;

CONTROL control (
  .nrst(nrst),
  .opcode(IMEM_instr[31:26]),
  .branch(CONTROL_branch),
  .read_mem(CONTROL_read_mem),
  .write_mem(CONTROL_write_mem),
  .write_reg(CONTROL_write_reg),
  .mux_write_rt_rd(CONTROL_mux_write_rt_rd),
  .mux_alu_src_reg_imm(CONTROL_mux_alu_src_reg_imm),
  .alu_op(CONTROL_alu_op),
  .mux_branch_jump(CONTROL_mux_branch_jump),
  .mux_pc_branch(CONTROL_mux_pc_branch),
  .mux_reg_src_alu_mem(CONTROL_mux_reg_src_alu_mem),
  .mux_j_type_addr_to_write(CONTROL_mux_j_type_addr_to_write),
  .mux_j_type_addr_to_read(CONTROL_mux_j_type_addr_to_read),
  .apply_mask(CONTROL_apply_mask)
);



REGISTER pc (
  .clk(clk),
  .nrst(nrst),
  .A(MUX_BRANCH_JUMP_out),
  .O(PC_out)
);



IMEM imem (
  .address(PC_out),
  .instruction(IMEM_instr)
);


/*
* Multiplexador auxiliar para mandar o endereço do registrador $ra
* caso a instruçao seja um jr ou um jall
*/
MUX31 mux_write_rt_rd (
  .A(IMEM_instr[20:16]),
  .B(IMEM_instr[15:11]),
  .O(MUX_WRITE_RT_RD_out),
  .S(CONTROL_mux_write_rt_rd)
);


/**
* Se o sinal CONTROL_mux_j_type_addr_to_write == 0, retorna o valor a ser gravado no $ra
*/
MUX21 select_jal_alu_mem_src(
	.A(PC_out),
	.B(MUX_REG_SRC_ALU_MEM_out),
	.O(MUX_REG_SELECT_JAL_ALU_MEM_out),
	.S(CONTROL_mux_j_type_addr_to_write)
);


/*
* Implementando multiplexador para escolher entre endereços de registradores
* caso seja um JR então é lido retornando o endereço de $ra, Multiplexador auxiliar
*/
MUX41 select_jr_or_instruction_addr(
	.A(IMEM_instr[25:21]),
	.B(IMEM_instr[20:16]),
	.O1(select_jr_or_instruction_addr_out1),
	.O2(select_jr_or_instruction_addr_out2),
	.S(CONTROL_mux_j_type_addr_to_read)
);


REGISTER_BANK register_bank (
  .clk(clk),
  .write(CONTROL_write_reg),
  .write_data(MUX_REG_SELECT_JAL_ALU_MEM_out),
  .write_address(MUX_WRITE_RT_RD_out),
  .read_address_1(select_jr_or_instruction_addr_out1),//IMEM_instr[25:21]
  .read_address_2(select_jr_or_instruction_addr_out2),//IMEM_instr[20:16]
  .read_data_1(REGISTER_BANK_read_data_1_out),
  .read_data_2(REGISTER_BANK_read_data_2_out)
);

SIGN_EXTEND sign_extend (
  .A(IMEM_instr[15:0]),
  .O(SIGN_EXTEND_out)
);


MUX21 mux_alu_src_reg_imm (
  .A(REGISTER_BANK_read_data_2_out),
  .B(SIGN_EXTEND_out),
  .O(MUX_ALU_SRC_REG_IMM_out),
  .S(CONTROL_mux_alu_src_reg_imm)
);

ULA ula (
  .A(REGISTER_BANK_read_data_1_out),   	       
  .B(MUX_ALU_SRC_REG_IMM_out),           
  .S(ULA_out),           
  .OP(ALU_CONTROL_out),          
  .Z(ULA_zero)            
);


//Comparador branch
CMP_BRANCH branch_type_comarator(
	.branch(CONTROL_branch),
	.Z(ULA_zero),
	.S(CMP_BRANCH_OUT)
);


ALU_CONTROL alu_control (
  .funct(IMEM_instr[5:0]),
  .op(CONTROL_alu_op),
  .control(ALU_CONTROL_out)
);

APPLYMASK mask(
.CHOSEN_MASK(CONTROL_apply_mask),
.DATA(REGISTER_BANK_read_data_2_out),
.O(APPLYMASK_out)
);

DMEM dmem (
  .clk(clk),
  .write_data(APPLYMASK_out),//REGISTER_BANK_read_data_2_out
  .read_data(DMEM_out),
  .write(CONTROL_write_mem),
  .read(CONTROL_read_mem),
  .address(ULA_out)
);

MUX21 mux_reg_src_alu_mem (
  .A(DMEM_out),
  .B(ULA_out),
  .O(MUX_REG_SRC_ALU_MEM_out),
  .S(CONTROL_mux_reg_src_alu_mem)
);

ADDER adder_pc_incr (
  .A(PC_out),
  .B(FOUR_CONST),
  .O(ADDER_PC_INCR_out) // <- Essa saida foi reutilizada mais abaixo
);

SHIFT_LEFT_2 shift_branch (
  .A(SIGN_EXTEND_out),
  .O(SHIFT_BRANCH_out)
);

ADDER adder_branch (
  .A(ADDER_PC_INCR_out),
  .B(SHIFT_BRANCH_out),
  .O(ADDER_BRANCH_out)
);

MUX21 mux_pc_branch (
  .A(ADDER_PC_INCR_out),
  .B(ADDER_BRANCH_out),
  .O(MUX_PC_BRANCH_out),
  .S(CONTROL_mux_pc_branch)
);

SHIFT_LEFT_2 shift_jump (
  .A({6'b000000, IMEM_instr[25:0]}),//{6'b000000, IMEM_instr[25:0]}
  .O(SHIFT_JUMP_out)
);


/*
*Multiplexador auxiliar para carregar os dados lidos no RA
*/
MUX21 mux_set_return_addr(
	.A(REGISTER_BANK_read_data_1_out),
	.B(SHIFT_JUMP_out),
	.O(mux_set_return_addr_out),
	.S(CONTROL_mux_j_type_addr_to_read) //O sinal dizpara o RA se for iqual a zero
);

MUX21 branch_jump (
  .A({ADDER_PC_INCR_out[31:28], mux_set_return_addr_out[27:0]}), //{PC_out[31:28], SHIFT_JUMP_out[27:0]}
  .B(MUX_PC_BRANCH_out),
  .O(MUX_BRANCH_JUMP_out),//
  .S(CONTROL_mux_branch_jump)
);

endmodule