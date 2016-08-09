CFLAGS += -Wall -Wextra -std=gnu11

test: test.c libfunc.so
	$(CC) $(CFLAGS) $< -o $@ -L./ -lfunc

libfunc.so: func.c
	$(CC) $(CFLAGS) -c -fPIC $< -o $@

clean:
	$(RM) test libfunc.so
