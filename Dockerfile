FROM archlinux

RUN pacman --noconfirm -Syyuu \ 
    neovim \
    fish \ 
    tmux \
    go gopls \ 
    npm zig \ 
    terraform \
    git \
    && rm -rf /var/cache/pacman/pkg/*

ENV GOPATH=/root/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

RUN go install github.com/hashicorp/terraform-ls@latest

RUN git clone https://codeberg.org/kaiyga/dnvim ~/.config/nvim

WORKDIR /work

SHELL ["/usr/bin/fish", "-c"]

