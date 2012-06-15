CC=clang
CFLAGS=-I uv/include/
LDFLAGS=uv/uv.a

.PHONY: clean

uv-test: src/uv-test.c uv/uv.a
	${CC} ${CFLAGS} -c src/uv-test.c -o objs/uv-test.o
	${CC} objs/*.o ${LDFLAGS} -o uv-test

uv/uv.a:
	$(MAKE) -C uv

clean:
	rm -f objs/*.o uv-test

