`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module mano_tb;

// Signals
    reg CLK;
    wire [11:0] Q_PC;
    wire [11:0] Q_AR;
    wire [15:0] Q_IR;
    wire [15:0] Q_DR;
    wire [15:0] AC;
    wire [2:0]  t;


// Instantiate the mano module
    mano dut (
    
        .CLK(CLK),
        .Q_IR(Q_IR),
        .Q_PC(Q_PC),
        .Q_AR(Q_AR),
        .Q_DR(Q_DR),
        .AC(AC),
        .t(t)
        
          );

// Clock generation
    initial begin 
       
        CLK = 0 ;           
           forever 
             #50 CLK=~CLK;
             
    end

endmodule

