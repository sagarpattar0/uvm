`include "uvm_macros.svh"

class simpleand_test extends uvm_test;
  `uvm_component_utils(simpleand_test)

  simpleand_env sa_env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sa_env = simpleand_env::type_id::create("sa_env",this);
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    simpleand_sequence sa_seq;

    phase.raise_objection(.obj(this));
    sa_seq = simpleand_sequence::type_id::create("sa_seq",this);
    assert(sa_seq.randomize());
    sa_seq.start(sa_env.sa_agent.sa_seqr);
    phase.drop_objection(.obj(this));
  endtask: run_phase
endclass: simpleand_test



/*
//TEST CLASS
class test extends uvm_test;
  `uvm_component_utils(test)

  seq s;
  env e;

  function new(string name = "test", uvm_component parent =null);
    super.new(name,parent);
  endfunction


  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  s=seq::type_id::create("s");
  e=env::type_id::create("e",this);
endfunction

virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
s.start(e.a.s);
phase.drop_objection(this);
endtask

endclass

*/
