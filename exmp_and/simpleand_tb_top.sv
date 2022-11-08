`include "uvm_macros.svh"
import uvm_pkg::*;

`include "1simpleand_transaction.sv"
`include "2simpleand_sequence.sv"
`include "3simpleand_sequencer.sv"
`include "4simpleand_driver.sv"
`include "5simpleand_monitor.sv"
`include "6simpleand_agent.sv"
`include "7simpleand_scoreboard.sv"
`include "8simpleand_env.sv"
`include "9simpleand_test.sv"


`include "simpleand.v"
`include "simpleand_inf.sv"

module simpleand_tb_top;
//import uvm_pkg::*;

//Interface declaration
simpleand_inf ainf();

//Connects the Interface to the DUT
simpleand dut(ainf.a,
ainf.b,
ainf.y,
ainf.clk,
ainf.en);
initial begin
  //Registers the Interface in the configuration block
  //so that other blocks can use it
  uvm_resource_db#(virtual simpleand_inf)::set(.scope("ifs"),.name("simpleand_inf"),.val(ainf));

  //Executes the test
  run_test();
end                                                                                                                                                                                       
//Variable initialization
initial begin
  ainf.clk = 1'b1;
end

//Clock generation
always
  #5 ainf.clk = ~ainf.clk;
endmodule


  /*

  import uvm_pkg::*;
  `include "uvm_macros.svh";
  `include "seq_item.sv";
  `include "seqrr.sv";
  `include "sequenc.sv";
  `include "drivr.sv"
  `include "agnt.sv"
  `include "env.sv"
  `include "test.sv"

  module top;

  initial begin
    run_test("test");
  end
  endmodule

  */
