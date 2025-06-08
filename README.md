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

This project follows a full open-source ASIC flow starting from the Verilog RTL description and ending with a GDSII layout file. Each stage transforms the design closer to a manufacturable chip while ensuring correctness and performance. The tools used include Yosys for synthesis, Graywolf for placement, QRouter for routing, and Magic for verification and GDS export.

### 1. Synthesis (Yosys)
  Synthesis is the first major step in the ASIC flow where the RTL Verilog code is translated into a gate-level netlist. This process optimizes the design for area, speed, and power by mapping the high-level logic into a network of standard cells. Yosys performs logic optimization, removes redundancies, and ensures the netlist meets design constraints. The resulting netlist is ready for the physical design stages like placement and routing.
- Converts RTL Verilog code into a gate-level netlist.
- Optimizes logic and maps to standard cells.
- Outputs a netlist ready for physical design.
- 
 ![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/ALU%20synthesis%20using%20YOSYS.png)

### 2. Placement (Graywolf)
  During placement, each standard cell from the synthesized netlist is assigned a specific location on the silicon layout. The goal is to minimize the chip’s overall area and reduce interconnect lengths between cells. Effective placement helps reduce timing delays and routing complexity, improving overall performance. Graywolf automates this process while respecting design constraints and cell compatibility.
- Determines physical locations for each standard cell.
- Aims to minimize area, timing delays, and routing congestion.
- Produces a placement file with cell coordinates.

![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/Placement.png)

### 3. Static Timing Analysis (STA)
  STA analyzes the timing characteristics of all signal paths to ensure they meet the required clock period. This step identifies the longest or “critical” timing paths and checks for setup and hold time violations. It is essential to guarantee that the design functions correctly at the target clock frequency. Early detection of timing issues allows designers to optimize the design or placement accordingly.
- Checks timing paths to ensure the design meets clock frequency constraints.
- Identifies critical paths and timing violations.

### 4. Routing (QRouter)
  Routing connects all placed standard cells by creating the metal wires needed for signal and power distribution. This step must avoid congestion and routing conflicts while minimizing total wire length. QRouter performs automated routing considering design rules and layer constraints to maintain signal integrity and reduce delays. Proper routing is crucial for chip functionality and performance.
- Connects placed cells with metal wires and vias.
- Minimizes wire length and avoids routing conflicts.

![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/Routing.png)

### 5. Design Rule Check (DRC) (Magic)
  DRC verifies the physical layout against the foundry’s manufacturing rules such as minimum spacing, line widths, and layer overlaps. Ensuring the layout complies with these rules is vital to prevent defects during fabrication. Magic is used to detect violations, which must be corrected before the design can proceed. This step ensures the design’s manufacturability and reliability.
- Verifies the layout against foundry manufacturing rules.
- Detects spacing, width, and overlap violations.

![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/magic.png)

![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/cells%20in%20magic.png)
### 7. GDSII Generation (Klayout)
  The final step exports the completed and verified layout to the GDSII format, which is the industry-standard file for photomask fabrication. This file contains all layer geometries and design information needed for chip manufacturing. The GDSII file is handed off to the foundry for tapeout and fabrication, marking the end of the physical design process.
- Exports the final verified layout into GDSII file format.
- GDSII is the standard for chip mask fabrication.
![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/klayout%20view%20of%20ALU.png)
![pro](https://github.com/JagadeeshAJK/RTL-to-GDS-Flow-of-ALU-using-Qflow/blob/main/Klayout%20cells.png)
---

Each of these stages is critical to transforming the RTL description of the ALU into a manufacturable physical chip layout.
