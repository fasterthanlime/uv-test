CC=clang
CFLAGS=-Iuv/include -std=gnu99
LDFLAGS=uv/uv.a -pthreads -lrt -lm

.PHONY: clean

uv-test: src/uv-test.c uv/uv.a
	${CC} ${CFLAGS} -c src/uv-test.c -o objs/uv-test.o
	${CC} objs/*.o ${LDFLAGS} -o uv-test

uv/uv.a:
	$(MAKE) -C uv

clean:
	rm -f objs/*.o uv-test

