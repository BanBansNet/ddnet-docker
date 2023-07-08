# Dockerfile for production ddnet servers

## ddnet-simple

A simple works out of the box minimal ddnet server.
Running with a default ddnet config sqlite3 and the map Sunny Side Up.
Listening for connections on port 8303.

```bash
$ podman run docker.io/chillerdragon/ddnet-simple:17.0.3
2023-07-08 09:32:01 I engine: running on unix-linux-amd64
2023-07-08 09:32:01 I engine: arch is little endian
2023-07-08 09:32:01 I engine: operating system version: Linux 6.1.0-9-amd64 (x86_64, #1 SMP PREEMPT_DYNAMIC Debian 6.1.27-1 (2023-05-08)); "Alpine Linux v3.18"
2023-07-08 09:32:01 I storage: warning: no data directory found
2023-07-08 09:32:01 I storage: couldn't open storage.cfg
2023-07-08 09:32:01 I storage: using standard paths
2023-07-08 09:32:01 I storage: added path '$USERDIR' ('/root/.local/share/ddnet')
2023-07-08 09:32:01 I storage: added path '$CURRENTDIR' ('/ddnet')
2023-07-08 09:32:01 I http: libcurl version 8.1.2 (compiled = 8.1.2)
2023-07-08 09:32:01 I host_lookup: host='localhost' port=0 1
2023-07-08 09:32:01 I host_lookup: host='localhost' port=0 2
2023-07-08 09:32:01 I server: starting...
2023-07-08 09:32:01 I server: using port 8303
2023-07-08 09:32:01 I server: server name is 'unnamed server'
2023-07-08 09:32:01 I censorlist: failed to open 'censorlist.txt'
2023-07-08 09:32:01 I sql: failed to open wordlist, using fallback
2023-07-08 09:32:01 I server: version 17.0.3 on linux amd64
2023-07-08 09:32:01 I server: +-------------------------+
2023-07-08 09:32:01 I server: | rcon password: '4GjC6n' |
2023-07-08 09:32:01 I server: +-------------------------+
2023-07-08 09:32:01 I register/6/ipv6: registering...
2023-07-08 09:32:01 I register/6/ipv4: registering...
2023-07-08 09:32:01 I sql: [2] load best time done on read database 0
```

