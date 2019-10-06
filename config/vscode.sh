#!/usr/bin/env bash
source "./lib.sh"

install_code () {
    ok "Tô instalando aqui..."
    snap install --classic code-insiders
    ok "Acho que foi, heim!"
}

install_code_extensions () {
  read -r -p "Bora, instalar as extenssões? [y|N]" response
  if [[ $response =~ ^(y|yes|Y) ]];then
    ok "Vou instalar então..."
    pkglist=(
      ms-vscode.sublime-keybindings,
      ms-azuretools.vscode-docker,
      vscode-icons-team.vscode-icons,
      mikestead.dotenv,
      mechatroner.rainbow-csv,
      foxundermoon.shell-format,
      eg2.vscode-npm-script,
      bengreenier.vscode-node-readme
    )
    for i in ${pkglist[@]}; do
      code --install-extension $i
    done

    ok "mano, mandei rodar aqui, não sei se foi mas acho que foi sim!"
  else
    ok "Beleza então, deixa queto esse papo ai..."
  fi
}

apply_code_configs () {
  read -r -p "Vai querer sobrescrever as configs? [y|N] " response
  if [[ $response =~ ^(y|yes|Y) ]];then
    read -r -p "Quer salvar um backup das configs atuais? [Y|n] " backupresponse
    if [[ $backupresponse =~ ^(n|no|N) ]];then
        ok "Nem vou salvar então..."
    else
        cp $HOME/.config/Code/User/settings.json $HOME/.config/Code/User/settings.backup.json
        ok "Suas configs ficara aqui oh: $HOME/.config/Code/User/settings.backup.json"
    fi
    cp ./settings.json $HOME/.config/Code/User/settings.json

    ok "Pronto, agora já era, só restarta o code ai!"
  else
      ok "Beleza, vou deixar como tá então...";
  fi
}

code_exists () {
  code -v > /dev/null
  return $? -eq 0
}

if [[ code_exists ]];then
  ok "Opa, vi que já tem o code instalado!"
  install_code_extensions
  apply_code_configs
else
  read -r -p "Mano, não achei o vscode, vou instalar aqui, beleza? [y|N]" response
  if [[ $response =~ ^(y|yes|Y) ]];then
    ok "Vou instalar então..."
    install_code
    if [[ code_exists ]];then
      install_code_extensions
      apply_code_configs
    else
      error "Mano, eu rodei o comando aqui e deu um ruim, não sei o que é mas você precisa ver ai..."
    fi
  else
    ok "Beleza então, deixa queto esse papo ai..."
  fi
fi


# if [[ code_exists ]];then
#   read -r -p "Opa, vou instalar o code aqui, beleza? [y|N] " configresponse
#   if [[ $configresponse =~ ^(y|yes|Y) ]];then
#   fi


#   read -r -p "Bora instalar as extensões do code? [y|N] " configresponse
#   if [[ $configresponse =~ ^(y|yes|Y) ]];then
#     ok "Boa... tô instalando aqui!"
#     code --install-extension TwentyChung.jsx
#     code --install-extension anseki.vscode-color
#     code --install-extension bibhasdn.django-html
#     code --install-extension christian-kohler.npm-intellisense
#     code --install-extension dbaeumer.vscode-eslint
#     code --install-extension donjayamanne.python
#     code --install-extension dzannotti.vscode-babel-coloring
#     code --install-extension eg2.vscode-npm-script
#     code --install-extension qinjia.seti-icons
#     code --install-extension t-sauer.autolinting-for-javascript
#     code --install-extension timothymclane.react-redux-es6-snippets
#     code --install-extension Zignd.html-css-class-completion
#     code --install-extension abusaidm.html-snippets
#     code --install-extension christian-kohler.path-intellisense
#     code --install-extension mohsen1.prettify-json
#     code --install-extension robinbentley.sass-indented
#     code --install-extension mrmlnc.vscode-scss
#     code --install-extension cssho.vscode-svgviewer
#     code --install-extension bogdan-sinitsa.theme-dark-monokai
#     code --install-extension whtouche.vscode-js-console-utils
#     code --install-extension wix.vscode-import-cost

#     ok "mano, mandei rodar aqui, não sei se foi mas acho que foi sim!"
#   else
#     ok "Vou deixar pra depois...";
#   fi

#   read -r -p "Vai querer sobrescrever as configs? [y|N] " configresponse
#   if [[ $configresponse =~ ^(y|yes|Y) ]];then
#     read -r -p "Quer salvar um backup das configs atuais? [Y|n] " backupresponse
#     if [[ $backupresponse =~ ^(n|no|N) ]];then
#         ok "Nem vou salvar então..."
#     else
#         cp $HOME/.config/Code/User/settings.json $HOME.config/Code/User/settings.backup.json
#         ok "Your previous config has been saved to: $HOME/.config/Code/User/settings.backup.json"
#     fi
#     cp ./settings.json $HOME/.config/Code/User/settings.json

#     ok "New user config has been written. Please restart your VSC."
#   else
#       ok "Skipping user config overwriting.";
#   fi
# else
#     error "It looks like the command 'code' isn't accessible."
#     error "Please make sure you have Visual Studio Code installed"
#     error "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
# fi
