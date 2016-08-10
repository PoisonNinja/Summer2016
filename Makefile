CFLAGS += -std=gnu11

all: test-64 test-32 test-64-pic test-32-pic

test-64: test.c
	$(CC) $(CFLAGS) $< -o $@

test-32: test.c
	$(CC) $(CFLAGS) -m32 $< -o $@

test-32-pic: test.c
	$(CC) $(CFLAGS) -m32 -fPIC $< -o $@

test-64-pic: test.c
	$(CC) $(CFLAGS) -fPIC $< -o $@

clean:
	$(RM) test-*
