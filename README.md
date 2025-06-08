# RTL-to-GDS Flow of ALU using Qflow

This project demonstrates a complete ASIC digital design flow for a simple 2-bit Arithmetic Logic Unit (ALU), starting from Verilog RTL and ending with a GDSII layout, using open-source tools via Qflow.

---

## 🔧 Tools Used

- **Verilog** – RTL design and testbench
- **Icarus Verilog + GTKWave** – Functional simulation
- **Qflow** – RTL to GDS flow:
  - **Yosys** – Synthesis
  - **Graywolf** – Placement
  - **QRouter** – Routing
  - **Magic** – Layout, DRC, GDS export
- **KLayout** – GDS viewing

---

## 📌 ALU Functionality

A simple 2-bit ALU performing:
- Addition
- Subtraction
- AND
- OR

Operations are selected using a 2-bit control signal.

---

## 📂 File Descriptions

| File/Folder        | Description                                |
|--------------------|--------------------------------------------|
| `alu.v`            | RTL Verilog code of the ALU                |
| `alu_tb.v`         | Testbench for simulation                   |
| `run_qflow.log`    | Full Qflow execution log                   |
| `qflow_files/`     | Logs, intermediate files, GDS layout       |
| `images/`          | Screenshots from simulation and layout     |
| `qflow_script.sh`  | Optional helper script for running Qflow   |

---

## ▶️ How to Simulate (Functional)

To simulate the ALU functionality:

1. Install **Icarus Verilog** and **GTKWave**.

2. Compile the design and testbench:
   iverilog -o alu_test ALU.v ALU_tb.v
   
3. Run the simulation:
vvp alu_test
4. Open the waveform viewer:
gtkwave alu.vcd

![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/Simulation%20using%20GTKWAVE.png)



## ASIC Physical Design Flow Stages

This project uses an open-source ASIC flow from RTL design to GDSII layout generation. Below are the key stages involved:

### 1. Synthesis (Yosys)
- Converts RTL Verilog code into a gate-level netlist.
- Optimizes logic and maps to standard cells.
- Outputs a netlist ready for physical design.

### 2. Placement (Graywolf)
- Determines physical locations for each standard cell.
- Aims to minimize area, timing delays, and routing congestion.
- Produces a placement file with cell coordinates.

### 3. Static Timing Analysis (STA)
- Checks timing paths to ensure the design meets clock frequency constraints.
- Identifies critical paths and timing violations.

### 4. Routing (QRouter)
- Connects placed cells with metal wires and vias.
- Minimizes wire length and avoids routing conflicts.

### 5. Design Rule Check (DRC) (Magic)
- Verifies the layout against foundry manufacturing rules.
- Detects spacing, width, and overlap violations.

### 6. Layout Versus Schematic (LVS) *(optional but recommended)*
- Confirms that the physical layout matches the original netlist.
- Ensures connectivity and device correctness.

### 7. GDSII Generation (Magic)
- Exports the final verified layout into GDSII file format.
- GDSII is the standard for chip mask fabrication.

---

Each of these stages is critical to transforming the RTL description of the ALU into a manufacturable physical chip layout.
