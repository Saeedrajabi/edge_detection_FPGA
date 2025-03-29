# 💡 Hardware-Based Multilayer Perceptron (MLP) in VHDL

Welcome to this VHDL implementation of a **Multilayer Perceptron (MLP)** — an essential component of neural network models — developed from scratch using the hardware description language VHDL. 🧠💻✨

## Project Overview

This repository demonstrates how neural networks can be efficiently implemented in digital logic. The project encompasses:

- Modular neurons (input, hidden, and output layers)
- Weight management and activation logic
- Comprehensive testbenches
- Utility packages for fixed-point arithmetic
- Generic array handling for flexible design
- MATLAB scripts for training, simulation, and visualization

Ideal for digital designers, students, and researchers aiming to explore AI applications at the hardware level.

---

## Architecture

```
      [Inputs] → [MNode] → [HNode] → [NNode] → [Output]
                             ↓
                          [MLP.vhd]
```

- **Neuron Modules:**
  - `MNode.vhd` - Input neuron module
  - `HNode.vhd` - Hidden layer neuron module
  - `NNode.vhd` - Output neuron module

- **Top-level Integration:**
  - `MLP.vhd` - Top-level architecture integrating all layers

- **Utility Packages:**
  - `fixed_float_type_c.vhd` - Custom fixed and float types definition
  - `fixed_pkg_c.vhd` - Fixed-point arithmetic operations package
  - `GenericArrays_pkg.vhd` - Generic array definitions to support neuron interconnections

---

## Testbenches

Each module has dedicated testbenches to ensure robust verification:

- `MNodeTB.vhd` - Tests input neuron functionality
- `tb_HNode.vhd` - Tests hidden neuron module
- `tb_NNode.vhd` - Tests output neuron module
- `tb_mlp.vhd` - Tests complete MLP integration
- `tb_mlpBaseCases.vhd` - Tests fundamental baseline scenarios

---

## MATLAB Integration

A MATLAB-based environment is provided for training and evaluating the neural network:

- `nnnew.m` - Initializes a new neural network
- `nnrbp.m` - Trains the network using Resilient Backpropagation (RPROP)
- `nneval.m` - Evaluates the network
- `nngeterrors.m` - Computes network performance metrics
- `top.m` - Complete training/testing script with visualization and edge detection

### 🔍 Features in MATLAB:
- Easy-to-train simulated network
- Output weight file (`W.dat`) for hardware usage
- Visual comparison between neural output and Sobel edge detection

---
