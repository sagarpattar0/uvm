`include "uvm_macros.svh"
import uvm_pkg::*;

class simpleand_driver extends uvm_driver#(simpleand_transaction);
  `uvm_component_utils(simpleand_driver)
 // seq_item si;

  // interface declaration
  protected virtual simpleand_inf ainf;

  function new(input string name = "simpleand_driver",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
    void'(uvm_resource_db#(virtual simpleand_inf)::read_by_name(.scope("ifs"),.name("simpleand_inf"),.val(ainf)));
  endfunction
  
  virtual task run_phase(uvm_phase phase);
  //si = seq_item::type_id::create("si");
    forever begin
      `uvm_info("Driver","Waiting for data from sequencer",UVM_NONE);


//get item from sequencer using get_next method
seq_item_port.get_next_item(req);
drive();
`uvm_info("Driver",$sformatf("Finish driving data, a:%0d b:%0d",req.ina,req.inb),UVM_NONE);
seq_item_port.item_done();
end
endtask

virtual task drive();
  simpleand_transaction sa_tx;

  integer counter =0,state =0;
  ainf.a=1'b0;
  ainf.b=1'b0;
  ainf.en=1'b0;

    forever begin
      if (counter==0)begin
        //gets a transaction from the sequencer and
        //stores it in the variable 'sa_tx'
        seq_item_port.get_next_item(sa_tx);
      end

      @(posedge ainf.clk)
        begin
          if(counter==0)begin
            ainf.en=1'b1;
            state=1;
          end

          if(counter==1)begin
            ainf.en=1'b0;
          end

          case(state)
            1:begin
                ainf.a=sa_tx.ina[1];
                ainf.b=sa_tx.inb[1];

               // sa_tx.ina = sa_tx.ina &lt;&lt; 1;
               // sa_tx.inb = sa_tx.inb &lt;&lt; 1;
                
               counter = counter +1;
               if (counter==2) state=2;
             end

             2:begin
               ainf.a=1'b0;
               ainf.b=1'b0;
               counter=counter + 1;

               if(counter==6) begin
                 counter=0;
                 state=0;

                 //informs the sequencer that the
                 //current operation with
                 //the transaction was finshed
                 seq_item_port.item_done();
               end
             end
           endcase
         end
       end
endtask


endclass
