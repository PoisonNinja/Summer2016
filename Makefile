CFLAGS += -std=gnu11

all: test test-32 test-pic test-pic-32

test: test.c
	$(CC) $(CFLAGS) $< -o $@

test-32: test.c
	$(CC) $(CFLAGS) -m32 $< -o $@

test-pic: test.c
	$(CC) $(CFLAGS) -fPIC $< -o $@

test-pic-32: test.c
	$(CC) $(CFLAGS) -fPIC $< -o $@

clean:
	$(RM) test test-*
