# J22 SH-2 core

This is an SH-2 core, based on the J202 SoC as submitted to MPW8.

The original source is [available on Github](https://github.com/Hagiwara-shc/j202_soc/tree/main/verilog/rtl/j202_soc/j22).

This core is currently synthesized with its register files intact, which makes it larger than other cores in this exploration.

## SystemVerilog

This core was designed using SystemVerilog, and as such it requires UHDM and the Yosys UHDM plugin.

Conda provides these packages, though they rename the yosys binary to `uhdm-yosys`. The `flow.tcl` script has been updated accordingly.

To install the necessary packages, run the following in a Conda environment:

```
conda install -c litex-hub surelog surelog-uhdm yosys-uhdm
```
