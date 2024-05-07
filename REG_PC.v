module REG_PC( 

//-------(clock)-------
    input CLK,
//-------(input IR)-------
    input [15:0]IN_IR,
//-------(input to register PC)-------
    input[15:0]IN,
//-------(input from seq_counter_3_bit)-------
    input[2:0]t,
//-------(output from register PC)-------    
    output reg[11:0]Q_PC
    
    );
//-------(wire to help)-------
reg i;    
reg [3:0]d;
reg [7:0]D;
reg [7:0]T;
reg [12:0]B;
wire LD_PC,INC_PC,CLR_PC,r,p;

    initial
        begin
            i = 0;
            D = 0;
            B = 0;
            T = 0;
            d = 0;
            Q_PC = 0;

    end  
    
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
           else if(IN_IR[14] && IN_IR[13] && ~IN_IR[12])
                d = 4'b0110;
           else if(IN_IR[14] && IN_IR[13] && IN_IR[12])
                d = 4'b0111;
           else if(IN_IR[15])
                i = 1;
      
//-----------(select D)-----------    

            case(d)    
                4'b000: D = 8'h01;
                4'b001: D = 8'h02;
                4'b010: D = 8'h04;
                4'b011: D = 8'h08;
                4'b100: D = 8'h10;
                4'b101: D = 8'h20;
                4'b110: D = 8'h40;
                4'b111: D = 8'h80;
                4'b111: D = 8'h80;
            endcase
            
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
            
//-----------(select B)-----------    
         
    always@(posedge CLK)begin
            
    
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
        

//---------( Funtion of lD & CLR & INC)---------
 
assign r  = D[7] & ~i & T[3];
assign p = D[7] & i & T[3];

    always@(posedge CLK)begin

//-----------------For Load (LD_PC)-----------------  
           
            if(( D[4] && T[4] ) || (D[5] && T[5]))
               Q_PC = IN;
           
//-----------------For Clear (CLR_DR)-----------------              
           
            else if((r) & B[0])
               Q_PC = 0;
//-----------------For Increament (INC_PC)-----------------              
           
            else if( T[1] )
               Q_PC = Q_PC + 1;

    end

endmodule