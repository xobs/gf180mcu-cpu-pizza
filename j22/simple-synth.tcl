set vtop cpu

# Gain access to Yosys commands in the TCL world
yosys plugin -i systemverilog
yosys -import

read_systemverilog cpu.sv  cpuh.sv  ex.sv  id.sv  idec.sv  ma.sv  ml.sv  rf.sv

setattr -set ram_style "\"block\"" rf/gpr

synth -top $vtop -run begin:fine

memory_libmap -lib brams.txt
techmap -map brams_map.v

synth -top $vtop -run fine

# Use a SAT solver to determine which parts are shareable
share -aggressive

# export LIB_SYNTH="$PDK_ROOT/gf180mcuC/libs.ref/gf180mcu_fd_sc_mcu7t5v0/liberty/gf180mcu_fd_sc_mcu7t5v0__tt_025C_5v00.lib"
dfflibmap -liberty /si/conda/share/pdk/gf180mcuC/libs.ref/gf180mcu_fd_sc_mcu7t5v0/liberty/gf180mcu_fd_sc_mcu7t5v0__tt_025C_5v00.lib

# Give everything a reasonable name
autoname

write_verilog -noattr -noexpr -nohex -nodec -defparam output.v







# plugin -i systemverilog
# read_systemverilog cpu.sv  cpuh.sv  ex.sv  id.sv  idec.sv  ma.sv  ml.sv  rf.sv
# proc
# setattr -set ram_style "block" rf/gpr
# synth -top cpu -run begin:fine
# memory_libmap -lib +/ice40/brams.txt -lib +/ice40/spram.txt
# techmap -map +/ice40/brams_map.v -map +/ice40/spram_map.v
# # memory_libmap -lib brams.txt
# # techmap -map brams_map.v
# synth -top cpu -run fine
# dfflibmap -liberty /si/conda/share/pdk/gf180mcuC/libs.ref/gf180mcu_fd_sc_mcu7t5v0/liberty/gf180mcu_fd_sc_mcu7t5v0__tt_025C_5v00.lib
# autoname
# write_verilog -noattr -noexpr -nohex -nodec -defparam output.v
