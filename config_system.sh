mv $HOME/.bashrc $HOME/.bashrc.bkpyuri-$(date -u +%Y-%m-%dT%H:%M:%S%Z)
ln -s $HOME/.config/config-repo/.bashrc $HOME/.bashrc
mv $HOME/.zshrc $HOME/.zshrc.bkpyuri-$(date -u +%Y-%m-%dT%H:%M:%S%Z)
ln -s $HOME/.config/config-repo/.zshrc $HOME/.zshrc
mv $HOME/.p10k.zsh $HOME/.p10k.zsh.bkpyuri-$(date -u +%Y-%m-%dT%H:%M:%S%Z)
ln -s $HOME/.config/config-repo/.p10k.zsh $HOME/.p10k.zsh
mv $HOME/.tmux.conf.local $HOME/.tmux.conf.local.bkpyuri-$(date -u +%Y-%m-%dT%H:%M:%S%Z)
ln -s $HOME/.config/config-repo/.tmux.conf.local $HOME/.tmux.conf.local

ls -la $HOME | grep -e "->"