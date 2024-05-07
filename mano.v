module mano(

    input CLK,
    //-------(output from register IR)-------    
    output [15:0] Q_IR,
    //-------(output from register PC)-------    
    output [11:0] Q_PC,
    //-------(output from register AR)-------    
    output [11:0] Q_AR,
    //-------(output from register DRh)-------    
    output [15:0] Q_DR,
    //-------(output from register AC)-------    
    output [15:0] Q_AC,
    //-------(output from MEMORY)-------    
    output [15:0] Q_MEMORY,
    output  [2:0] t,
    output [2:0] s,
    output [15:0] AC
    
    );

//-----------------------(wire to help)----------------------
wire [15:0] Q1, Q2; 
wire [15:0] IN;
wire [15:0] IN_IR;

//-------------------------(seq_counter_4)-----------------------
    seq_counter_4 seq_co_4(CLK,Q_IR,t); 

//-------------------------(REG_IR)-----------------------
    REG_IR ir(.IN_IR(IN),.CLK(CLK),.t(t),.Q_IR(Q_IR));

//-------------------------(COMMEN_BUS)-----------------------
    COMMEN_BUS buss(.IN_IR(Q_IR),.t(t),.s(s));

    MUX_8_3 BUS_SELECTION (16'hxxxx, Q1, Q2, Q_DR, Q_AC, Q_IR, 16'h0000, Q_MEMORY, s, IN);

//-------------------------(REG_PC)-----------------------
    REG_PC pc(.IN_IR(Q_IR),.CLK(CLK),.t(t),.Q_PC(Q_PC),.IN(IN));
    assign Q2 = {4'b0000, Q_PC};
//-------------------------(REG_AR)-----------------------
    REG_AR ar(.IN_IR(Q_IR),.CLK(CLK),.t(t),.Q_AR(Q_AR),.IN(IN));
    assign Q1 = {4'b0000, Q_AR};
//-------------------------(REG_AC)-----------------------
    REG_AC ac(.IN_IR(Q_IR),.CLK(CLK),.t(t),.Q_AC(Q_AC),.IN(AC));

//-------------------------(REG_DR)-----------------------
    REG_DR dr(.IN_IR(Q_IR),.CLK(CLK),.t(t),.Q_DR(Q_DR),.IN(IN));

//-------------------------(ALU)-----------------------
    ALU alu(.IN_IR(Q_IR),.CLK(CLK),.t(t),.Q_AC(Q_AC),.Q_DR(Q_DR),.AC(AC));

//-------------------------(MEMORY)-----------------------
    MEMORY mem(.IN_IR(Q_IR),.CLK(CLK),.t(t),.Q_MEMORY(Q_MEMORY),.IN(IN),.AR(Q_AR));

endmodule
