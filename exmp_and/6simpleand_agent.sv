`include "uvm_macros.svh"
import uvm_pkg::*;

class simpleand_agent extends uvm_agent;
  `uvm_component_utils(simpleand_agent)

  //Analysis ports to connect the monitors to the scoreboard
  uvm_analysis_port#(simpleand_transaction) agent_ap_before;
  uvm_analysis_port#(simpleand_transaction) agent_ap_after;

  simpleand_sequencer        sa_seqr;
  simpleand_driver        sa_drvr;
  simpleand_monitor_before    sa_mon_before;
  simpleand_monitor_after    sa_mon_after;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    agent_ap_before    = new(.name("agent_ap_before"), .parent(this));
    agent_ap_after    = new(.name("agent_ap_after"), .parent(this));

    sa_seqr        = simpleand_sequencer::type_id::create("sa_seqr",this);
    sa_drvr        = simpleand_driver::type_id::create("sa_drvr",this);
    sa_mon_before    = simpleand_monitor_before::type_id::create("sa_mon_before",this);
    sa_mon_after    = simpleand_monitor_after::type_id::create("sa_mon_after",this);
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    sa_drvr.seq_item_port.connect(sa_seqr.seq_item_export);
    sa_mon_before.mon_ap_before.connect(agent_ap_before);
    sa_mon_after.mon_ap_after.connect(agent_ap_after);
  endfunction: connect_phase
endclass: simpleand_agent

/*
class agent extends uvm_agent;
  `uvm_component_utils(agent)

  sequencer s;
  driver d;

  function new(string name="agent",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  d=driver::type_id::create("DRV",this);
  s = sequencer::type_id::create("s",this);
endfunction

//connecting driver and sequencer
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
d.seq_item_port.connect(s.seq_item_export);
endfunction

endclass
*/
