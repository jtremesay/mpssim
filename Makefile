TOPS = ProgramCounter InstructionDecoder Control RegisterFile ALUControl ALU SignExtender CPU

TARGETS = $(foreach t,$(TOPS),svg/$t.svg)

GET_TOP ?= export TOP=$$(echo $(basename $(notdir $<)));

all: $(TARGETS)

svg/%.svg: synth/%.json
	npx netlistsvg -o $@ --skin node_modules/netlistsvg/lib/default.svg $<

synth/%.json: rtl/%.v
	export TOP=
	$(GET_TOP) yosys -L logs/$$TOP.log -o $@ -p "prep -top $$TOP" $^

synth/CPU.json: $(foreach t,ProgramCounter InstructionDecoder Control RegisterFile ALUControl ALU SignExtender ROM RAM CPU,rtl/$(t).v)


clean:
	$(RM) synth/*.json logs/*.log svg/*.svg

.PHONY: clean