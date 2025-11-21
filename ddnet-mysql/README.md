# ddnet-mysql

DDNet server image compiled with mysql support

```
podman run -ti docker.io/chillerdragon/ddnet-mysql:19.5 \
    /ddnet/DDNet-Server 'sv_use_sql 1;add_sqlserver r ddnet record ddnet "password" "localhost" "3306";add_sqlserver r ddnet record ddnet "password" "localhost" "3306"'
```

Is running a DDNet-Server with the default config, mysql and the map Sunny Side Up

