FROM golang:1.10-alpine

# Install system utils
RUN apk update \
  && apk --no-cache --no-progress add \
    bash \
    curl \
    git \
    wget
RUN printf "alias l='ls -CF'\nalias ll='ls -alF'\nalias ls='ls --color=auto'\nPS1='[\\\u@\\h \\W]\\$ '" >> /root/.bashrc

# Install Glide
RUN curl -s https://glide.sh/get | sh

# Install Bee
RUN go get -u github.com/beego/bee

# App
ENV APP_HOME /go/src/ibee
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 8080
CMD ["/bin/bash"]

