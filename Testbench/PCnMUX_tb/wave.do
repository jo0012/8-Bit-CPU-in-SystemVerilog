onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /PCnMUX_tb/in_clk
add wave -noupdate /PCnMUX_tb/in_rstn
add wave -noupdate /PCnMUX_tb/write_pc
add wave -noupdate /PCnMUX_tb/PC_sel
add wave -noupdate -radix decimal /PCnMUX_tb/cBusData
add wave -noupdate -radix decimal /PCnMUX_tb/addr_PC
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {194986 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 224
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
WaveRestoreZoom {0 ps} {379556 ps}
