# Nginx WebDAV Docker Image

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/yorch/nginx-webdav)](https://hub.docker.com/r/yorch/nginx-webdav)
[![](https://images.microbadger.com/badges/image/yorch/nginx-webdav.svg)](https://microbadger.com/images/yorch/nginx-webdav)
[![](https://images.microbadger.com/badges/version/yorch/nginx-webdav.svg)](https://microbadger.com/images/yorch/nginx-webdav)
[![Docker Pulls](https://img.shields.io/docker/pulls/yorch/nginx-webdav.svg)](https://hub.docker.com/r/yorch/nginx-webdav)

## How to use this image

```console
$ docker run --name webdav -p 80:80 -v /media:/media -d yorch/nginx-webdav
```

This will start a webdav server listening on port `80`.
Then access it via `http://localhost` or `http://host` in a browser.

This server will serve files located in your `/media` folder

Image's supported volumes:

- `/media` - served directory

To restrict access to only authorized users, you can define two environment variables: `USERNAME` and `PASSWORD`

```console
$ docker run --name webdav -p 80:80 -v /media:/media -e USERNAME=webdav -e PASSWORD=webdav -d yorch/nginx-webdav
```

## License

MIT License

Copyright (c) 2020 Jorge Barnaby

See [LICENSE](LICENSE)
