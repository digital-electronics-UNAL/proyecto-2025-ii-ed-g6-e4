//`include "Pruebas1.v"
//`include "LCD.v"

module Proyectomatas #(
    parameter NUM_COMMANDS = 4, 
    parameter NUM_DATA_ALL = 32,  
    parameter NUM_DATA_PERLINE = 16,
    parameter DATA_BITS = 8,
    parameter COUNT_MAX = 800000
)(
    input  wire clk,            
    input  wire reset,          
    input  wire ready_i,
    input  wire sel_text_i,
    input  wire activar,   

    output wire led,         
    output wire rs,       
    output wire rw,
    output wire enable,    
    output wire [DATA_BITS-1:0] data
);

    // Instancia de la bomba
    bomba u0 (
        .clk(clk), 
        .activar(activar), 
        .led(led)
    );

    // Instancia del controlador LCD
    LCD1602_controller #(
        .NUM_COMMANDS(NUM_COMMANDS),
        .NUM_DATA_ALL(NUM_DATA_ALL),
        .NUM_DATA_PERLINE(NUM_DATA_PERLINE),
        .DATA_BITS(DATA_BITS),
        .COUNT_MAX(COUNT_MAX)
    ) u1 (
        .clk(clk),
        .reset(reset),
        .ready_i(ready_i),
        .sel_text_i(sel_text_i),
        .rs(rs),
        .rw(rw),
        .enable(enable),
        .data(data)
    );

endmodule
