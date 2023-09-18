`timescale 1ns / 1ps

module top(
    input                   clk_i       ,
    input                   rstn_i      ,
    input        [15:0]     sw_i        ,
    output logic [15:0]     led_o       
    );
    
    logic [16:0] delay_cnt;
    logic [15:0] led_stat;
    logic        sys_reset;
    
    always_ff @(posedge clk_i)
        sys_reset <= ~rstn_i;
        
    always_ff @(posedge clk_i) begin
        if (sys_reset)
//            delay_cnt <= '0;
            led_stat <= '0;
        else 
//            if ((sw_i[0]) & (delay_cnt < sw_i[15:1])) delay_cnt <= delay_cnt+1;
            led_stat <= sw_i;    
    end
    
    assign led_o = led_stat;
    
endmodule
