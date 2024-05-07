module seq_counter_4(

//-------(clock)-------
    input CLK,
//-------(input IR to know B)-------
    input [15:0]IN_IR,
//-------(output 3-Bit counter)-------    
    output reg [2:0]t 
    
    );
//-------(wire to help)------- 
reg i;          
reg [3:0]d;
reg [7:0]D;
reg [7:0]T;
reg [10:0]B;
wire INC,CLR,r;

  	initial
  	 
  	     begin
  	         i = 0;
  	         t = 0;
    
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
        
//---------------(anable INC & CLR)-------------    
    assign r = D[7] & ~i & T[3];       
    assign CLR = r | (D[4] & T[6]) | ((D[3] | D[4]) & T[4]) | (D[7] & T[3]) | ((D[0] | D[1] | D[2] | D[5] ) & T[5]);
    assign INC = ~CLR;
    
//--------------( Funtion of CLR & INC)--------------
    
    always @ (posedge CLK)begin

//-----------------For Increament (INC_Seq_counter)-----------------              
                 
                if(INC == 1 && CLR == 0)
                    t = t + 3'b001;

//-----------------For Clear (CLR_Seq_counter)-----------------              
                    
                else if(CLR == 1)
                    t = 0;
                    
    end
      
endmodule