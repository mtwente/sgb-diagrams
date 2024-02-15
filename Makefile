# Makefile for building and exporting ggplot plots

# Define the R scripts and corresponding output files
R_SCRIPTS := $(wildcard src/*_export.R)
BUILD_DIR := build
OUTPUT_FILES := $(addprefix $(BUILD_DIR)/,$(patsubst src/%_export.R,%,$(R_SCRIPTS)))

# Default target - list available targets
all:
	@echo "Available targets: $(basename $(OUTPUT_FILES))"

# Generic target to build and export a plot
%: src/%_export.R | $(BUILD_DIR)
	Rscript $< $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

# Allow the user to specify a target, color mode, file format, and legend position
.PHONY: $(basename $(OUTPUT_FILES))
$(basename $(OUTPUT_FILES)): %
	@:

# Create the build directory (if it doesn't exist)
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean up generated files
clean:
	rm -f $(OUTPUT_FILES)
