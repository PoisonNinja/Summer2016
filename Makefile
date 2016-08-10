CFLAGS += -std=gnu11

test: test.c
	$(CC) $(CFLAGS) $< -o $@

test-pic: test.c
	$(CC) $(CFLAGS) -fPIC $< -o $@

clean:
	$(RM) test
