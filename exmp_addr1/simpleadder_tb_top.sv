
`include "uvm_macros.svh"
	import uvm_pkg::*;
//`include "uvm_macros.svh"
  // import uvm_pkg::*;

   `include "simpleadder_sequencer.sv"
   `include "simpleadder_driver.sv"
   `include "simpleadder_monitor.sv"
   `include "simpleadder_agent.sv"
   `include "simpleadder_scoreboard.sv"
   `include "simpleadder_config.sv"
   `include "simpleadder_env.sv"
   `include "simpleadder_test.sv"
//`include "simpleadder_pkg.sv"
`include "simpleadder.v"
`include "simpleadder_if.sv"

module simpleadder_tb_top;
//	import uvm_pkg::*;

//Interface declaration
simpleadder_if vif();

//Connects the Interface to the DUT
simpleadder dut(vif.sig_clock,
vif.sig_en_i,
vif.sig_ina,
vif.sig_inb,
vif.sig_en_o,
vif.sig_out);

initial begin
  //Registers the Interface in the configuration block so that other
  //blocks can use it
  uvm_resource_db#(virtual simpleadder_if)::set
  (.scope("ifs"), .name("simpleadder_if"), .val(vif));

  //Executes the test
  run_test("simpleadder_test");
end

//Variable initialization
initial begin
  vif.sig_clock <= 1'b1;
end

//Clock generation
always
  #5 vif.sig_clock = ~vif.sig_clock;
  endmodule
