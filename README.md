# docker-scythe

An experimental lightweight docker container which runs multiple services.

Current supported services are:

 - sshd
 - nginx

Container distribution is alpine linux with supervisor running as PID 2.

Build like this:

```
$ make build
```

And run in the foreground like this:

```
$ make run
```

# Issues

Report issues [here](https://github.com/rene00/docker-scythe/issues)
