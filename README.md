# RTL-to-GDS Flow of ALU using Qflow

This project demonstrates a complete ASIC digital design flow for a simple 2-bit Arithmetic Logic Unit (ALU), starting from Verilog RTL and ending with a GDSII layout, using open-source tools via Qflow.

---

## 馃敡 Tools Used

- **Verilog** 鈥� RTL design and testbench
- **Icarus Verilog + GTKWave** 鈥� Functional simulation
- **Qflow** 鈥� RTL to GDS flow:
  - **Yosys** 鈥� Synthesis
  - **Graywolf** 鈥� Placement
  - **QRouter** 鈥� Routing
  - **Magic** 鈥� Layout, DRC, GDS export
- **KLayout** 鈥� GDS viewing

---

## 馃搶 ALU Functionality

A simple 2-bit ALU performing:
- Addition
- Subtraction
- AND
- OR

Operations are selected using a 2-bit control signal.

---

## 馃搨 File Descriptions

| File/Folder        | Description                                |
|--------------------|--------------------------------------------|
| `alu.v`            | RTL Verilog code of the ALU                |
| `alu_tb.v`         | Testbench for simulation                   |
| `run_qflow.log`    | Full Qflow execution log                   |
| `qflow_files/`     | Logs, intermediate files, GDS layout       |
| `images/`          | Screenshots from simulation and layout     |
| `qflow_script.sh`  | Optional helper script for running Qflow   |

---

## 鈻讹笍 How to Simulate (Functional)

1. Install Icarus Verilog and GTKWave
2. Run:
   ```bash
   iverilog -o alu_test alu.v alu_tb.v
   vvp alu_test
   gtkwave dump.vcd
