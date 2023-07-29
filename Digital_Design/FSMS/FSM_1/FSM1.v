`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:19:54 07/29/2023 
// Design Name: 
// Module Name:    FSM1 
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
module FSM1(input x , clk , rst , output reg y);
parameter A = 2'b00;
parameter B = 2'b01;
parameter C = 2'b10;
parameter D = 2'b11;
reg [1:0]p,n;

always @(posedge clk or posedge rst)
begin
	if(rst) p = A;
	else
		begin
			case({p})
				A : 
					begin
						y = 0;
						if(x) n = B ;
						else n = A;
					end
				B : 
					begin
						y = 0;
						if(x) n = C;
						else n = B;
					end
				C : 
					begin
						y = 0;
						if(x) n = D;
						else n = C;
					end
				D : 
					begin
						y = 1;
						if(x) n = A;
						else n = D;
					end
			endcase
			p = n;
		end
	end
endmodule