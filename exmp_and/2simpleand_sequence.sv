`include "uvm_macros.svh"
import uvm_pkg::*;

class simpleand_sequence extends uvm_sequence#(simpleand_transaction);
   `uvm_object_utils(simpleand_sequence)
simpleand_transaction sa_tx;
// seq_item si;
  
  function new (string name = "" );
    super.new(name);
  endfunction

  //virtual task body();
  task body();

//    simpleand_transaction sa_tx;

      repeat(15) begin
        sa_tx=simpleand_transaction::type_id::create("sa_tx");

        start_item(sa_tx);
          assert(sa_tx.randomize);
        finish_item(sa_tx);
      end
    endtask


/*begin
  si = seq_item::type_id::create("si");
  `uvm_info("Sequence","Sequence item id created",UVM_NONE)

  wait_for_grant();
assert(si.randomize());
  `uvm_info("Sequence",$sformatf("randomised value,a:%0d, b:%0d",si.a,si.b),UVM_NONE);
  `uvm_info("Sequence","Randomization done and now sent request to driver",UVM_NONE)
  send_request(si);
  `uvm_info("Sequence","waiting for item done response from driver",UVM_NONE)
  wait_for_item_done();
  `uvm_info("Sequence","Ack.recievd from driver,Sequence ended",UVM_NONE)
end*/

endclass

