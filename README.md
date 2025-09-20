# Wallace Tree Multiplier (4-bit)

This project implements a modular 4-bit Wallace Tree Multiplier in Verilog using explicit Half Adder and Full Adder modules. It includes:

- Shifted partial product logic
- Structured reduction tree
- Hex-output testbench
- Waveform generation for simulation
- Comparative study PDF

## File Structure
- `src/`: Verilog source files
- `testbench/`: Simulation testbench
- `sim/`: Optional waveform output
- `docs/`: Project documentation

## How to Simulate
Use Vivado, ModelSim, or Icarus Verilog:
```bash
iverilog -o wallace_tb src/*.v testbench/tb_wallace_tree_multiplier_4bit.v
vvp wallace_tb
