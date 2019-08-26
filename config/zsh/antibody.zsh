source <(antibody init)

antibody_bundle=$(< $HOME/.config/zsh/antibody.bundle)

if [[ $VIMRUNTIME != "" ]]; then
  antibody_bundle=$(echo $antibody_bundle | grep -v "zsh-autosuggestions")
fi

echo $antibody_bundle | antibody bundle
