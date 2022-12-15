all: build/demo/Adder.svg build/mps/ALU.svg build/mps/ALUControl.svg build/mps/Control.svg build/mps/InstructionDecoder.svg build/mps/ProgramCounter.svg build/mps/SignExtender.svg build/mps/CPU.svg build/soc/main.svg

build/demo/Adder.svg: build/demo/Adder.json
	npx netlistsvg -o build/demo/Adder.svg build/demo/Adder.json

build/demo/Adder.json: build/demo/Adder.synth.json
	tools/netlist-postprocessor.py build/demo/Adder.synth.json build/demo/Adder.json rtl/demo/Adder.pp.json

build/demo/Adder.synth.json: build/demo/Adder.v
	yosys -L build/demo/Adder.json.log -o build/demo/Adder.synth.json -p 'prep -top Adder' build/demo/Adder.v

build/demo/Adder.v: rtl/demo/Adder.v
	yosys -L build/demo/Adder.synth.log -o build/demo/Adder.v -p 'prep -top Adder' rtl/demo/Adder.v

build/mps/ALU.svg: build/mps/ALU.json
	npx netlistsvg -o build/mps/ALU.svg build/mps/ALU.json

build/mps/ALU.json: build/mps/ALU.synth.json
	tools/netlist-postprocessor.py build/mps/ALU.synth.json build/mps/ALU.json rtl/mps/ALU.pp.json

build/mps/ALU.synth.json: build/mps/ALU.v
	yosys -L build/mps/ALU.json.log -o build/mps/ALU.synth.json -p 'prep -top ALU' build/mps/ALU.v

build/mps/ALU.v: rtl/mps/ALU.v
	yosys -L build/mps/ALU.synth.log -o build/mps/ALU.v -p 'prep -top ALU' rtl/mps/ALU.v

build/mps/ALUControl.svg: build/mps/ALUControl.json
	npx netlistsvg -o build/mps/ALUControl.svg build/mps/ALUControl.json

build/mps/ALUControl.json: build/mps/ALUControl.synth.json
	tools/netlist-postprocessor.py build/mps/ALUControl.synth.json build/mps/ALUControl.json rtl/mps/ALUControl.pp.json

build/mps/ALUControl.synth.json: build/mps/ALUControl.v
	yosys -L build/mps/ALUControl.json.log -o build/mps/ALUControl.synth.json -p 'prep -top ALUControl' build/mps/ALUControl.v

build/mps/ALUControl.v: rtl/mps/ALUControl.v
	yosys -L build/mps/ALUControl.synth.log -o build/mps/ALUControl.v -p 'prep -top ALUControl' rtl/mps/ALUControl.v

build/mps/Control.svg: build/mps/Control.json
	npx netlistsvg -o build/mps/Control.svg build/mps/Control.json

build/mps/Control.json: build/mps/Control.synth.json
	tools/netlist-postprocessor.py build/mps/Control.synth.json build/mps/Control.json rtl/mps/Control.pp.json

build/mps/Control.synth.json: build/mps/Control.v
	yosys -L build/mps/Control.json.log -o build/mps/Control.synth.json -p 'prep -top Control' build/mps/Control.v

build/mps/Control.v: rtl/mps/Control.v
	yosys -L build/mps/Control.synth.log -o build/mps/Control.v -p 'prep -top Control' rtl/mps/Control.v

build/mps/InstructionDecoder.svg: build/mps/InstructionDecoder.json
	npx netlistsvg -o build/mps/InstructionDecoder.svg build/mps/InstructionDecoder.json

build/mps/InstructionDecoder.json: build/mps/InstructionDecoder.synth.json
	tools/netlist-postprocessor.py build/mps/InstructionDecoder.synth.json build/mps/InstructionDecoder.json rtl/mps/InstructionDecoder.pp.json

build/mps/InstructionDecoder.synth.json: build/mps/InstructionDecoder.v
	yosys -L build/mps/InstructionDecoder.json.log -o build/mps/InstructionDecoder.synth.json -p 'prep -top InstructionDecoder' build/mps/InstructionDecoder.v

build/mps/InstructionDecoder.v: rtl/mps/InstructionDecoder.v
	yosys -L build/mps/InstructionDecoder.synth.log -o build/mps/InstructionDecoder.v -p 'prep -top InstructionDecoder' rtl/mps/InstructionDecoder.v

build/mps/ProgramCounter.svg: build/mps/ProgramCounter.json
	npx netlistsvg -o build/mps/ProgramCounter.svg build/mps/ProgramCounter.json

build/mps/ProgramCounter.json: build/mps/ProgramCounter.synth.json
	tools/netlist-postprocessor.py build/mps/ProgramCounter.synth.json build/mps/ProgramCounter.json rtl/mps/ProgramCounter.pp.json

build/mps/ProgramCounter.synth.json: build/mps/ProgramCounter.v
	yosys -L build/mps/ProgramCounter.json.log -o build/mps/ProgramCounter.synth.json -p 'prep -top ProgramCounter' build/mps/ProgramCounter.v

build/mps/ProgramCounter.v: rtl/mps/ProgramCounter.v
	yosys -L build/mps/ProgramCounter.synth.log -o build/mps/ProgramCounter.v -p 'prep -top ProgramCounter' rtl/mps/ProgramCounter.v

build/mps/SignExtender.svg: build/mps/SignExtender.json
	npx netlistsvg -o build/mps/SignExtender.svg build/mps/SignExtender.json

build/mps/SignExtender.json: build/mps/SignExtender.synth.json
	tools/netlist-postprocessor.py build/mps/SignExtender.synth.json build/mps/SignExtender.json rtl/mps/SignExtender.pp.json

build/mps/SignExtender.synth.json: build/mps/SignExtender.v
	yosys -L build/mps/SignExtender.json.log -o build/mps/SignExtender.synth.json -p 'prep -top SignExtender' build/mps/SignExtender.v

build/mps/SignExtender.v: rtl/mps/SignExtender.v
	yosys -L build/mps/SignExtender.synth.log -o build/mps/SignExtender.v -p 'prep -top SignExtender' rtl/mps/SignExtender.v

build/mps/CPU.svg: build/mps/CPU.json
	npx netlistsvg -o build/mps/CPU.svg build/mps/CPU.json

build/mps/CPU.json: build/mps/CPU.synth.json
	tools/netlist-postprocessor.py build/mps/CPU.synth.json build/mps/CPU.json rtl/mps/CPU.pp.json

build/mps/CPU.synth.json: build/mps/CPU.v
	yosys -L build/mps/CPU.json.log -o build/mps/CPU.synth.json -p 'prep -top CPU' build/mps/CPU.v

build/mps/CPU.v: rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v
	yosys -L build/mps/CPU.synth.log -o build/mps/CPU.v -p 'prep -top CPU' rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v

build/soc/main.svg: build/soc/main.json
	npx netlistsvg -o build/soc/main.svg build/soc/main.json

build/soc/main.json: build/soc/main.synth.json
	tools/netlist-postprocessor.py build/soc/main.synth.json build/soc/main.json rtl/soc/main.pp.json

build/soc/main.synth.json: build/soc/main.v
	yosys -L build/soc/main.json.log -o build/soc/main.synth.json -p 'prep -top main' build/soc/main.v

build/soc/main.v: rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/soc/ROM.v rtl/soc/RAM.v rtl/soc/main.v
	yosys -L build/soc/main.synth.log -o build/soc/main.v -p 'prep -top main' rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/soc/ROM.v rtl/soc/RAM.v rtl/soc/main.v

clean:
	$(RM) build/**/*.svg build/**/*.json build/**/*.v build/**/*.log

PHONY: all clean
