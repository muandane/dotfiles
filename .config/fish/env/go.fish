# Go (if go exists)
if command -vq go
    if not string match -q '*go\/libexec*' $PATH
        set -x GOPATH $HOME/go
        set -x GOROOT $(brew --prefix golang)/libexec
        set -x PATH $GOPATH $PATH
        set -x PATH $GOPATH/bin $PATH
        set -x GOPROXY https://proxy.golang.org
    end
end
