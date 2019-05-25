set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
# Switch
set_property PULLDOWN true [get_ports options]
set_property IOSTANDARD LVCMOS18 [get_ports options]
set_property PACKAGE_PIN AB7 [get_ports {options[1]}]
set_property PACKAGE_PIN AB8 [get_ports {options[0]}]

# LED
set_property IOSTANDARD LVCMOS18 [get_ports led]
set_property PACKAGE_PIN B2 [get_ports {led[7]}]
set_property PACKAGE_PIN N3 [get_ports {led[6]}]
set_property PACKAGE_PIN M3 [get_ports {led[5]}]
set_property PACKAGE_PIN K3 [get_ports {led[4]}]
set_property PACKAGE_PIN H3 [get_ports {led[3]}]
set_property PACKAGE_PIN N4 [get_ports {led[2]}]
set_property PACKAGE_PIN L4 [get_ports {led[1]}]
set_property PACKAGE_PIN J4 [get_ports {led[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports seg]
set_property PACKAGE_PIN H19 [get_ports {seg[7]}]
set_property PACKAGE_PIN G20 [get_ports {seg[6]}]
set_property PACKAGE_PIN J22 [get_ports {seg[5]}]
set_property PACKAGE_PIN K22 [get_ports {seg[4]}]
set_property PACKAGE_PIN K21 [get_ports {seg[3]}]
set_property PACKAGE_PIN H20 [get_ports {seg[2]}]
set_property PACKAGE_PIN H22 [get_ports {seg[1]}]
set_property PACKAGE_PIN J21 [get_ports {seg[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports which]
set_property PACKAGE_PIN N22 [get_ports {which[0]}]
set_property PACKAGE_PIN M21 [get_ports {which[1]}]
set_property PACKAGE_PIN M22 [get_ports {which[2]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN L21} [get_ports enable]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN H4} [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets swb_IBUF[1]]
# Switch Button?????
set_property IOSTANDARD LVCMOS18 [get_ports swb]
set_property PACKAGE_PIN V8  [get_ports {swb[1]}]
set_property PACKAGE_PIN AA8 [get_ports {swb[0]}]