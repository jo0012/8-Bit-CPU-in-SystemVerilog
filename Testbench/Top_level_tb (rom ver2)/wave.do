onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 30 Input
add wave -noupdate /Top_level_tb/in_clk
add wave -noupdate /Top_level_tb/rstn
add wave -noupdate /Top_level_tb/inputSignalData
add wave -noupdate -divider Output
add wave -noupdate -radix unsigned /Top_level_tb/DUT/yBCD1/yBcdIn
add wave -noupdate /Top_level_tb/ySegHundData
add wave -noupdate /Top_level_tb/ySegTenData
add wave -noupdate /Top_level_tb/ySegOneData
add wave -noupdate /Top_level_tb/CF
add wave -noupdate /Top_level_tb/ZF
add wave -noupdate -divider {Program Counter and opcode}
add wave -noupdate -radix unsigned /Top_level_tb/DUT/PCxMUX1/addr_PC
add wave -noupdate /Top_level_tb/DUT/CU1/opcode
add wave -noupdate -divider Registers
add wave -noupdate -radix unsigned /Top_level_tb/DUT/aReg/RegIn
add wave -noupdate -radix unsigned /Top_level_tb/DUT/aReg/RegOut
add wave -noupdate -radix unsigned /Top_level_tb/DUT/bReg/RegIn
add wave -noupdate -radix unsigned /Top_level_tb/DUT/bReg/RegOut
add wave -noupdate -radix unsigned /Top_level_tb/DUT/yReg/RegIn
add wave -noupdate -radix unsigned /Top_level_tb/DUT/yReg/RegOut
add wave -noupdate -divider bMUX
add wave -noupdate /Top_level_tb/DUT/CU1/B_sel_CU
add wave -noupdate /Top_level_tb/DUT/bMux1/B_selMUX
add wave -noupdate /Top_level_tb/DUT/bMux1/bit_extend
add wave -noupdate /Top_level_tb/DUT/bMux1/bData
add wave -noupdate /Top_level_tb/DUT/bMux1/inSwitch
add wave -noupdate /Top_level_tb/DUT/bMux1/bBusMUX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {45875 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 261
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {230816 ps}
