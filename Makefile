
ASM = nasm
ASMFLAGS = -felf64 -g
LD = ld

SRC = src
BUILD = build
MAIN = main

$(BUILD)/$(MAIN): $(BUILD)/$(MAIN).o $(BUILD)/utils.o
	@$(LD) $(BUILD)/$(MAIN).o $(BUILD)/utils.o -o $(BUILD)/$(MAIN)

$(BUILD)/$(MAIN).o: $(SRC)/$(MAIN).asm
	@mkdir -p $(BUILD)
	@$(ASM) $(ASMFLAGS) $(SRC)/$(MAIN).asm -o $(BUILD)/$(MAIN).o

$(BUILD)/utils.o: $(SRC)/utils.asm
	@$(ASM) $(ASMFLAGS) $(SRC)/utils.asm -o $(BUILD)/utils.o

.PHONY: run debug clean

run: $(BUILD)/$(MAIN)
	@$(BUILD)/$(MAIN)

debug: $(BUILD)/$(MAIN)
	@gdb $(BUILD)/$(MAIN)

clean:
	@rm -rf $(BUILD)
