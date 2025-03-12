## About
Repository for the code from my <a href="https://www.linkedin.com/posts/carlos-daniel-pohlod-software-engineer_ruby-and-opengl-activity-7297409153684152320-pahM"> Linkedin Post </a>

Generate a Cube using OpenGl + Gosu (Ruby).

## Run

```bash
docker build -t gosu-app .
```

```bash
docker run --rm -e DISPLAY=$DISPLAY -e XDG_RUNTIME_DIR=/tmp -v /tmp/.X11-unix:/tmp/.X11-unix gosu-app
```
