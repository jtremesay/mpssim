#!/usr/bin/env python3
from pathlib import Path

DEPS = {
    "mps/CPU": [
        "mps/ALU",
        "mps/ALUControl",
        "mps/Control",
        "mps/InstructionDecoder",
        "mps/ProgramCounter",
        "mps/SignExtender",
        "mps/RegisterFile",
    ],
    "soc/main": ["mps/CPU", "soc/ROM", "soc/RAM"],
}

TARGETS = [
    "demo/Adder",
    "mps/ALU",
    "mps/ALUControl",
    "mps/Control",
    "mps/InstructionDecoder",
    "mps/ProgramCounter",
    "mps/SignExtender",
    "mps/RegisterFile",
    "mps/CPU",
    "soc/main",
]

deps_cache = {}

with (Path(__name__).parent / "Makefile").open("w") as f:
    # All target
    f.write("all:")
    for t in TARGETS:
        f.write(f" build/{t}.svg")
    f.write("\n\n")

    for t in TARGETS:
        top = t.split("/")[-1]
        bdir = t.rsplit("/", 1)[0]  # Target build dir

        deps = set()
        tmp_deps = set((t,))
        while tmp_deps:
            for d in DEPS.get(tmp_deps.pop(), []):
                deps.add(d)
                tmp_deps.add(d)

        # SVG nelist target
        f.write(f"build/{t}.svg: build/{t}.json\n")
        f.write(f"\tnpx netlistsvg -o build/{t}.svg build/{t}.json\n")
        f.write("\n")

        # Json post-processed netlist target
        f.write(f"build/{t}.json: build/{t}.prep.json\n")
        f.write(
            f"\ttools/netlist-postprocessor.py build/{t}.prep.json build/{t}.json rtl/{t}.pp.json\n"
        )
        f.write("\n")

        # Json netlist target
        f.write(f"build/{t}.prep.json:")
        for d in deps:
            f.write(f" rtl/{d}.v")
        f.write(f" rtl/{t}.v\n")
        f.write(
            f"\tyosys -L build/{t}.synth.log -o build/{t}.prep.json -p 'prep -top {top}'"
        )
        for d in deps:
            f.write(f" rtl/{d}.v")
        f.write(f" rtl/{t}.v\n")
        f.write("\n")

    # Clean target
    f.write("clean:\n")
    f.write("\t$(RM)")
    for t in TARGETS:
        f.write(f" build/{t}.svg")
        f.write(f" build/{t}.json")
        f.write(f" build/{t}.prep.json")
        f.write(f" build/{t}.synth.log")
    f.write("\n\n")

    f.write("PHONY: all clean\n")
