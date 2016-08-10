CFLAGS += -Wall -Wextra -std=gnu11

test: test.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	$(RM) test
