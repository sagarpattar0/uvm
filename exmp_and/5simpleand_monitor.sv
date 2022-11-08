`include "uvm_macros.svh"
import uvm_pkg::*;

class simpleand_monitor_before extends uvm_monitor;
  `uvm_component_utils(simpleand_monitor_before)

   uvm_analysis_port#(simpleand_transaction) mon_ap_before;

   virtual simpleand_inf ainf;

   function new(string name,uvm_component parent);
     super.new(name,parent);
   endfunction

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

       void'(uvm_resource_db#(virtual simpleand_inf)::read_by_name (.scope("ifs"), .name("simpleand_inf"), .val(ainf)));
      mon_ap_before = new(.name("mon_ap_before"), .parent(this));
    endfunction

    task run_phase(uvm_phase phase);
          //Our code is here
    endtask

endclass

class simpleand_monitor_after extends uvm_monitor;
  `uvm_component_utils(simpleand_monitor_after)

  uvm_analysis_port#(simpleand_transaction) mon_ap_after;

  virtual simpleand_inf ainf;

  simpleand_transaction sa_tx_cg;

  covergroup simpleand_cg;
    ina_cp:     coverpoint sa_tx_cg.ina;
    inb_cp:     coverpoint sa_tx_cg.inb;
    cross ina_cp, inb_cp;
  endgroup: simpleand_cg

  function new(string name, uvm_component parent);
    super.new(name, parent);
    simpleand_cg = new;
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    void'(uvm_resource_db#(virtual simpleand_inf)::read_by_name(.scope("ifs"), .name("simpleand_inf"), .val(ainf)));
    mon_ap_after= new(.name("mon_ap_after"), .parent(this));
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    //Our code here
        endtask: run_phase
 endclass: simpleand_monitor_after
