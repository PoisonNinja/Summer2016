CFLAGS += -std=gnu11 -shared -fPIC

all: test-64.so test-32.so

test-64.so: test.c
	$(CC) $(CFLAGS) $< -o $@

test-32.so: test.c
	$(CC) $(CFLAGS) -m32 $< -o $@

clean:
	$(RM) *.so
