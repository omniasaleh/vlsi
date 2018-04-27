vsim -gui work.accelerator
# vsim -gui work.accelerator 
# Start time: 20:59:57 on Apr 17,2018
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.pkg
# Loading work.accelerator(accflow)
# Loading work.counter(counterflow)
# Loading work.alu(aluflow)
# Loading work.ndffrising(a_my_ndff)
# Loading work.mynadder(data_flow)
# Loading work.myadder(data_flow)
# Loading work.sumplus(dataflow)
# ** Warning: Design size of 17790 statements exceeds ModelSim-Intel FPGA Starter Edition recommended capacity.
# Expect performance to be adversely affected.
add wave -position insertpoint  \
sim:/accelerator/clk \
sim:/accelerator/rst \
sim:/accelerator/enp \
sim:/accelerator/ena \
sim:/accelerator/rstcnt \
sim:/accelerator/enablecnt \
sim:/accelerator/input \
sim:/accelerator/finishmul \
sim:/accelerator/outalu
force -freeze sim:/accelerator/clk 1 0, 0 {50 ps} -r 100
add wave -position insertpoint  \
sim:/accelerator/clk \
sim:/accelerator/rst \
sim:/accelerator/enp \
sim:/accelerator/ena \
sim:/accelerator/rstcnt \
sim:/accelerator/enablecnt \
sim:/accelerator/inst \
sim:/accelerator/f \
sim:/accelerator/input \
sim:/accelerator/result \
sim:/accelerator/finishacc \
sim:/accelerator/finishmul \
sim:/accelerator/rstcnt1 \
sim:/accelerator/outcnt1 \
sim:/accelerator/outalu
force -freeze sim:/accelerator/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/accelerator/rst 1 0
run
force -freeze sim:/accelerator/rst 0 0
force -freeze sim:/accelerator/ena 1 0
force -freeze sim:/accelerator/enp 0 0
force -freeze sim:/accelerator/inst 0 0
force -freeze sim:/accelerator/f 0 0
force -freeze sim:/accelerator/enablecnt 0 0
force -freeze sim:/accelerator/input(0) 11111111 0
force -freeze sim:/accelerator/input(1) 11111111 0

force -freeze sim:/accelerator/input(0) 11111111 0
force -freeze sim:/accelerator/input(2) 11111111 0
force -freeze sim:/accelerator/input(3) 11111111 0
force -freeze sim:/accelerator/input(4) 11111111 0
force -freeze sim:/accelerator/input(5) 11111111 0
force -freeze sim:/accelerator/input(6) 11111111 0
force -freeze sim:/accelerator/input(7) 11111111 0
force -freeze sim:/accelerator/input(8) 11111111 0
force -freeze sim:/accelerator/input(9) 11111111 0
force -freeze sim:/accelerator/input(10) 11111111 0
force -freeze sim:/accelerator/input(11) 11111111 0
force -freeze sim:/accelerator/input(12) 11111111 0
force -freeze sim:/accelerator/input(13) 11111111 0
force -freeze sim:/accelerator/input(14) 11111111 0
force -freeze sim:/accelerator/input(15) 11111111 0
force -freeze sim:/accelerator/input(16) 11111111 0
force -freeze sim:/accelerator/input(17) 11111111 0

force -freeze sim:/accelerator/input(18) 11111111 0
force -freeze sim:/accelerator/input(19) 11111111 0
force -freeze sim:/accelerator/input(20) 11111111 0
force -freeze sim:/accelerator/input(21) 11111111 0
force -freeze sim:/accelerator/input(22) 11111111 0
force -freeze sim:/accelerator/input(23) 11111111 0
force -freeze sim:/accelerator/input(24) 11111111 0
run
add wave -position insertpoint sim:/accelerator/loop1(0)/alu0/a/*
add wave -position insertpoint sim:/accelerator/loop1(0)/alu0/p/*
force -freeze sim:/accelerator/ena 0 0
force -freeze sim:/accelerator/enp 1 0
add wave -position insertpoint sim:/accelerator/cnt1/*
force -freeze sim:/accelerator/rstcnt 1 0
run
force -freeze sim:/accelerator/enp 0 0
force -freeze sim:/accelerator/rstcnt 0 0
force -freeze sim:/accelerator/enablecnt 1 0
run
