CFLAGS += -Wall -Wextra -std=gnu11 -fPIC

test: test.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	$(RM) test
