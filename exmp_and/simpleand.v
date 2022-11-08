module simpleand(
  input wire a,
  input wire b,
  output wire y,
input wire en,
input wire clk);

int counter, state;
//if(en==1)begin
  assign y = a&&b; //Y = A&&B; // Y is the opposite of end
  endmodule
