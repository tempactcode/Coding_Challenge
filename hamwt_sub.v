`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2018 15:32:47
// Design Name: 
// Module Name: hamwt_sub
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


module hamwt_sub(
clk,
clear,
pkt_starts,
bin_data,
ham_wt,
locn_ones
);

input clk;
input clear;
input pkt_starts;
input [7:0] bin_data; //packets of 8bit data 128 times (128*8=1024 is the entire data sequence)

output reg [4:0] ham_wt;	//max is 31, i.e 5 bit
output reg [309:0] locn_ones; 

integer i;
reg locnofones;
reg hw;
reg [31:0] index;

always @(posedge clk) begin
    if((pkt_starts == 1) || (clear == 1)) begin
      index = 0;
      locnofones = 0;
	hw = 0;
    end
    else begin
      for (i=0; i <= bin_data; i = i + 1) begin
        if(bin_data[7-i] == 1) begin 
//every time it sees a 1, add for the hamming weight and shifts the indices to record the location of ones for the hamming weight
          locnofones = locnofones << 10 + (8*index+7-i);
		hw=hw+1;
        end
      end
      index <= index + 1;
    end
      ham_wt <= hw;
   locn_ones <= locnofones;
    end
endmodule
