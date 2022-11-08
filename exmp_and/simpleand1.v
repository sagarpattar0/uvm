

// Code your design here
module simpleand(
  input ina,
  input inb,
  input inen,
  input inclk,
  output reg  outy);

  always @ (inclk)
  begin
  if(inen) begin
   outy = ina&&inb; //Y = A&&B; // Y is the opposite of A
  end
end
  endmodule

