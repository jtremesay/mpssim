all: build/demo/Adder.svg build/mps/ALU.svg build/mps/ALUControl.svg build/mps/Control.svg build/mps/InstructionDecoder.svg build/mps/ProgramCounter.svg build/mps/PCLogic.svg build/mps/SignExtender.svg build/mps/RegisterFile.svg build/mps/CPU.svg build/soc/main.svg

build/demo/Adder.svg: build/demo/Adder.json
	npx netlistsvg -o build/demo/Adder.svg build/demo/Adder.json

build/demo/Adder.json: build/demo/Adder.prep.json
	tools/netlist-postprocessor.py build/demo/Adder.prep.json build/demo/Adder.json rtl/demo/Adder.pp.json

build/demo/Adder.prep.json: rtl/demo/Adder.v
	yosys -L build/demo/Adder.synth.log -o build/demo/Adder.prep.json -p 'prep -top Adder' rtl/demo/Adder.v

build/mps/ALU.svg: build/mps/ALU.json
	npx netlistsvg -o build/mps/ALU.svg build/mps/ALU.json

build/mps/ALU.json: build/mps/ALU.prep.json
	tools/netlist-postprocessor.py build/mps/ALU.prep.json build/mps/ALU.json rtl/mps/ALU.pp.json

build/mps/ALU.prep.json: rtl/mps/ALU.v
	yosys -L build/mps/ALU.synth.log -o build/mps/ALU.prep.json -p 'prep -top ALU' rtl/mps/ALU.v

build/mps/ALUControl.svg: build/mps/ALUControl.json
	npx netlistsvg -o build/mps/ALUControl.svg build/mps/ALUControl.json

build/mps/ALUControl.json: build/mps/ALUControl.prep.json
	tools/netlist-postprocessor.py build/mps/ALUControl.prep.json build/mps/ALUControl.json rtl/mps/ALUControl.pp.json

build/mps/ALUControl.prep.json: rtl/mps/ALUControl.v
	yosys -L build/mps/ALUControl.synth.log -o build/mps/ALUControl.prep.json -p 'prep -top ALUControl' rtl/mps/ALUControl.v

build/mps/Control.svg: build/mps/Control.json
	npx netlistsvg -o build/mps/Control.svg build/mps/Control.json

build/mps/Control.json: build/mps/Control.prep.json
	tools/netlist-postprocessor.py build/mps/Control.prep.json build/mps/Control.json rtl/mps/Control.pp.json

build/mps/Control.prep.json: rtl/mps/Control.v
	yosys -L build/mps/Control.synth.log -o build/mps/Control.prep.json -p 'prep -top Control' rtl/mps/Control.v

build/mps/InstructionDecoder.svg: build/mps/InstructionDecoder.json
	npx netlistsvg -o build/mps/InstructionDecoder.svg build/mps/InstructionDecoder.json

build/mps/InstructionDecoder.json: build/mps/InstructionDecoder.prep.json
	tools/netlist-postprocessor.py build/mps/InstructionDecoder.prep.json build/mps/InstructionDecoder.json rtl/mps/InstructionDecoder.pp.json

build/mps/InstructionDecoder.prep.json: rtl/mps/InstructionDecoder.v
	yosys -L build/mps/InstructionDecoder.synth.log -o build/mps/InstructionDecoder.prep.json -p 'prep -top InstructionDecoder' rtl/mps/InstructionDecoder.v

build/mps/ProgramCounter.svg: build/mps/ProgramCounter.json
	npx netlistsvg -o build/mps/ProgramCounter.svg build/mps/ProgramCounter.json

build/mps/ProgramCounter.json: build/mps/ProgramCounter.prep.json
	tools/netlist-postprocessor.py build/mps/ProgramCounter.prep.json build/mps/ProgramCounter.json rtl/mps/ProgramCounter.pp.json

build/mps/ProgramCounter.prep.json: rtl/mps/ProgramCounter.v
	yosys -L build/mps/ProgramCounter.synth.log -o build/mps/ProgramCounter.prep.json -p 'prep -top ProgramCounter' rtl/mps/ProgramCounter.v

build/mps/PCLogic.svg: build/mps/PCLogic.json
	npx netlistsvg -o build/mps/PCLogic.svg build/mps/PCLogic.json

build/mps/PCLogic.json: build/mps/PCLogic.prep.json
	tools/netlist-postprocessor.py build/mps/PCLogic.prep.json build/mps/PCLogic.json rtl/mps/PCLogic.pp.json

build/mps/PCLogic.prep.json: rtl/mps/PCLogic.v
	yosys -L build/mps/PCLogic.synth.log -o build/mps/PCLogic.prep.json -p 'prep -top PCLogic' rtl/mps/PCLogic.v

build/mps/SignExtender.svg: build/mps/SignExtender.json
	npx netlistsvg -o build/mps/SignExtender.svg build/mps/SignExtender.json

build/mps/SignExtender.json: build/mps/SignExtender.prep.json
	tools/netlist-postprocessor.py build/mps/SignExtender.prep.json build/mps/SignExtender.json rtl/mps/SignExtender.pp.json

build/mps/SignExtender.prep.json: rtl/mps/SignExtender.v
	yosys -L build/mps/SignExtender.synth.log -o build/mps/SignExtender.prep.json -p 'prep -top SignExtender' rtl/mps/SignExtender.v

build/mps/RegisterFile.svg: build/mps/RegisterFile.json
	npx netlistsvg -o build/mps/RegisterFile.svg build/mps/RegisterFile.json

build/mps/RegisterFile.json: build/mps/RegisterFile.prep.json
	tools/netlist-postprocessor.py build/mps/RegisterFile.prep.json build/mps/RegisterFile.json rtl/mps/RegisterFile.pp.json

build/mps/RegisterFile.prep.json: rtl/mps/RegisterFile.v
	yosys -L build/mps/RegisterFile.synth.log -o build/mps/RegisterFile.prep.json -p 'prep -top RegisterFile' rtl/mps/RegisterFile.v

build/mps/CPU.svg: build/mps/CPU.json
	npx netlistsvg -o build/mps/CPU.svg build/mps/CPU.json

build/mps/CPU.json: build/mps/CPU.prep.json
	tools/netlist-postprocessor.py build/mps/CPU.prep.json build/mps/CPU.json rtl/mps/CPU.pp.json

build/mps/CPU.prep.json: rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/PCLogic.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v
	yosys -L build/mps/CPU.synth.log -o build/mps/CPU.prep.json -p 'prep -top CPU' rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/PCLogic.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v

build/soc/main.svg: build/soc/main.json
	npx netlistsvg -o build/soc/main.svg build/soc/main.json

build/soc/main.json: build/soc/main.prep.json
	tools/netlist-postprocessor.py build/soc/main.prep.json build/soc/main.json rtl/soc/main.pp.json

build/soc/main.prep.json: rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/PCLogic.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/soc/ROM.v rtl/soc/RAM.v rtl/soc/main.v
	yosys -L build/soc/main.synth.log -o build/soc/main.prep.json -p 'prep -top main' rtl/mps/SignExtender.v rtl/mps/ALU.v rtl/mps/PCLogic.v rtl/mps/InstructionDecoder.v rtl/mps/ALUControl.v rtl/mps/ProgramCounter.v rtl/mps/CPU.v rtl/mps/RegisterFile.v rtl/mps/Control.v rtl/soc/ROM.v rtl/soc/RAM.v rtl/soc/main.v

clean:
	$(RM) build/demo/Adder.svg build/demo/Adder.json build/demo/Adder.prep.json build/demo/Adder.synth.log build/mps/ALU.svg build/mps/ALU.json build/mps/ALU.prep.json build/mps/ALU.synth.log build/mps/ALUControl.svg build/mps/ALUControl.json build/mps/ALUControl.prep.json build/mps/ALUControl.synth.log build/mps/Control.svg build/mps/Control.json build/mps/Control.prep.json build/mps/Control.synth.log build/mps/InstructionDecoder.svg build/mps/InstructionDecoder.json build/mps/InstructionDecoder.prep.json build/mps/InstructionDecoder.synth.log build/mps/ProgramCounter.svg build/mps/ProgramCounter.json build/mps/ProgramCounter.prep.json build/mps/ProgramCounter.synth.log build/mps/PCLogic.svg build/mps/PCLogic.json build/mps/PCLogic.prep.json build/mps/PCLogic.synth.log build/mps/SignExtender.svg build/mps/SignExtender.json build/mps/SignExtender.prep.json build/mps/SignExtender.synth.log build/mps/RegisterFile.svg build/mps/RegisterFile.json build/mps/RegisterFile.prep.json build/mps/RegisterFile.synth.log build/mps/CPU.svg build/mps/CPU.json build/mps/CPU.prep.json build/mps/CPU.synth.log build/soc/main.svg build/soc/main.json build/soc/main.prep.json build/soc/main.synth.log

PHONY: all clean
