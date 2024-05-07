`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module MEMORY_TB ;

//input
   reg CLK ;
   reg [15:0]IN ;
   reg [11:0]AR ;
   reg [15:0]IN_IR ;
   reg [2:0]t ;
//output     
   wire [15:0]Q_MEMORY;
   
   
//instaniate the unit under test
MEMORY uut(

   .CLK(CLK),
   .IN(IN),
   .AR(AR),
   .IN_IR(IN_IR),
   .t(t),
   .Q_MEMORY(Q_MEMORY)

);

//initiallize inputs
     initial begin 
      
       CLK = 0 ;
           forever 
               #50 CLK=~CLK ;
    
     end
     
     initial begin

#100 IN=16'h0000 ;   AR=16'h0003 ;   IN_IR=16'h0000 ;   t=3'b000 ;

#100 IN=16'h1111 ;   AR=16'h0000 ;   IN_IR=16'h3000 ;   t=3'b100 ;   //WR

#100 IN=16'h2222 ;   AR=16'h0001 ;   IN_IR=16'h6000 ;   t=3'b100 ;   //RD
     
     end

endmodule