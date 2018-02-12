`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2018 14:08:08
// Design Name: 
// Module Name: hamwt_sub_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hamwt_sub_tb;
    
    
       reg clear;
        reg clk;
        reg pkt_starts;
        reg [7:0] bin_data;
        wire [4:0] ham_wt;
        wire [309:0] locn_ones;
        
        hamwt_sub uut(
            .clear(clear),
            .clk(clk),
            .pkt_starts(pkt_starts),
            .bin_data(bin_data),
            .ham_wt(ham_wt),
            .locn_ones(locn_ones)
            );
            
          initial begin
          //initialize Inputs
             clear=0;
             clk=0;
            pkt_starts=1;
            #200;
            pkt_starts=0;
            bin_data=11111111;
           #100;
           bin_data=10101000;
             end
          //Clock signal         
            always
            begin
             #50 clk=~clk; 
            end
            
            
    endmodule
