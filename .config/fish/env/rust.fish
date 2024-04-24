# Go (if go exists)
if command -q cargo
    set -Ua fish_user_paths $HOME/.cargo/bin $fish_user_paths
end


