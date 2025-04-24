# Kompo MCP rb server

## MCP setting

### VS Code

```
{
  "servers": {
    "hello": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "kompo-mcp-rb-server"
      ]
    },
  }
}
```

### development

https://github.com/modelcontextprotocol/inspector

```
npx @modelcontextprotocol/inspector start.sh
```

## kompo

### install kompo in local repository

```
gem install
```

### run kompo

```
docker build --no-cache -t kompo-mcp-rb-server .
docker run -it --rm -v .:/app kompo-mcp-rb-server bash

# build kompo-vfs
# cd kompo-vfs
# rm -rf target
# cargo build --release
# cd ..

# install kompo
# cd kompo
# gem build kompo.gemspec
# cd ../
gem install kompo/kompo-0.2.0.gem

# run kompo
# kompo -e server.rb -o hello-mcp-server
LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 kompo -e server.rb --local-kompo-fs-dir=kompo-vfs
```

# run app
```
docker run -it --rm kompo-mcp-rb-server ./app
```