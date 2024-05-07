module REG_IR(

//-------(clock)-------
    input CLK,
//-------(input IR)-------
    input [15:0]IN_IR,
//-------(input from seq_counter_3_bit)-------
    input[2:0]t,
//-------(output from register IR)-------    
    output reg[15:0]Q_IR
    
    );
//-------(wire to help)------- 
    reg i,r,p;    
    reg [3:0]d;
    reg [7:0]D;
    reg [7:0]T;
    reg [10:0]B;
    wire LD_IR;

//------------------(initial value)--------------------

    initial
        begin
            i = 0;
            D = 0;
            B = 0;
            T = 0;
            d = 0;
            r = 0;
            p = 0;
            Q_IR = 0;

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

    
    always@(posedge CLK)begin
        
           
//---------( Funtion of lD )---------
           
            if(T[1])
                Q_IR = IN_IR;  

    end
    
endmodule