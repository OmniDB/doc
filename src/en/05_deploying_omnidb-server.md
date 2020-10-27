# 5. Deploying omnidb-server

OmniDB's settings allows users to deploy `omnidb-server` in different scenarios.

This section will provide details on how to properly configure OmniDB in the following
scenarios:

- Direct visibility: no applications between users accessing through the browser
and OmniDB

- Behind a reverse proxy: OmniDB is only visible by the intermediate proxy application
(`Apache` or `NGINX`)

Regardless of what method is used, it is **EXTREMELY** important that environment
is configured so that communication between users browsers and the machine hosting
OmniDB (or the intermediate application) is encrypted.

## 5.1. omnidb-server Post Installation

After installing `omnidb-server` in your preferred Linux distro, a service will
be automatically configured.

If you read the third chapter of this doc, you will know that OmniDB is supposed
to be started pointing (with `-d`) to a directory containing the configuration
file, `config.py`.

OmniDB's service will **NOT** point to any specific directory so the default will
be used, which is `~/.omnidb/omnidb-server` as `root` user. Make sure to edit the
`config.py` file in that directory if deploying OmniDB using the service.

If you're not using the service, edit the file that was created following the
guidelines present in the third chapter (`omnidb-server` Usability).

## 5.2. Deploying OmniDB directly

In this case no reverse proxies are used, OmniDB is accessed directly.

For this scenario the user needs to specify the following parameters:

- `LISTENING_ADDRESS`: Specify the address visible to the clients, can
be a domain.

- `LISTENING_PORT`: Specify a port that will be used in the browser
url: `https://mydomain.com:PORT`

- `IS_SSL`: `True`

- `SSL_CERTIFICATE_FILE`: `/path/to/file`

- `SSL_KEY_FILE`: `/path/to/file`

Authentication and database settings explained in the third chapter can also be
configured according to the needs.

## 5.3. Deploying OmniDB behind a reverse proxy

In this case OmniDB won't be accessed directly but through a properly configured
reverse proxy.

For this scenario a recommended approach is to run `omnidb-server` listening to the
local address `127.0.0.1` and without SSL, given that proxy will handle the security
part.

The following parameters are required:

- `LISTENING_ADDRESS`: `127.0.0.1`.

- `LISTENING_PORT`: Specify a port to which the load balancer will redirect all
OmniDB server requests.

**IMPORTANT**: OmniDB will not use `SSL` but it is recommended that you also enable the following
two settings:

- `SESSION_COOKIE_SECURE`: `True`
- `CSRF_COOKIE_SECURE`: `True`

These will make sure that the client connecting to OmniDB (thorugh proxy) will
only provide cookies if the connection is being done via `HTTPS`. Some browsers
initially connect via `HTTP` so you may have a security breach without those
settings.

Consider this example of OmniDB being hosted behind Nginx:

- Starting omnidb-server:

```bash
omnidb-server -d /home/user/omnidb_dir
```

- `/home/user/omnidb_dir/config.py`:

```
LISTENING_ADDRESS    = '127.0.0.1'
LISTENING_PORT       = 8000
IS_SSL                 = False
SESSION_COOKIE_SECURE  = True
CSRF_COOKIE_SECURE     = True
```

In this case OmniDB can only be accessed locally.

- `NGINX` configuration file:

```bash
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    include snippets/ssl-domain.conf;
    include snippets/ssl-params.conf;
    server_name domain.org;
    client_max_body_size 75M;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Ssl https;
        proxy_set_header   X-Forwarded-Proto https;
        proxy_set_header   X-Forwarded-Port 443;
        proxy_set_header   Host $host;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```

As can be seen, `NGINX` is listening for requests to `domain.org` in port `443`. All
requests will be redirected to `http://127.0.0.1:8000`. Users will access OmniDB
with `https://domain.org`

As explained in chapter three, users may want to configure `CUSTOM_PATH` in `config.py`,
which is useful when the domain is being shared with multiple applications.

For instance, if setting `CUSTOM_PATH = 'omnidb'`, `NGINX` can have the following
redirection rule:

```
location /omnidb {
    proxy_pass http://127.0.0.1:8000/omnidb;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Ssl https;
    proxy_set_header   X-Forwarded-Proto https;
    proxy_set_header   X-Forwarded-Port 443;
    proxy_set_header   Host $host;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
}
```

And OmniDB is accessed with `https://domain.org/omnidb`
