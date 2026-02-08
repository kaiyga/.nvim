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

RUN git clone https://codeberg.org/kaiyga/dnvim ~/.config/nvim && \
  nvim --headless "+Lazy! sync" +qa 2>/dev/null && \ 
  nvim --headless "+TSUpdateSync" +qa 

RUN go install github.com/hashicorp/terraform-ls@latest


WORKDIR /work

SHELL ["/usr/bin/fish", "-c"]

