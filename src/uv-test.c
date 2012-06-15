#include <uv.h>
#include <stdio.h>

static uv_loop_t* uv_loop;

void getaddrinfo_cb(uv_getaddrinfo_t* handle, int status, struct addrinfo* res) {
    printf("DNS resolved, status = %d\n", status);
}

int main(int argc, char** argv) {
    int r;
    uv_loop = uv_default_loop();

    uv_getaddrinfo_t addr_handle;
    r = uv_getaddrinfo(uv_loop, &addr_handle, getaddrinfo_cb, "api.themoviedb.org", NULL, NULL);

    printf("Running...\n");
    uv_run(uv_loop);

    return 0;
}

