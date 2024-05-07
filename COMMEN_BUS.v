module COMMEN_BUS(

//-------(input IR to know B)-------
    input [15:0]IN_IR,
//-------(input from seq_counter_3_bit)-------
    input[2:0]t,
//-------(output from selection of commen bus)-------    
    output [2:0]s,
    output [7:0]X
    
    );
    
//-------(wire to help)------- 
    reg i;   
    reg [3:0]d;
    reg [7:0]S;
    reg [7:0]D;
    reg [7:0]T;
    reg [10:0]B;
    wire Dn;

   initial S = 0;
     
      always@(d or t or IN_IR)begin
            
//-----------------(SELECT MOST LEFT 4-BIT IN INSTRACTION REGISTER)----------------- 
                 
                    if(~IN_IR[14] && ~IN_IR[13] && ~IN_IR[12])
                        d = 4'b0000;
                    else if(~IN_IR[14] && ~IN_IR[13] && IN_IR[12])
                        d = 4'b0001;
                    else if(~IN_IR[14] && IN_IR[13] && ~IN_IR[12])
                        d = 4'b0010;
                    else if(~IN_IR[14] && IN_IR[13] && IN_IR[12])
                        d = 4'b0011;
                    else if(IN_IR[14] && ~IN_IR[13] && ~IN_IR[12])
                        d = 4'b0100;
                    else if(IN_IR[14] && ~IN_IR[13] && IN_IR[12])
                        d = 4'b0101;
                    else if( IN_IR[14] && IN_IR[13] && ~IN_IR[12])
                        d = 4'b0110;
                    else if(IN_IR[14] && IN_IR[13] && IN_IR[12])
                        d = 4'b0111;
                    else if(IN_IR[15])
                        i = 1;
  
//------------------(select D)----------------    
  
          case(d)    
              4'b000: D = 8'h01;
              4'b001: D = 8'h02;
              4'b010: D = 8'h04;
              4'b011: D = 8'h08;
              4'b100: D = 8'h10;
              4'b101: D = 8'h20;
              4'b110: D = 8'h40;
              4'b111: D = 8'h80;
          endcase
          
//------------------(select T)----------------    
  
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
             
      always@(posedge IN_IR)begin
          
//-----------(select B)-----------    

          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0000000000001;
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& IN_IR[0])
              B = 13'b0000000000010;      
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && IN_IR[1]&& ~IN_IR[0])
              B = 13'b0000000000100;
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0000000001000;  
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0000000010000;
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0000000100000;
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0000001000000;
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0000010000000;
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 12'b0000100000000;          
          if(~IN_IR[11] && ~IN_IR[10] && ~IN_IR[9] && IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0001000000000;
          if(~IN_IR[11] && ~IN_IR[10] && IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0010000000000;
          if(~IN_IR[11] && IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b0100000000000;
          if(~IN_IR[11] && IN_IR[10] && ~IN_IR[9] && ~IN_IR[8] && ~IN_IR[7] && ~IN_IR[6] && ~IN_IR[5] && ~IN_IR[4]&& ~IN_IR[3] && ~IN_IR[2] && ~IN_IR[1]&& ~IN_IR[0])
              B = 13'b1000000000000;
      end        
            assign Dn = ~D[7];   
            assign X[0] = 0;                                                                        //NONE
            assign X[1] = ( T[4] & D[4] ) | ( D[5] & T[5] );                                        //AR
            assign X[2] = T[0] | (T[4] & D[5]);                                                     //PC
            assign X[3] = ( D[2] & T[5] ) | ( D[6] & T[6] );                                        //DR
            assign X[4] = ( D[3] & T[4] ) ;                                                         //AC
            assign X[5] = T[2];                                                                     //IR                                                                             
            assign X[6] = 0;                                                                        //TR
            assign X[7] = ( T[1] ) | ( ( D[0] | D[1] | D[2] | D[6] ) & T[4] ) | Dn & i & T[3];   //MEMORY       
            
            assign s =
                 (X[7] == 1'b1) ? 3'b111:
                 (X[6] == 1'b1) ? 3'b110:
                 (X[5] == 1'b1) ? 3'b101:
                 (X[4] == 1'b1) ? 3'b100:
                 (X[3] == 1'b1) ? 3'b011:
                 (X[2] == 1'b1) ? 3'b010:
                 (X[1] == 1'b1) ? 3'b001:
                 (X[0] == 1'b1) ? 3'b000: 3'bxxx;  
      
      
endmodule