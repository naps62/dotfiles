source <(antibody init)

antibody_bundle=$(< $HOME/.config/zsh/antibody.bundle)

if [[ $VIMRUNTIME != "" ]]; then
  echo "filtering"
  antibody_bundle=$(echo $antibody_bundle | grep -v "zsh-autosuggestions")
else
  echo "not filtering"
fi

echo $antibody_bundle | antibody bundle
