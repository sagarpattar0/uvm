
// Code your testbench here
// // or browse Examples
module simpleand_tb;
reg a;
reg b;
wire y;
reg en;
reg clk;
integer i;

simpleand inst(.ina(a), .inb(b), .outy(y), .inen(en), .inclk(clk));
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #100 $finish;
end
initial 
begin
  a <= 0;
  b <= 0;
  $monitor ("a=%0b b=%0b y=%0b", a, b, y);
  #10 en = 1;
  for (i=0; i< 4; i= i + 1)
  begin
    {a, b} = i;
    #10;
  end 
end
initial begin
  clk <= 1'b1;
end

//Clock generation
always
  #5 clk = ~clk;
  endmodule
