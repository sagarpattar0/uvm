`include "uvm_macros.svh"
import uvm_pkg::*;

class simpleand_transaction extends uvm_sequence_item;
  rand bit [1:0]ina;
  rand bit [1:0]inb;
       bit [1:0 ]y;
       bit [1:0]en;
       bit clk;

  function new(string name="");
    super.new(name);
  endfunction

  `uvm_object_utils_begin(simpleand_transaction)
  `uvm_field_int(ina,UVM_ALL_ON)
  `uvm_field_int(inb,UVM_ALL_ON)
  `uvm_field_int(y,UVM_ALL_ON)
  `uvm_field_int(en,UVM_ALL_ON)
  `uvm_field_int(clk,UVM_ALL_ON)
  `uvm_object_utils_end

endclass 
