`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module REG_DR_TB ;

//input
    reg CLK ;
    reg [15:0]IN_IR ;
    reg [15:0]IN ;
    reg [2:0]t ;

//output    
    wire [15:0]Q_DR ;

    
//instaniate the unit under test
REG_DR uut(

   .CLK(CLK),
   .IN_IR(IN_IR),
   .IN(IN),
   .t(t),
   .Q_DR(Q_DR)

);


//initiallize inputs
   initial begin 
   
       CLK = 0 ;
          forever 
             #50 CLK=~CLK ;
   
   end
   
   initial begin

      #100   IN_IR = 16'h0000 ;   IN = 16'h0000 ;   t = 3'b000 ;   
      #100   IN_IR = 16'h0000 ;   IN = 16'h1234 ;   t = 3'b000 ;    
    
      #100   IN_IR = 16'h0000 ;   IN = 16'h0000 ;   t = 3'b100 ;  //LD
      #100   IN_IR = 16'h0000 ;   IN = 16'h1234 ;   t = 3'b100 ;
    
      #100   IN_IR = 16'h6123 ;   IN = 16'h0000 ;   t = 3'b101 ;  //INC
   
   end
   
endmodule