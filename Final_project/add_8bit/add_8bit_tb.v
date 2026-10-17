`timescale 1ns / 1ps

// ID: 22201089
// Module  : add_8bit_tb
// Testbench for add_8bit.

module add_8bit_tb;

    reg  [7:0] a, b;
    wire [7:0] s;
    reg  [7:0] exp;

add_8bit uut (
        .A0(a[0]), .A1(a[1]), .A2(a[2]), .A3(a[3]),
        .A4(a[4]), .A5(a[5]), .A6(a[6]), .A7(a[7]),
        .B0(b[0]), .B1(b[1]), .B2(b[2]), .B3(b[3]),
        .B4(b[4]), .B5(b[5]), .B6(b[6]), .B7(b[7]),
        .S0(s[0]), .S1(s[1]), .S2(s[2]), .S3(s[3]),
        .S4(s[4]), .S5(s[5]), .S6(s[6]), .S7(s[7])
    );

task check;
        input [7:0] x;
        input [7:0] y;
        begin
            a = x;
            b = y;
            exp = x + y;
            #10;
            $display("A=%h B=%h -> S=%h expected=%h %s", a, b, s, exp, (s === exp) ? "PASS" : "FAIL");
        end
    endtask
	 
	 initial begin
        check(8'h00, 8'h00);
        check(8'h00, 8'h11);
        check(8'h77, 8'h77);
        check(8'hFF, 8'h01);
        check(8'hFF, 8'hFF);
        check(8'h0F, 8'h01);
        check(8'h5A, 8'hA5);
        $finish;
    end

endmodule