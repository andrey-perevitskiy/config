CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
LDFLAGS =
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
SRC = $(addprefix $(SRC_DIR)/,main.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
BIN_NAME = prog

.PHONY: all
all: $(BIN_DIR)/$(BIN_NAME)

$(BIN_DIR)/$(BIN_NAME): $(OBJ) | $(BIN_DIR)
	$(CC) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	[ -d $(OBJ_DIR) ] || mkdir $(OBJ_DIR)

$(BIN_DIR):
	[ -d $(BIN_DIR) ] || mkdir $(BIN_DIR)

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
