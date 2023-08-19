
# Function to show hidden files using fzf
fzf_hidden() {
    find "$1" -type f -name ".*" -print | fzf
}
