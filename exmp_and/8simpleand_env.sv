`include "uvm_macros.svh"
import uvm_pkg::*;

class simpleand_env extends uvm_env;
`uvm_component_utils(simpleand_env)

simpleand_agent sa_agent;
simpleand_scoreboard sa_sb;

function new(string name, uvm_component parent);
  super.new(name, parent);
endfunction: new

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  sa_agent    = simpleand_agent::type_id::create("sa_agent",this);
  sa_sb        = simpleand_scoreboard::type_id::create("sa_sb",this);
endfunction: build_phase

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  sa_agent.agent_ap_before.connect(sa_sb.sb_export_before);
  sa_agent.agent_ap_after.connect(sa_sb.sb_export_after);
endfunction: connect_phase
endclass: simpleand_env
                                                                                                                       /*
                                                                                                                       //ENVIRONMENT CLASS
                                                                                                                       class env extends uvm_env;
                                                                                                                         `uvm_component_utils(env)

                                                                                                                         agent a;

                                                                                                                         function new (string name = "env",uvm_component parent = null);
                                                                                                                           super.new(name,parent);
                                                                                                                         endfunction

                                                                                                                         virtual function void build_phase(uvm_phase phase);
                                                                                                                         super.build_phase(phase);
                                                                                                                         a = agent::type_id::create("a",this);
                                                                                                                       endfunction

                                                                                                                       //objection is used to hold the simulator
                                                                                                                       //
                                                                                                                     endclass
                                                                                                                     */
