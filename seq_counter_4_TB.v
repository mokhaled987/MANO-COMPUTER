`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module seq_counter_4_TB ;

 //input
   reg CLK ;
   reg [15:0]IN_IR ;
 
 //output    
   wire [2:0]t ;
   
 //instaniate the unit under test
seq_counter_4 uut (

   .CLK(CLK),
   .IN_IR(IN_IR), 
   .t(t)
      
);

//initiallize inputs
   initial begin 
   
       CLK = 0 ;
           forever 
               #50 CLK=~CLK ;
    
    end
    
    initial begin
    
        #100   IN_IR = 16'h0000 ;    
          
        #100   IN_IR = 16'h4123 ;     //INC
        
        #200   IN_IR = 16'h6123 ;     //r
        #100   IN_IR = 16'h0000 ;     //clr
              
    end
      
endmodule