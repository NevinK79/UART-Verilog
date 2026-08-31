# UART Reciever

A simple UART receiver written in Verilog for the Digilent Basys 3 (Artix-7) FPGA board. It receives serial (RS-232) data over USB, decodes it, and displays the received ASCII lowercase letter on the board's 7-segment display.

## How it works

The design is split into three modules:

- **`UART_main.v`** — The UART receiver itself. It's a simple state machine (`IDLE` / `RECEIVE`) that oversamples the incoming `RxD` line at 4x the baud rate to find the start bit, then shifts in 8 data bits (plus start/stop framing) into a 10-bit shift register. The 8-bit received byte is exposed on `RxData`.
- **`BCDtoChar.v`** — Takes the received ASCII byte (`x`) and maps lowercase letters `a`–`z` to a 7-segment display pattern (`data`, active pattern per segment).
- **`main.v`** — Top-level module that wires the UART receiver into the character decoder and drives a single 7-segment digit (`an = 4'b1110` selects digit 0).

```
RxD ──▶ UART_main ──RxData[7:0]──▶ BCDtoChar ──Data[6:0]──▶ 7-segment display
```

### UART timing

- Clock: 100 MHz (Basys 3 onboard oscillator)
- Baud rate: 9600
- Oversampling: 4x (samples each bit near its midpoint for reliable detection)
- Frame: 1 start bit + 8 data bits + 1 stop bit (10 bits total)

## Files

| File             | Description                                            |
|------------------|----------------------------------------------------------|
| `UART_main.v`    | UART receiver (start-bit detection, oversampling, byte shift-in) |
| `BCDtoChar.v`     | ASCII lowercase letter → 7-segment display decoder     |
| `main.v`          | Top-level module tying the receiver to the display      |
| `cstr_UART.xdc`   | Xilinx constraints file (pin mapping) for the Basys 3   |
| `main.bit`        | Pre-built bitstream for the Basys 3                     |

## Hardware

Targets the **Digilent Basys 3** board:

- `clk` — 100 MHz onboard clock (pin W5)
- `RxD` — USB-RS232 receive line (pin B18)
- `reset` — pushbutton (pin U18)
- `Data[6:0]` / `an[3:0]` — one digit of the 4-digit 7-segment display

Pin assignments are defined in `cstr_UART.xdc`.

## Getting started

1. Open the project in **Xilinx Vivado**.
2. Add `main.v`, `UART_main.v`, and `BCDtoChar.v` as design sources, and `cstr_UART.xdc` as the constraints file.
3. Set `main` as the top module.
4. Run synthesis, implementation, and generate the bitstream (or use the provided `main.bit`).
5. Program the Basys 3 board.
6. From a PC, open a serial terminal (e.g. PuTTY, Tera Term) connected to the board's USB-UART port at **9600 baud, 8N1**.
7. Send a lowercase letter (`a`–`z`) — it will appear on the board's 7-segment display.

## Known limitations

- Only lowercase ASCII letters `a`–`z` are mapped; other characters fall through to the `default` case.
- Letters `m`, `t`, and `w` aren't mapped to a real segment pattern — a single 7-segment digit can't represent them in a way that's legible, so they're marked `//-not done` in `BCDtoChar.v`. `u` and `v` share a pattern for the same reason (a 7-segment digit can't distinguish them cleanly).
- Only a single 7-segment digit is driven; multi-character strings are not buffered or scrolled.
