`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:33:36 07/29/2023 
// Design Name: 
// Module Name:    Sequence_Detector_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sequence_Detector_1(input x , clk,rst,output reg y);
	parameter A = 2'b00;
	parameter B = 2'b01;
	parameter C = 2'b10;
	parameter D = 2'b11;
	reg [1:0]p,n;
	always @(posedge clk, posedge rst)
		begin
			if(rst) begin p = A; end
			else 
				begin
					case({p})
						A : 
							begin 
								y = 0;
								if(x) n = B; 
								else  n = A; 
							end 
						B : 
							begin
								y = 0;
								if(x) n = B;
								else  n = C;
							end
						C : 
							begin
								y = 0;
								if(x) n = D;
								else n = A;
							end
						D : 
							begin 
								if(x) begin n = B; y = 1; end
								else begin n = C; y = 0; end
							end
						endcase
						p = n;
					end
				end
endmodule
