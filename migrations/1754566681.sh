echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/autarchy/themes/osaka-jade ]]; then
  rm -rf ~/.config/autarchy/themes/osaka-jade
  git -C ~/.local/share/autarchy checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/autarchy/themes/osaka-jade ~/.config/autarchy/themes/osaka-jade
fi
