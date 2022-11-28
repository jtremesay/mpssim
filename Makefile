TOPS = ProgramCounter InstructionDecoder Control RegisterFile ALUControl ALU SignExtender CPU

TARGETS = $(foreach t,$(TOPS),build/$t.svg)

GET_TOP ?= export TOP=$$(echo $(basename $(notdir $<)));

all: $(TARGETS)

build/%.svg: build/%.json
	npx netlistsvg -o $@ $<

build/%.json: rtl/%.v
	$(GET_TOP) yosys -L build/$$TOP.synth.log -o $@ -p "prep -top $$TOP" $^

build/CPU.json: $(foreach t,ProgramCounter InstructionDecoder Control RegisterFile ALUControl ALU SignExtender ROM RAM,rtl/$(t).v)

clean:
	$(RM) build/*.json build/*.log build/*.svg

.PHONY: clean