# mkdocs
This is a pre-built mkdocs image for use with markdown hosting of course content. Below are some cheat sheet commands for reference.

## Easy method to installing Docker (assumes Ubuntu 18.04)

```bash
wget https://raw.githubusercontent.com/HASecuritySolutions/elastic_stack/master/scripts/prereq.sh
bash prereq.sh
```

## Download mkdocs image

```bash
docker pull hasecuritysolutions/mkdocs
```

## Run mkdocs in serve mode (act as webserver)

```bash
docker run -it -v /path/to/mkdocs/files:/mkdocs -p 8080:8080 hasecuritysolutions/mkdocs mkdocs serve --dev-addr 0.0.0.0:8080 --config-file /mkdocs/mkdocs.yml
```

## Run mkdocs to build new version

```bash
docker run -it -v /path/to/mkdocs/files:/mkdocs hasecuritysolutions/mkdocs
```
