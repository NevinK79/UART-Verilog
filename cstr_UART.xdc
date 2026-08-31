
# Clock signal - Uncomment if needed (will be used in future labs)
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 

#7 segment display
set_property PACKAGE_PIN W7 [get_ports {Data[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data[6]}]
set_property PACKAGE_PIN W6 [get_ports {Data[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data[5]}]
set_property PACKAGE_PIN U8 [get_ports {Data[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data[4]}]
set_property PACKAGE_PIN V8 [get_ports {Data[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data[3]}]
set_property PACKAGE_PIN U5 [get_ports {Data[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data[2]}]
set_property PACKAGE_PIN V5 [get_ports {Data[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data[1]}]
set_property PACKAGE_PIN U7 [get_ports {Data[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Data[0]}]


set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]



set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]

 



#USB-RS232 Interface
set_property PACKAGE_PIN B18 [get_ports RxD]						
	set_property IOSTANDARD LVCMOS33 [get_ports RxD]





