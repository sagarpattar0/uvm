compile:
					vlib work;
					vlog -sv simpleand_tb_top.sv

simulate:
					vsim top -l get_next_log.log -c -do "run -all;exit;"

all:
				clear;
				
				vlog -sv simpleand_tb_top.sv
				vsim simpleand_tb_top -l get_next_log.log -c -do "run -all;exit;"

clear:
				clear
