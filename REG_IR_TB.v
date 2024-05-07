`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module REG_IR_TB ;
 
 //input
    reg CLK ;
    reg [15:0]IN_IR ;
    reg [2:0]t ;

 //output     
    wire [15:0]Q_IR ;
    
 //instaniate the unit under test
 REG_IR uut (
    
    .CLK(CLK),
    .IN_IR(IN_IR),
    .t(t),
    .Q_IR(Q_IR)
    
    );
    
 //initiallize inputs
   initial begin 
      
      CLK = 0 ;
         forever 
            #50 CLK=~CLK ;
            
   end
   
   initial begin
   
      #100   IN_IR = 16'h0000 ;   t = 3'b000 ;   
      #100   IN_IR = 16'h5123 ;   t = 3'b000 ;    
      #100   IN_IR = 16'h0000 ;   t = 3'b001 ;  //LD
      #100   IN_IR = 16'h5123 ;   t = 3'b001 ;  //LD
   
   end

endmodule