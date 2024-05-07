`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module ALU_TB ;

 //input
    reg CLK ;
    reg [15:0] Q_AC,Q_DR ; 
    reg [15:0]IN_IR ;

//output 
    wire [15:0] ALU_Result ;


//instaniate the unit under test
ALU uut (
    
    .CLK(CLK),
    .Q_AC(Q_AC),
    .Q_DR(Q_DR),
    .IN_IR(IN_IR),
    .ALU_Result(ALU_Result)
    
);

//initiallize inputs
     initial begin 
      
        CLK = 0 ;
            forever 
                #50 CLK=~CLK ;
    
     end
     
     initial begin
     
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'ha000 ;     //Q_AC ^ Q_DR   1111
                 
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h0000 ;     //Q_AC + Q_DR 
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'hf000 ;     //(Q_AC == Q_DR)?16'd1:16'd0
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h7000 ;     //(Q_AC == ~ Q_AC)
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h7000 ;     //{Q_AC[0],Q_AC[15:1]}
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h6000 ;     //{Q_AC[14:0],Q_AC[15]}
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h1000 ;     //Q_AC - Q_DR   1111
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h2000 ;     //Q_AC * Q_DR   6666   
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h3000 ;     //Q_AC / Q_DR   2222 
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h4000 ;     //Q_AC << 1 
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h5000 ;     //Q_AC >> 1 
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'h8000 ;     //Q_AC & Q_DR   1111
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'b1001000000000000 ;     //Q_AC | Q_DR   1111
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'b1011000000000000 ;     //~(Q_AC | Q_DR)    0000
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'b1100000000000000 ;     //~(Q_AC & Q_DR)    0000
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'b1101000000000000 ;     //(Q_AC < Q_DR)?16'd1:16'd0 
        
        #100   Q_AC=16'h0002 ;   Q_DR=16'h0003 ;   IN_IR=16'b1110000000000000 ;     //(Q_AC > Q_DR)?16'd1:16'd0
 
     end

endmodule