transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/ULA.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/SIGN_EXTEND.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/SHIFT_LEFT_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/REGISTER_BANK.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/REGISTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/MUX21.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/MIPS.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/IMEM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/DMEM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/CONTROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/ALU_CONTROL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/ADDER.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/mux31.v}
vlog -vlog01compat -work work +incdir+C:/Users/Familia/Documents/GitHub/mips_verilog {C:/Users/Familia/Documents/GitHub/mips_verilog/CMP_BRANCH.v}

