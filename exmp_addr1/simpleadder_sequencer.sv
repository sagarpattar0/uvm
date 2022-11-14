class simpleadder_transaction extends uvm_sequence_item;
	rand bit [1:0]ina;
	rand bit [1:0]inb;
	bit [2:0]out;


	`uvm_object_utils_begin(simpleadder_transaction)
		`uvm_field_int(ina, UVM_ALL_ON | UVM_BIN)
		`uvm_field_int(inb, UVM_ALL_ON + UVM_BIN)
		`uvm_field_int(out, UVM_ALL_ON + UVM_BIN)
	`uvm_object_utils_end
	
  function new(string name = "");
		super.new(name);
	endfunction: new
endclass: simpleadder_transaction

class simpleadder_sequence extends uvm_sequence#(simpleadder_transaction);
	`uvm_object_utils(simpleadder_sequence)

	function new(string name = "");
		super.new(name);
	endfunction: new

	task body();
		simpleadder_transaction sa_tx;
	sa_tx=simpleadder_transaction::type_id::create("sa_tx");	
	/*	repeat(15) begin
//		sa_tx = simpleadder_transaction::type_id::create(.name("sa_tx"), .contxt(get_full_name()));

		start_item(sa_tx);
		assert(sa_tx.randomize());
		//`uvm_info("sa_sequence", sa_tx.sprint(), UVM_LOW);
		finish_item(sa_tx);
		end
    */
   for(int i =0;i<10;i++)begin 
      `uvm_do_with(sa_tx,{ina == 2'b10; inb == 2'b11;})
   end
	endtask: body
endclass: simpleadder_sequence

class simpleadder_sequencer extends uvm_sequencer#(simpleadder_transaction);
  `uvm_component_utils(simpleadder_sequencer)
  
  function new(string name = "simpleadder_sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
endclass

//typedef uvm_sequencer#(simpleadder_transaction) simpleadder_sequencer;
