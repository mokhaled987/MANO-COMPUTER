`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module COMMEN_BUS_TB ;

//input
   reg [15:0]IN_IR ;
   reg [2:0]t ;
//output    
   wire [2:0]s ;
  
  
//instaniate the unit under test
COMMEN_BUS uut (

   .IN_IR(IN_IR),
   .t(t),
   .s(s)

);


 //initiallize inputs
   initial begin

#300   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X1  for 000
#200   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X4


#300   IN_IR = 16'h6000 ;   t = 3'b100 ;  // X1  for 001
#200   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X4

#300   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X1  for 010
#200   IN_IR = 16'h5000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X4

#300   IN_IR = 16'h4000 ;   t = 3'b100 ;  // X1  for 011
#200   IN_IR = 16'h5000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X4

#300   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X1  for 100
#200   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h3000 ;   t = 3'b100 ;  // X4

#300   IN_IR = 16'h4000 ;   t = 3'b100 ;  // X1  for101
#200   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h3000 ;   t = 3'b100 ;  // X4

#300   IN_IR = 16'h0000 ;   t = 3'b100 ;  // X1  for 110
#200   IN_IR = 16'h5000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h3000 ;   t = 3'b100 ;  // X4

#300   IN_IR = 16'h4000 ;   t = 3'b100 ;  // X1  for 111
#200   IN_IR = 16'h5000 ;   t = 3'b100 ;  // X2
#100   IN_IR = 16'h3000 ;   t = 3'b100 ;  // X4

   end
 
endmodule