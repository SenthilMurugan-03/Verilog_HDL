`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:09:41 07/29/2023 
// Design Name: 
// Module Name:    FSM6 
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
module FSM6(input x , clk , rst , output reg y);
parameter Si = 2'b00;
parameter S0 = 2'b01;
parameter S1 = 2'b10;
reg [1:0]p,n;

always @(posedge clk or posedge rst)
begin
	if(rst) p = Si;
	else
		begin
			case({p})
				Si : 
					begin
						
						if(x) begin n = S1; y = 0; end
						else begin n = S0; y = 0; end
					end
				S0 : 
					begin
						if(x) begin n = S1; y = 1; end
						else  begin n = S0; y = 0; end
					end
				S1 : 
					begin
						if(x) begin n = S1; y = 0; end
						else  begin n = S0; y = 0; end
					end
			endcase
			p = n;
		end
	end
endmodule
