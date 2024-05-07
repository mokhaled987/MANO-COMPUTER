module ALU(

//--------(ALU 8-bit Inputs)--------- 
    input wire[15:0] Q_AC,Q_DR, 
//-------(input IR To know opration form B)-------
    input wire[15:0]IN_IR,
//-------(input from seq_counter_3_bit)-------
    input[2:0]t,
    input CLK,
//--------(ALU 8-bit Result)--------- 
    output reg[15:0] AC
    
    );
    
reg [3:0]IN_IR_test;
reg [11:0]B;
reg [7:0]T;

initial 
   AC = 0;
   
      always @(posedge CLK) begin
             
//-----------(select T)-----------    
        
            case(t)    
                4'b000: T = 8'h01;
                4'b001: T = 8'h02;
                4'b010: T = 8'h04;
                4'b011: T = 8'h08;
                4'b100: T = 8'h10;
                4'b101: T = 8'h20;
                4'b110: T = 8'h40;
                4'b111: T = 8'h80;
            endcase
      end
             
      always@(posedge CLK)begin
        
//-----------(select B)-----------    

            if(~IN_IR[15] && IN_IR[14] && IN_IR[13] && IN_IR[12] && ~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0] && T[3])
                AC = AC + 1;
            else if(~IN_IR[15] && IN_IR[14] && IN_IR[13] && IN_IR[12] && ~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0] && T[3])
                AC = {AC[14:0],AC[15]}; 
            else if(~IN_IR[15] && IN_IR[14] && IN_IR[13] && IN_IR[12] && ~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0] && T[3])
                AC = {AC[0],AC[15:1]}; 
            else if(~IN_IR[15] && IN_IR[14] && IN_IR[13] && IN_IR[12] && ~IN_IR[11] && ~IN_IR[10] && IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0] && T[3])
                AC = ~AC;
            else if(~IN_IR[15] && IN_IR[14] && IN_IR[13] && IN_IR[12] && IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0] && T[3])
                AC = 0 ;                                         
            if(~IN_IR[15] && ~IN_IR[14] && ~IN_IR[13] && ~IN_IR[12] && T[5])
                AC = AC ^ Q_DR;
            else if(~IN_IR[15] && ~IN_IR[14] && ~IN_IR[13] && IN_IR[12] && T[5])
                AC = AC + Q_DR;
            else if(~IN_IR[15] && ~IN_IR[14] && IN_IR[13] && ~IN_IR[12] && T[5])
                AC = Q_DR;

      end   
             
endmodule