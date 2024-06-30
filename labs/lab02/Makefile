BUILD_DIR ?= build
SOURCES ?= $(wildcard *.v)

# tools
IVERILOG = iverilog
VVP      = vvp
GTKWAVE  = gtkwave

# targets
all: $(BUILD_DIR)/waveform.vcd

# generate testbenches
$(BUILD_DIR)/testbench: $(SOURCES) | $(BUILD_DIR)
	$(IVERILOG) -o $@ $^

# run testbenches
$(BUILD_DIR)/waveform.vcd: $(BUILD_DIR)/testbench
	$(VVP) $< +waveform=$@

# create build dir
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# display waveform
wave: all
	$(GTKWAVE) -a waveform.gtkw $(BUILD_DIR)/waveform.vcd > /dev/null 2>&1 & disown

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean wave