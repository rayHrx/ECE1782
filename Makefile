.ONESHELL: # Applies to every targets in the file!
.SHELLFLAGS += -e

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

clean:
	rm -rf build/
.PHONY: clean

# cpu_sim

prepare_cpu_sim:
	mkdir -p build/cpu_sim
	cmake -S src/cpu_sim -B build/cpu_sim
.PHONY: prepare_cpu_sim

cpu_sim: prepare_cpu_sim
	$(MAKE) -C build/cpu_sim all
	@echo "=== cpu_sim is successfully built ==="
	@echo ""
.PHONY: cpu_sim

run_cpu_sim: cpu_sim
	./build/cpu_sim/cpu_sim
.PHONY: run_cpu_sim

# tus

prepare_tus:
	mkdir -p build/tus
	cmake -S src/tus -B build/tus
.PHONY: prepare_tus

tus: prepare_tus
	$(MAKE) -C build/tus all
	@echo "=== tus is successfully built ==="
	@echo ""
.PHONY: tus

run_tus: tus
	./build/tus/tus
.PHONY: run_tus

# all

all: cpu_sim tus
.PHONY: all