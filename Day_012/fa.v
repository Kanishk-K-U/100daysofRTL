primitive  udp_fa_sum (sum,a,b,c);
    input a,b,c;
    output sum;
    table
        0 0 0 : 0;
        0 0 1 : 1;
        0 1 0 : 1;
        0 1 1 : 0;
        1 0 0 : 1;
        1 0 1 : 0;
        1 1 0 : 0;
        1 1 1 : 1;
    endtable
endprimitive

primitive udp_fa_cout (cout,a,b,c);
    input a,b,c;
    output cout;
    table
        0 0 ? : 0;
        0 ? 0 : 0;
        ? 0 0 : 0;
        1 1 ? : 1;
        1 ? 1 : 1;
        ? 1 1 : 1; 
    endtable
endprimitive

module fa(sum,cout,a,b,c);
    input a,b,c;
    output sum,cout;
    udp_fa_sum udp1(sum,a,b,c);
    udp_fa_cout udp2(cout,a,b,c);
endmodule
