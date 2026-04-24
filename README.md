# Sobel Edge Detection (Verilog)

This project implements Sobel edge detection using Verilog for FPGA-based image processing.

## Features
- Hardware implementation of Sobel operator
- Real-time edge detection capability
- Efficient pixel processing using line buffer
- UART communication for data transfer

## Files
- sobel_core.v – Main Sobel processing module
- line_buffer.v – Stores pixel data for convolution
- uart_tx.v – UART transmission module
- uart_rx.v – UART receiver module
- top.v – Top-level integration

## Technologies Used
- Verilog HDL
- FPGA Design
- Digital Image Processing

## Applications
- Real-time image processing
- Embedded vision systems
- FPGA-based edge detection

## Future Improvements
- Optimization for higher resolution
- Integration with camera module
