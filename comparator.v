/*
  Author : Rakotojaona Nambinina
  email: Andrianoelisoa.Rakotojaona@gmail.com
  Description : Comparator , compare the value of GTB and the schedule , when both of them are equal , tx goes high
*/
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2022 12:51:17 PM
// Design Name: 
// Module Name: timeTriggered
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
module timeTriggered(
                     clk,
                     rst,
                     GTB,
                     schedule,
                     tx,
                     portId
                     );

  input clk;
  input rst;
  input [31:0] GTB;
  input [31:0] schedule;
  output reg tx; 
  output reg [2:0] portId;
  
  integer counter;
  
  always @ (posedge clk)
    begin
      if (rst)
        begin 
          tx <= 0; 
          counter <=0;         
        end 
      else 
        begin
          if (GTB == schedule [28:0])
            begin
              counter  <= counter + 1;
              tx <= 1;
              portId <= schedule [31:29];
              if (counter == 1)
                begin
                  tx <= 0;
                  counter <= 0;
                  portId <= 0;
                end 
            end
          else
            begin
              tx <= 0;
              counter <= 0;
              portId <= 0;
            end           
        end 
    end 
  
endmodule

/*

module tbTT(

    );
    
  reg clk;
  reg rst;
  reg [31:0] GTB;
  reg [31:0] schedule;
  wire  tx; 
  wire [2:0] portId;
  
    
    timeTriggered DUT(
                     clk,
                     rst,
                     GTB,
                     schedule,
                     tx,
                     portId
                     );

  initial
    begin
      clk =0;
      rst = 1;
      GTB = 32'd5;
      schedule = 32'd6;
      #10 
      rst = 0;
      #100 
      schedule = {3'd5,29'd5};
      #10 
      schedule =32'd8;
      #100 
      schedule = {3'd2,29'd5};
      #10 
      schedule = 32'd6; 
     
    end 
    
  always 
    begin
      #5 clk = ! clk;
    end 

endmodule

*/
