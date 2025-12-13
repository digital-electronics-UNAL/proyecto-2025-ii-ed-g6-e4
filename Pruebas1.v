module bomba (
    input  wire clk,        // clock 50 MHz
    input  wire activar,    // revisar cada 30s
    output reg  led         // encender led/bomba si activar==1
);

    localparam [35:0] SEGUNDO     = 36'd50_000_000;
    localparam [35:0] TIEMPO_REV  = SEGUNDO * 10;  // 30 segundos
    localparam [35:0] TIEMPO_ON   = SEGUNDO * 3;    // tiempo entre revision - tiempo de encendido

    reg [35:0] contador    = 0;
    reg [35:0] contador_on = 0;

    initial begin
        led = 1'b0;
    end

    always @(posedge clk) begin

        if (contador >= TIEMPO_REV) begin
            contador <= 0;

				if (activar) begin
                led <= 1'b0;          // encender bomba/led
                contador_on <= 0;     // empezar conteo de 3s
            end
				
        end else begin
            contador <= contador + 1;
        end

    
        if (led == 1'b0) begin
            if (contador_on >= TIEMPO_ON) begin
                led <= 1'b1;          // se apaga solo a los 3s
            end else begin
                contador_on <= contador_on + 1;
            end
        end
    end

endmodule
