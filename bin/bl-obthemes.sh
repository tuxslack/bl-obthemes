#!/bin/bash
#
# Tradução PT-BR: Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:           27/09/2024 as 00:44:59
# Homepage:       https://github.com/tuxslack/bl-obthemes
# Licença:        GPL
#
#    bl-obthemes: script to save or restore various GUI theme settings
#    Copyright (C) 2015-2020 damo    <damo@bunsenlabs.org>
#                  2018-2023 John Crawley <john@bunsenlabs.org>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# Save options are for  Conky(s)
#                       Tint2(s)
#                       Openbox theme
#                       GTK theme
#                       Background (uses Nitrogen or feh, depending which
#                                   has the newer saved bg config file)
#                       Alt Menu (dmenu)
#                       Lightdm login gtk greeter
#                       X configs (.bashrc, .Xresources)
#                       Terminal emulator config
#
# Paths are assumed to be BunsenLabs defaults
#
# A Screenshot is saved (Windows are hidden briefly so the image
#                        is the bare desktop, with any Tint2s
#                        or Conkys which are running, and a representive
#                        menu and window open)
#
# A time-stamped backup of rc.xml is saved "just in case".
#
# USER VARIABLE: xdotool is used to move the mouse pointer, and assumes the
# root-menu is shown with "Super + Space" keys, and the right mouse button is
# set for "r-click". If you have set these to something else, then edit the
# "MENUMODIFIER" variable and "MOUSECMD" array.
# Set the variable "KEYDOWN" to where "Preferences" is in the root-menu (or
# anything else you might want displayed).
# The image viewer is set to be "bl-image-viewer". Edit the "IMGCMD" variable
# to change this.
#
# WARNING: Conkys in non-default directories are saved, but
# will not be seen when running the bl conky manager.
#
########################################################################
#
# KNOWN ISSUES:
# Virtualbox does not allow the guest to move the host mouse cursor, using xdotool,
# so the screenshot may produce an incorrect theme displayed and/or poor positioning.
# A workaround is to move the cursor to some free space, and use the "Enter" key in the
# "Configurations to be saved:" dialog.
#


# bunsen-blob

# https://github.com/BunsenLabs/bunsen-blob/blob/37eedaf07e48f655baa5938871873af7cf7f31bb/bin/bl-obthemes#L3
# https://github.com/BunsenLabs/bunsen-blob/issues
# https://fosspost.org/bunsenlabs-lithium


# bunsen-docs

# https://github.com/BunsenLabs/bunsen-docs.git
# https://github.com/BunsenLabs/bunsen-docs/issues



# Pacotes:

# https://pkg.bunsenlabs.org/debian/



# Não esta funcionando restoreobmenugenerator => Se os arquivos config.pl e schema.pl estiver na pasta ~/.config/obmenu-generator/ não tem erro ao restaurar



# ----------------------------------------------------------------------------------------

# Resultado da saída do script bl-obthemes.sh:


# ./bl-obthemes.sh: linha 1472: xmlstarlet: comando não encontrado
# ./bl-obthemes.sh: Cannot read source file /home/fernando/.gtkrc-2.0.mine
# ./bl-obthemes.sh: Failed to save /home/fernando/.gtkrc-2.0.mine
# ./bl-obthemes.sh: Failed to save the necessary GTK config files
# ./bl-obthemes.sh: Cannot read source file /home/fernando/.config/dmenu/dmenu-bind.sh
# ./bl-obthemes.sh: Failed to save /home/fernando/.config/dmenu/dmenu-bind.sh
# ./bl-obthemes.sh: Failed to save demenu config file .config/dmenu/dmenu-bind.sh
# ./bl-obthemes.sh: Cannot read source file /etc/lightdm/lightdm-gtk-greeter.conf
# ./bl-obthemes.sh: Failed to save LightDM config file /etc/lightdm/lightdm-gtk-greeter.conf to /home/fernando/.config/blob/voidlinux/lightdm-gtk-greeter.conf
# ./bl-obthemes.sh: Cannot read source file /home/fernando/.Xresources
# ./bl-obthemes.sh: Failed to save /home/fernando/.Xresources
# ./bl-obthemes.sh: Failed to save X configs file .Xresources
# ./bl-obthemes.sh: linha 1644: bl-xinerama-prop: comando não encontrado
# ./bl-obthemes.sh: linha 2987: hash: bl-restart: não encontrado
# ./bl-obthemes.sh: linha 2708: bl-xinerama-prop: comando não encontrado


# ----------------------------------------------------------------------------------------


# Cria uma variavel informando o caminho completo do arquivo de configuração do programa.

# * Backup
#
#   Copia os arquivos
#
# * Restauração
#
#   Restaurar os arquivos




# Identificar se os processos estão rodando e copiar os arquivos


# $ ps -aux | grep conky | grep -v grep
# fernando  1568  1.2  0.1 405364 13284 ?        Sl   18:53   0:04 conky --daemonize --pause=1 -c /home/fernando/.conky/conkyrc-slackware/conkyrc-slackware

# $ ps -aux | grep plank | grep -v grep
# fernando  1488  1.3  1.3 1237996 99884 ?       Sl   18:53   0:05 plank


# $ ps -aux | grep tint2 | grep -v grep
# fernando  1490  0.2  0.3 119832 29024 ?        Sl   18:53   0:01 tint2 -c /home/fernando/.config/tint2/tint2rc-macOS


# $ ps -aux | grep picom | grep -v grep
# fernando  1499  4.2  0.8 403736 62336 ?        Sl   18:53   0:25 picom --config /home/fernando/.config/picom/picom.conf



# $ ps -aux | grep "openbox --startup" | grep -v grep
# fernando  1460  0.1  0.3 121800 26672 ?        Sl   18:52   0:01 /usr/bin/openbox --startup /usr/libexec/openbox-autostart OPENBOX


# Nitrogen

# $ cat ~/.config/nitrogen/bg-saved.cfg | grep file | cut -d= -f2
# /home/fernando/Imagens/macOS/mbuntu-5.jpg



# Tema do Openbox

# cat ~/.config/openbox/rc.xml | grep "<name>" | head -n1
#    <name>Clearlooks</name>



# Como copiar as configurações que o usuário esta usando atualmente para depois restaurar.



clear

# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor


# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados:


# Yet Another Dialog - crie/interaja com caixas de diálogo GTK+

which yad            1> /dev/null 2> /dev/null || { echo "Programa Yad não esta instalado."        ; exit ; }


which sudo           1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa sudo não esta instalado."    --width="450" --height="100" 2>/dev/null   ; exit ; }


# Ferramenta de automação X11 de linha de comando

which xdotool        1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa xdotool não esta instalado."  --width="450" --height="100" 2>/dev/null   ; exit ; }


# Utilitário simples de "captura de tela" de linha de comando para X

which scrot          1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa scrot não esta instalado."    --width="450" --height="100" 2>/dev/null   ; exit ; }


# Gerenciador de janelas compatível com padrões, rápido, leve e extensível

which openbox        1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa OpenBox não esta instalado."  --width="450" --height="100" 2>/dev/null   ; exit ; }


# Navegador e configurador de plano de fundo para X com suporte para Xinerama

which nitrogen       1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa Nitrogen não esta instalado." --width="450" --height="100" 2>/dev/null   ; exit ; }


# which feh           1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa feh não esta instalado."          --width="450" --height="100" 2>/dev/null ; exit ; }


# Visualizador de imagens e navegador para a área de trabalho GNOME

which gthumb         1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa gThumb não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }


# Compositor leve para X11 (anteriormente um fork Compton)

which picom          1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa picom não esta instalado."    --width="450" --height="100" 2>/dev/null   ; exit ; }


# Painel Tint2

which tint2          1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa tint2 não esta instalado."    --width="450" --height="100" 2>/dev/null   ; exit ; }


# obmenu-generator

which obmenu-generator    1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa obmenu-generator não esta instalado."    --width="450" --height="100" 2>/dev/null   ; exit ; }


# Menu iniciar (jgmenu)

# which jgmenu          1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa jgmenu não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }


# Menu genérico para X

# which dmenu          1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa dmenu não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }


# Alternador de janelas, caixa de diálogo de execução e substituição de dmenu

# which rofi          1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa rofi não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }



# Utilitários de linha de comando para transformar, consultar, validar e editar XML

# $ xbps-query -f xmlstarlet
# /usr/bin/xml
# /usr/share/doc/xmlstarlet/html.css
# /usr/share/doc/xmlstarlet/xmlstarlet-ug.html
# /usr/share/doc/xmlstarlet/xmlstarlet.txt
# /usr/share/licenses/xmlstarlet/COPYING
# /usr/share/man/man1/xmlstarlet.1


# which xml           1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa xmlstarlet não esta instalado."  --width="450" --height="100" 2>/dev/null  ; exit ; }


which lxappearance  1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa lxappearance não esta instalado." --width="450" --height="100" 2>/dev/null ; exit ; }


which obconf        1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa obconf não esta instalado."       --width="450" --height="100" 2>/dev/null ; exit ; }


which conky         1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa Conky não esta instalado."        --width="450" --height="100" 2>/dev/null ; exit ; }


which sed           1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa sed não esta instalado."          --width="450" --height="100" 2>/dev/null ; exit ; }


# which plank          1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa plank não esta instalado."       --width="450" --height="100" 2>/dev/null ; exit ; }



## Não tem os programas bl-xinerama-prop e bl-restart


# which bl-xinerama-prop  1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa bl-xinerama-prop não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }


# which bl-restart        1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa bl-restart não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }



# which bl-install        1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa bl-install não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }

# which bl-reload-gtk23   1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa bl-reload-gtk23 não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }

# which  bl-conky-session 1> /dev/null 2> /dev/null || { yad --center --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa bl-conky-session não esta instalado."   --width="450" --height="100" 2>/dev/null   ; exit ; }



# ----------------------------------------------------------------------------------------


HELP='bl-obthemes é um script para salvar ou restaurar as configurações do tema gui.

Uso:  bl-obthemes [-h|--help][-v|--verbose]


Argumentos opcionais:

        -h, --help                   mostrar esta mensagem
        -v, -d, --verbose, --debug   descrever ações sendo executadas
Nenhuma outra opção CLI é suportada.


Opções de salvamento:

            Conky(s)

            Tint2(s)

            Plank

            obmenu-generator

            Tema OpenBox (theme)

            GTK theme

            Papel de parede (Background)

            (usa Nitrogen ou feh, dependendo de qual tem o arquivo de configuração bg mais recente salvo)


            Menu alternativo (dmenu)

            Lightdm login gtk saudação

            Configurações X (.bashrc, .Xresources)

            Configuração do emulador de terminal (se disponível)

            Configuração do compositor (se disponível)

            Tema do jgmenu (se disponível)


Os caminhos são considerados padrões do BunsenLabs.

Uma captura de tela é salva

                    (As janelas ficam ocultas brevemente para que a imagem
                     seja a área de trabalho vazia, com qualquer Tint2s
                     ou Conkys em execução e um menu representativo
                     e janela abertos.)


Um backup com registro de data e hora do rc.xml é salvo "para garantir".


Configuração:

 VARIÁVEL DO USUÁRIO: xdotool é usado para mover o ponteiro do mouse e assume que o menu 
 raiz é exibido com as teclas "Super + Espaço" e o botão direito do mouse está definido 
 para "clique com o botão direito". Se você tiver definido isso para outra coisa, edite a 
 variável "MENUMODIFIER" e o array "MOUSECMD".

 Defina a variável "KEYDOWN" para onde "Preferências" está no menu raiz (ou qualquer outra 
 coisa que você queira exibir).

 O visualizador de imagens está definido como "gThumb". Edite a variável "IMGCMD"
 para alterar isso.


AVISO:

Conkys em diretórios não padrão são salvos, mas não serão vistos
ao executar o gerenciador de bl conky.


PROBLEMAS CONHECIDOS:

O Virtualbox não permite que o convidado mova o cursor do mouse do host,
usando xdotool, então a captura de tela pode produzir um tema incorreto exibido
e/ou posicionamento ruim.

Uma solução alternativa é mover o cursor para algum espaço livre e usar
a tecla "Enter" na caixa de diálogo "Configurações a serem salvas:".

'

debug() { : ;}
DEBUG_FLAG=0 # will be interpreted numerically, as boolean
for i in "$@"
do
    case "$i" in
    -h|--help)
        echo "$HELP"
        exit 0
        ;;
    -v|-d|--verbose|--debug)
        debug() {
            echo -e "$*"
        }
        DEBUG_FLAG=1
        ;;
    *)
        echo "${0}: ${i}: não existe essa opção."
        exit 1
        ;;
    esac
done

######################### VARIÁVEIS ####################################

# ( Com algumas exceções, os nomes das variáveis GLOBAL estão em maiúsculas, as funções locais estão em minúsculas )


### CONFIGURAÇÕES DO USUÁRIO PARA ESTE SCRIPT


# Alterado de "bl-image-viewer" para "gThumb"

IMGCMD="gthumb"             # Comando de aplicação para visualizar captura de tela


# Buscar por "root-menu" no arquivo ~/.config/openbox/rc.xml para verificar as teclas de atalho para chama o menu do OpenBox.

# Ex: xdotool key --clearmodifiers "Super+m"

MENUMODIFIER="Super+m"      # Atalho de teclado para mostrar o menu raiz

KEYDOWN="10"                # Ajuste isso para onde "Preferências" está no menu
MOUSECMD=(click 3)          # Clique direito do mouse


### GLOBAIS

USRCONFIGPATH="$HOME/.config/bl-obthemes"

SYSCONFIGPATH="/usr/share/bl-obthemes"

CURSESSFILE="$USRCONFIGPATH/current"

### USER CONFIG VARIABLES TO BE SAVED AND RESTORED
OBPATH="$HOME/.config/openbox"
RCFILE="$OBPATH/bl-rc.xml" # NB now using the new BunsenLabs file name
OLDRCFILE="$OBPATH/rc.xml"
GTK2=".gtkrc-2.0"
GTK2MINE=".gtkrc-2.0.mine"
GTK3=".config/gtk-3.0"
GTK3x=".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml"
FEHFILE=".fehbg"
NITROFILE=".config/nitrogen/bg-saved.cfg"
DMENU=".config/dmenu/dmenu-bind.sh"
XFILE=".Xresources"
BASHRC=".bashrc"
#TERMFILE='' # now termfile is set dynamically by checkTerm() in saveSettings()


# Programa esta desatualizado ~/.config/compton.conf

COMPFILE=".config/picom.conf"

OLDCOMPFILE=".config/picom/picom.conf"


JGMENURC=".config/jgmenu/jgmenurc" # jgmenu theming, not menu content


# Pasta do Conky

CONKYPATH=".config/conky"


# Pasta do painel Tint2

TINTPATH=".config/tint2"


# Pasta do Plank

PLANKPATH=".config/plank"


# Pasta do obmenu-generator

obmenu_generator_PATH=".config/obmenu-generator"


# These sessions will not be saved as-is,
# but generated from the running conky/tint2 processes.
# Saved files will be restored.

CONKYSESSION="$CONKYPATH/conky-sessionfile"
TINTSESSION="$TINTPATH/tint2-sessionfile"

### SYSTEM CONFIG VARIABLES TO BE SAVED AND RESTORED
LDMDIR="/etc/lightdm"
LDM="lightdm-gtk-greeter.conf"

### END CONFIGS VARIABLES

# current running openbox session, tested when script starts
# usually set to "bunsenlabs", but "openbox" for a vanilla openbox session
OBSESSION=''

# used by forkncheck()
FORKWAIT='0.3' # time to wait before checking if a forked process is still running
# use any value which is  accepted by 'sleep'

# used when translating paths in system preset themes
HOME_MARKER='%USERHOME%'

# packages needed for particular GTK themes
declare -A theme_pkgs=(
[Beam]=bunsen-themes
[Beam-HiDPI]=bunsen-themes
[BL-Fever_Room]=bunsen-themes
[BL-Lithium]=bunsen-themes
[BL-Lithium-light]=bunsen-themes
[Boron-aqua]=bunsen-themes
[Boron-darkred]=bunsen-themes
[Boron-light-aqua]=bunsen-themes
[Bunsen-He]=bunsen-themes
[Bunsen-He-flatish]=bunsen-themes
[Dragon]=bunsen-themes
[Yeti]=bunsen-themes
[Be-Penguin]=bunsen-themes-extra
[Be-Penguin-light]=bunsen-themes-extra
[Boron-blue]=bunsen-themes-extra
[Boron-dark]=bunsen-themes-extra
[Boron-light]=bunsen-themes-extra
[Boron-light-moss]=bunsen-themes-extra
[Boron-moss]=bunsen-themes-extra
[Bunsen-Blackish-Remix]=bunsen-themes-extra
[Crocus-Remix]=bunsen-themes-extra
[RainForest]=bunsen-themes-extra
[SoftWaves]=bunsen-themes-extra
[Yeti-Lith]=bunsen-themes-extra
)

# packages needed for particular icon themes
declare -A icon_pkgs=(
[Faenza-Dark-Bunsen]='bunsen-faenza-icon-theme'
[Faenza-Bunsen]='bunsen-faenza-icon-theme'
[Paper-Bunsen]='bunsen-paper-icon-theme'
[Papirus-Bunsen-grey]='bunsen-papirus-icon-theme'
[Papirus-Bunsen-bluegrey]='bunsen-papirus-icon-theme'
[Papirus-Bunsen-Dark-grey]='bunsen-papirus-icon-theme'
[Papirus-Bunsen-Dark-bluegrey]='bunsen-papirus-icon-theme'
[Papirus-Bunsen-Dark-black]='bunsen-papirus-icon-theme'
[Numix-Bunsen-Circle-aqua]='bunsen-numix-icon-theme'
[Numix-Bunsen-Circle-aqua-Light]='bunsen-numix-icon-theme'
[Numix-Bunsen-Circle-darkred]='bunsen-numix-icon-theme'
[Numix-Bunsen-Circle-darkred-Light]='bunsen-numix-icon-theme'
[Adwaita]='adwaita-icon-theme'
)

# packages needed for particular BL wallpapers
declare -A wallpaper_pkgs=(
[Boron-Emerald-logo-1280x1024.png]='bunsen-images-base'
[Boron-Emerald-logo-1440x900.png]='bunsen-images-base'
[Boron-Emerald-logo-1920x1080.png]='bunsen-images-base'
[Boron-Emerald-plain-1280x1024.png]='bunsen-images-base'
[Boron-Emerald-plain-1440x900.png]='bunsen-images-base'
[Boron-Emerald-plain-1920x1080.png]='bunsen-images-base'
[Ruby-flame-1280x1024.png]='bunsen-images-base'
[Ruby-flame-1440x900.png]='bunsen-images-base'
[Ruby-flame-1920x1080.png]='bunsen-images-base'
[Ruby-plain-1280x1024.png]='bunsen-images-base'
[Ruby-plain-1440x900.png]='bunsen-images-base'
[Ruby-plain-1920x1080.png]='bunsen-images-base'
[tile.png]='bunsen-images-base'
[default]='bunsen-images-base'
[Boron-dark-1280x1024.png]='bunsen-images'
[Boron-dark-1440x900.png]='bunsen-images'
[Boron-dark-1920x1080.png]='bunsen-images'
[Before-Sunrise.jpg]='bunsen-images'
[Beryllium-1280x1024.jpg]='bunsen-images'
[Beryllium-1440x900.jpg]='bunsen-images'
[Beryllium-1920x1080.jpg]='bunsen-images'
[Fever_Room.jpg]='bunsen-images'
[grey.png]='bunsen-images'
[Networks.png]='bunsen-images'
[Yeti.jpg]='bunsen-images'
[BL-beam.png]='bunsen-images-archives'
[BL-beam-grey.png]='bunsen-images-archives'
[BL-beam-plain.png]='bunsen-images-archives'
[BL-beam-plain-grey.png]='bunsen-images-archives'
[flame-text-1920x1200-centre-blue.png]='bunsen-images-archives'
[flame-text-1920x1200-centre.png]='bunsen-images-archives'
[flame-text-1920x1200-right.png]='bunsen-images-archives'
[flame-text-2560x1080.png]='bunsen-images-archives'
[Lithium.png]='bunsen-images-archives'
[Lithium-grey-logo-only.png]='bunsen-images-archives'
[Lithium-logo-only.png]='bunsen-images-archives'
)

###

THEMEPATH_1="$HOME/.themes"
THEMEPATH_2="$HOME/.local/share/themes"
THEMEPATH_3="/usr/share/themes"
THEMEPATH_4="/usr/local/share/themes"
gtkPaths=("$THEMEPATH_1" "$THEMEPATH_2" "$THEMEPATH_3" "$THEMEPATH_4")

ICONPATH_1="$HOME/.icons"
ICONPATH_2="$HOME/.local/share/icons"
ICONPATH_3="/usr/share/icons"
ICONPATH_4="/usr/local/share/icons"
iconPaths=("$ICONPATH_1" "$ICONPATH_2" "$ICONPATH_3" "$ICONPATH_4")

wallpath_sys1="/usr/share/images"
wallpath_sys2="/usr/share/backgrounds"
wallpath_usr="$HOME/Pictures/wallpapers"
wallpaths=("$wallpath_sys1" "$wallpath_usr" "$wallpath_sys2")

### DIALOG VARIABLES
TITLE="Gerenciador de temas BLOB"


# Localização do arquivo: /usr/share/icons/hicolor/scalable/places/distributor-logo-bunsenlabs.svg

ICON="distributor-logo-bunsenlabs"


yad_args=( '--center'  '--borders=20' "--window-icon=$ICON" )
popup_args=( "${yad_args[@]}" "--title=$TITLE" '--undecorated' '--fixed' )
OK="--button=OK:0"
CANCEL="--button=Cancelar:1"
EXIT="--button=Fechar:1"
CLOSE="--button=Fechar:1"
HLPBTN="--button=_Ajuda:10"


## ETIQUETAS LEGÍVEIS PELO USUÁRIO

PICKOB="Tema OpenBox"
PICKGTK="Tema GTK"
PICKICONS="Tema de ícones"
PICKBG="Papel de parede de fundo"
PICKCONKY="Conky"
PICKTINT="Tint2"
PICKPLANK="Plank"
PICKDMENU="dmenu (Menu alternativo)"
PICKLDM="Tema de login do Lightdm"

# PICKEXIT="Exit dialog theme" # bl-exit no longer has separate themes
# PICKTERM=''                  # now not global, pickterm is from checkTerm(), local in saveSettings()

PICKX="Configurações X"
PICKBASH="Configurações do Bash"
PICKCOMP="Compositor"
PICKJGMENU="Tema do jgmenu"


### VARIÁVEIS DE DIÁLOGO FINAL

####################### VARIÁVEIS FINAIS ##################################


######################### FUNÇÕES ####################################

### FUNÇÕES DE DIÁLOGO

# yad displays cancel & OK buttons by default
# --button=* arguments will overrule this default

# arbitary options (eg --entry) can be passed *after* the text
yad_prompt() {
    yad "${popup_args[@]}" --text="$1" --width=300 "${@:2}"
}

yad_question() {
    yad "${popup_args[@]}" --text="$1" \
    --image="dialog-question" --width=300 "${@:2}"
}

yad_warning() {
    yad "${popup_args[@]}" --text="$1" \
    --image="dialog-warning" --width=300 --button="Fechar":0
}

yad_warning_option() {
    yad "${popup_args[@]}" --text="$1" \
    --image="dialog-warning" --width=300 --button="Continue assim mesmo:0" "$EXIT"
}

yad_fatal_error() {
    yad "${popup_args[@]}" --text="$1" \
    --image="dialog-error" --width=300 "$EXIT"
}

### END DIALOG FUNCTIONS

# Trap will pass the line number where the error ocurred as $1,
# and the command run on that line as $2.
# This should not be needed once error handling is all done separately.

trap_error(){
    local msg="Ocorreu um erro on-line ${1}, função de execução '${2}', comando '${3}'.\nPor favor, considere relatar isso aos desenvolvedores."

    # echo -e "$0: $msg" >&2

    echo -e "$0: ${RED}$msg ${NC}" >&2

    if yad_warning_option "$msg"
    then
        debug "Continuando apesar do erro de restauração."
    else
        exit 1
    fi
}

# Usage: createFlag filename
# Currently used in Intro()
# to record if "About" window has been shown.

createFlag() {
    # mkdir -p "$HOME/.config/bunsen"
    touch "$HOME/.config/bunsen/$1"
}


# Isso é executado no início.

# OBSESSION global used in getScrot()

firstChecks() {

    # Não execute como Root (coisas ruins podem acontecer).

    if [[ $( id -u ) -eq 0 ]]; then
        echo $"$0: Erro: Este script não deve ser executado pelo Root." >&2
        exit 1
    fi


    # Teste se o OpenBox está em execução e com qual arquivo de sessão.

    obline=$(pgrep -ax -u "$USER" openbox) || {
        yad_fatal_error "Este script só pode ser usado com o OpenBox."
        exit 1
    }
    [[ $obline =~ --startup[[:blank:]]+([^[:blank:]]+) ]] || {
        yad_fatal_error "O Openbox foi iniciado sem um arquivo de inicialização."
        exit 1
    }

    case ${BASH_REMATCH[1]} in

    # */bunsen-autostart)

   #    debug "  Sessão do BunsenLabs detectada."

   #     OBSESSION=bunsenlabs

   #     ;;

     */openbox-autostart)

        debug "  Sessão do Openbox detectada."

   #     yad_warning "O BunsenLabs usa o Openbox com alguns arquivos de configuração personalizados,
# mas detectamos que você está executando uma sessão padrão do Openbox.
# Algumas coisas podem não funcionar como esperado sem editar este script.
# Você pode copiar /usr/local/bin/bl-obthemes.sh para ~/bin/ e editá-lo lá.
# Pelo menos, verifique se MENUMODIFIER e KEYDOWN no ​​topo do arquivo
# estão definidos apropriadamente para acionar a exibição do menu para capturas de tela." "$OK" "$EXIT" || exit 1

        OBSESSION=openbox

        ;;

    *)
        yad_fatal_error "Não é possível determinar a sessão atual do OpenBox."

        exit 1

        ;;

    esac
}




# ----------------------------------------------------------------------------------------


# Verificar se esta usando esse script no VirtualBox


function verificar_virtualbox(){


# Isso deve mostrar informações sobre sua placa de vídeo no Linux:

# lspci -k | grep -EA3 'VGA|3D|Display'

# lspci | grep VGA 

# lspci -nn | grep -E "Display|VGA|3D|VMware"


lspci -nn | grep -E "VirtualBox|VMware"


if [ "$?" == "0" ]; then

yad --center --title='Aviso' --text='

****************************************************************************

PROBLEMAS CONHECIDOS:

O Virtualbox não permite que o convidado mova o cursor do mouse do host com o xdotool,
então a captura de tela pode exibir o tema incorretamente ou com posicionamento ruim.

Uma solução alternativa é mover o cursor para algum espaço livre
e usar a tecla "Enter" na caixa de diálogo "Configurações a serem salvas:".

****************************************************************************


Em caso de travamento usar o comando abaixo na máquina hospedeira:

$ pkill VirtualBox

' --timeout="40" --no-buttons 2>/dev/null


fi

}


# ----------------------------------------------------------------------------------------



# NOTE: not recommended, see: http://mywiki.wooledge.org/ProcessManagement#Starting_a_.22daemon.22_and_checking_whether_it_started_successfully
# Fork a process to the background, return 1 if it exits soon.
# Do not use with processes like conky, which can fork themselves to a new pid.
# Global $FORKWAIT is time to wait before checking if process is still running.
# Arguments are the command to run.

forkncheck() {
    local pid
    set -m
    "$@" >/dev/null 2>&1 & pid=$!
    disown
    set +m
    sleep "$FORKWAIT" || return 1 # check for bad syntax in $FORKWAIT
    kill -0 "$pid" >/dev/null 2>&1 && return 0
    return 1 # process is not running
}


# needed if a BLOB directory was last generated on BL lithium before Oct 2019
# Drop this in BL Carbon?

function upgradeBlobs(){

    moveFile(){ # $1 is file, $2 is target dir
        [[ -f "$2/${1##*/}" ]] && return 0
        [[ -f "$1" ]] || {
            echo "$0: Atualizando ${i}: AVISO Não é possível mover o arquivo ${1}, isso não existe" >&2
            return 1
        }

        mkdir -p "$2"
        mv "$1" "$2" || exit

    }

    moveDir(){

        [[ -d "$2/${1##*/}" ]] && return 0
        [[ -d "$1" ]] || {
            echo "$0: Atualizando ${i}: AVISO Não é possível mover o diretório ${1}, isso não existe" >&2
            return 1
        }

        mkdir -p "$2"
        mv "$1" "$2" || exit

    }


    # checks tint sessionfile, updates filenames to new format
    # tint2 config files will have been renamed from tint2rc-something to something.tint2rc
    # variable VAL is rewritten

    check_tintsess() {

        debug "Verificando ${i}/user/$TINTPATH para nomes de arquivo Tint2..."

        local t2file t2name newt2name
        local -a tintsession
        VAL=''
        mapfile -t tintsession < "$i/user/$TINTSESSION"
        for t2file in "${tintsession[@]}"
        do
            [[ -n $t2file ]] || continue
            t2name=${t2file##*/}
            [[ $t2name = *'.tint2rc' || $t2name = tint2rc ]] && {
                VAL+=${t2file}';'
                continue # already using new name style
            }
            newt2name=${t2name#tint2rc-}.tint2rc
            if [[ -f $i/user/$TINTPATH/$t2name ]] # have local copy, rename
            then

                debug "Renomeando $t2name para $newt2name em ${i}/user/$TINTPATH"

                mv "${i}/user/$TINTPATH/$t2name" "${i}/user/$TINTPATH/$newt2name" || {
                    echo "$0: Atualizando ${i}: AVISO Não é possível renomear $i/user/$TINTPATH/$t2name" >&2
                    VAL+=${t2file}';'
                }
                VAL+=$HOME/$TINTPATH/${newt2name}';'
            else
                [[ -f $HOME/$TINTPATH/$newt2name ]] && { # user file already exists with new name, copy it locally

                    debug "Copiando $HOME/$TINTPATH/$newt2name para ${i}/user/$TINTPATH/"

                    cp "$HOME/$TINTPATH/${newt2name}" "${i}/user/$TINTPATH/" || echo "$0: Atualizando ${i}: AVISO Não é possível copiar $HOME/$TINTPATH/$newt2name para $i/user/$TINTPATH/" >&2
                    VAL+=$HOME/$TINTPATH/${newt2name}';'
                    continue
                }
                [[ -f $t2file ]] && { # user file with current oldstyle name exists, copy it locally with new name

                    debug "Copiando $t2file para ${i}/user/$TINTPATH como $newt2name"

                    cp "$t2file" "${i}/user/$TINTPATH/$newt2name" || {
                        echo "$0: Atualizando ${i}: AVISO Não é possível copiar  $t2file para $i/user/$TINTPATH/" >&2
                        VAL+=${t2file}';'
                    }
                    VAL+=$HOME/$TINTPATH/${newt2name}';'
                    continue
                }
                echo "$0: Atualizando ${i}: AVISO Não é possível encontrar o arquivo de configuração tint2 $t2file mencionado em $i/user/$TINTSESSION" >&2
                VAL+=${t2file}';'
            fi
        done
    }
    for i in "$USRCONFIGPATH"/*; do
        [[ -d $i ]] || continue
        mkdir -p "$i/user"
        local themename=${i##*/}
        moveFile "$USRCONFIGPATH/${themename}.jpg" "$i"
        :> "$i/newsettings"
        while read -r TAG VAL; do
            case "$TAG" in
                "[TINT2]"       )   [[ -f "$i/user/$TINTSESSION" ]] || {
                                        mkdir -p "$i/user/${TINTSESSION%/*}"
                                        printf '%s' "${VAL//;/$'\n'}" > "$i/user/$TINTSESSION"
                                    }
                                    check_tintsess # VAL is rewritten
                                    printf '%s' "${VAL//;/$'\n'}" > "$i/user/$TINTSESSION" # rewrite session file with new filenames
                                    printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                "[CONKY]"       )   [[ -f "$i/user/$CONKYSESSION" ]] || {
                                        mkdir -p "$i/user/${CONKYSESSION%/*}"
                                        printf '%s\n' "${VAL//;/$'\n'}" > "$i/user/$CONKYSESSION"
                                    }
                                    printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                "[ICONS]"       )   printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                "[GTK]"         )   moveFile "$i/.gtkrc-2.0" "$i/user"
                                    moveFile "$i/.gtkrc-2.0.mine" "$i/user"
                                    moveFile "$i/xfce4-notifyd.xml" "$i/user/.config/xfce4/xfconf/xfce-perchannel-xml"
                                    moveDir "$i/gtk-3.0" "$i/user/.config"
                                    printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                "[OBTHEME]"     )   printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                "[BACKGROUND]"  )   if [[ $VAL = FEH ]];then
                                        moveFile "$i/.fehbg" "$i/user"
                                    elif [[ $VAL = NITROGEN ]];then
                                        moveFile "$i/bg-saved.cfg" "$i/user/.config/nitrogen"
                                    fi
                                    printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                "[DMENU]"       )   moveFile "$i/dmenu-bind.sh" "$i/user/.config/dmenu" && {
                                        printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    }
                                    ;;
                "[LIGHTDM]"     )   printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                "[EXITRC]"      )   printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                                    # split [XFILES] into two tags
                "[XFILES]"      )   moveFile "$i/$XFILE" "$i/user" && {
                                        printf '%s\n' '[XFILE]' >> "$i/newsettings"
                                    }
                                    moveFile "$i/$BASHRC" "$i/user" && {
                                        printf '%s\n' '[BASHRC]' >> "$i/newsettings"
                                    }
                                    ;;
                "[TERMINATOR]"  )   moveFile "$i/config" "$i/user/.config/terminator" && {
                                        printf '%s %s\n' '[Terminator]' '.config/terminator/config' >> "$i/newsettings"
                                    }
                                    ;;
                "[obmenu-generator]" )  moveDir "$i/config/obmenu-generator" "$i/user/.config/" && {
                                        printf '%s %s\n' '[obmenu-generator]' '.config/obmenu-generator/' >> "$i/newsettings"
                                    }
                                    ;;
                "[plank]" )         moveDir "$i/config/plank" "$i/user/.config/" && {
                                        printf '%s %s\n' '[Plank]' '.config/plank/' >> "$i/newsettings"
                                    }
                                    ;;
                '['*']'         )   printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                '('*')'         )   printf '%s %s\n' "$TAG" "$VAL" >> "$i/newsettings"
                                    ;;
                *               )   echo -e "Atualizando ${i}: ${TAG}:  Valor desconhecido!" >&2
                                    continue
                                    ;;
            esac
        done < "$i/settings.cfg"
        mv -f "$i/newsettings" "$i/settings.cfg"
    done
}



# Matar somente com correspondência exata, e somente se o processo pertencer ao executor.
# Retorna sucesso mesmo se o processo não estiver em execução.
# Uso: safeKill <processname>

function safeKill() {

    local procname
    procname=$1

    debug "Matando $procname"

    pgrep -x -u "$USER" "$procname" >/dev/null || {

        debug "${procname}: nenhum processo em execução"

        return 0
    }

    pkill -x -u "$USER" "$procname" || {

        debug "AVISO falhou ao matar $procname"

        return 1
    }

}



# $1 é o caminho para o arquivo de chaves (por exemplo, gtk3 settings.ini)
# matriz associativa global KEYS será gerada

parseKeyfile(){

    [[ -f $1 ]] || { echo "$1 não é um arquivo." >&2; return 1;}

    unset KEYS
    declare -Ag KEYS
    local entry_regex line key value
    entry_regex="^[[:blank:]]*([[:alnum:]_][[:alnum:]_-]*)[[:blank:]]*=[[:blank:]]*('[^']+'|\"[^\"]+\"|[^#[:blank:]]+([[:blank:]]+[^#[:blank:]]+)*)[[:blank:]]*(#.*)*$"

    while read -r line
    do
        [[ -n $line ]] || continue
        [[ $line =~ $entry_regex ]] || continue
        key=${BASH_REMATCH[1]}
        value=${BASH_REMATCH[2]}
        case $value in # strip quotes
        \'*\')
            value=${value#\'}; value=${value%\'};;
        \"*\")
            value=${value#\"}; value=${value%\"};;
        esac
        KEYS["${key}"]="${value}"
    done < "$1"
    (( ${#KEYS[@]} )) || { echo "$0: analisando o arquivo ${1}: a matriz global KEYS está vazia" >&2; return 1;}

}


# Esta função é usada ao restaurar ícones sem GTK ou vice-versa.
# Ela é colocada aqui porque está relacionada a parseKeyfile.
# editKeyfile [--gtk2] file name=value [name2=value2...]
# --gtk2 coloca aspas em torno de valores de string escritos

editKeyfile(){

    local type=gtk3 file bkp_file name value sed_pattern sed_replace sed_args
    [[ $1 = '--gtk2' ]] && {
        type=gtk2
        shift
    }
    [[ -f $1 ]] || { echo "$1 não é um arquivo." >&2; return 1;}
    file=$1
    shift
    parseKeyfile "$file" || { echo "$0: editKeyfile() Falha ao analisar ${file}." 2>&1; return 1;} # gera CHAVES globais para as duas verificações
    boolean_enum_re='^([01]|GTK_[[:upper:]_]*)$' # nos arquivos GTK2 gtkrc esses valores não são citados
    sed_args=()
    while [[ $1 ]]; do
        unset name value sed_pattern sed_replace
        name="${1%%=*}"
        value="${1#*=}"
        shift
        [[ -v KEYS["$name"] ]] || {
            echo "$0: a chave de configuração $name não existe" >&2
            return 1
        }
        [[ ${KEYS["$name"]} = "${value}" ]] && {
            debug "A chave KEYS[$name] já está definida como ${value}"
            continue
        }
        [[ $type = gtk2 ]] && {
            [[ $value =~ $boolean_enum_re ]] || { # strings de citação para arquivo gtk2
                value="\"$value\""
            }
        }
        (( ${#sed_args[@]} == 0 )) && sed_args=("-ri")
        sed_pattern="^[[:blank:]]*${name}[[:blank:]]*=[[:blank:]]*('[^']+'|\"[^\"]+\"|[^#[:blank:]]+([[:blank:]]+[^#[:blank:]]+)*)[[:blank:]]*(#.*)*$"
        sed_replace+="${name}=${value}"
        sed_args+=("-e")
        sed_args+=("s/$sed_pattern/$sed_replace/")
    done
    unset KEYS
    (( ${#sed_args[@]} )) && {
        needBackup "${file}" && {
            bkp_file="${file}${BKP_SFX}"
            cp "$file" "$bkp_file" || return 1
            debug "fez cópia de segurança de $file"
        }
        sed "${sed_args[@]}" "$file" || { echo "$0: erro sed" >&2; return 1;}
    }
    return 0
}


# define os globais NUMDIRS e CURRENTSESSION, dentro de intro() e UpdateDisplayDialog()

function getCurrent(){      # obter o nome da configuração BLOB definida atualmente
    local dirs
    NUMDIRS=0
    shopt -s nullglob
    dirs=( "$USRCONFIGPATH"/*/ "$SYSCONFIGPATH"/*/ )
    NUMDIRS=${#dirs[@]}
    shopt -u nullglob
    if (( NUMDIRS == 0 ));then
        if [[ -f $CURSESSFILE ]];then
            rm "$CURSESSFILE"
        fi
    elif (( NUMDIRS > 0 )) && [[ -f $CURSESSFILE ]];then
        CURRENTSESSION=$(< "$CURSESSFILE")
    fi
}



# passe --one-view-only para pular a janela de introdução
# após a primeira visualização

function Intro(){

    debug 'Bem-vindo ao BLOB!'

    getCurrent # gera globais NUMDIRS e CURRENTSESSION

    if [[ $1 = '--one-view-only' && -e $HOME/.config/bunsen/blob-intro-viewed ]] && (( NUMDIRS > 0 ));then
        displayBlobs
    else
        TXTINTRO='<big><b>BLOB: Gerenciador de temas - BunsenLabs </b></big>


<b>Salvar ou restaurar configurações para qualquer um ou todos estes:</b>

    Tema Openbox
    Tema GTK
    Conkys
    Tint2
    Plank
    obmenu-generator
    Plano de fundo da área de trabalho
    Menu alternativo (dmenu)
    Tema LightDM
    Configurações X (.bashrc, .Xresources)
    Terminal (se o arquivo de configuração for conhecido)
    Compositor (se o arquivo de configuração existir)
    jgmenu (se o arquivo de configuração existir)
    + Captura de tela

'

        createFlag 'blob-intro-viewed'

        #  se blob/ estiver vazio, não exiba a opção "Exibir salvos" na caixa de diálogo Introdução
        if (( NUMDIRS > 0 ));then

            yad "${yad_args[@]}" "--text=$TXTINTRO" \
            --title="$TITLE" --borders=30 \
            --button="_Salvar Blob Atual:0" --button="_Ver Blobs Salvos:2" $HLPBTN $CLOSE

        else
            yad "${yad_args[@]}" "--text=$TXTINTRO" \
            --title="$TITLE" --borders=30 \
            --button="_Salvar Blob Atual:0" $HLPBTN $CLOSE

        fi

        case $? in
            0)  saveNewBlob
                displayBlobs
                ;;

            1)  debug "CANCELADO..."

                clear

                exit 0

                ;;

            2)  displayBlobs
                ;;

            10) yad --center --window-icon="distributor-logo-bunsenlabs" --title="O gerenciador de temas BLOB" --text-info --fontname=Monospace --filename="/usr/share/doc/bl-obthemes/helpfile-blob.txt" --button="OK":0 --width="900" --height="700"  2> /dev/null

                Intro

                ;;

            *)  echo "ERRO DE RETORNO" >&2
                exit 1
                ;;

        esac
    fi
}


####################### Salvar funções #################################


# Define globais CONFIGDIR CONFIGDIR_BKP SETTINGS LISTMSG NEWNAME  para armazenar novo tema.


function setName(){  # Definir nome da coleção, criar diretório e arquivo de configurações de sessão.

    local msg msg2

    msg="  As configurações serão salvas em um novo diretório em \
    \n  $USRCONFIGPATH\n\n  Insira o nome da nova coleção...  "
    msg2="  Nenhum arquivo especificado para nova sessão salva.\n\n  Tentar novamente?"

    local del time txt
    del=0

    while true;do  # diálogo de loop se nada for selecionado

        NEWNAME=$( yad_prompt "$msg" --entry --button="Cancelar":252 --button="OK":0)

        if (( $? == 1 )) ;then # Cancelar foi selecionado
            return 1

        elif [[ ! $NEWNAME ]] ;then     # a entrada estava vazia

            debug "\n  Nenhum nome inserido para a nova coleção!"

            yad_question "$msg2" --button="Cancelar":252 --button="OK":0

            RET=$?
            if (( RET == 0 ));then
                continue
            else
                return 1
            fi
        else

            NEWNAME=${NEWNAME// /_}    # substitua quaisquer espaços no nome do diretório
            CONFIGDIR="$USRCONFIGPATH/$NEWNAME"
            CONFIGDIR_BKP="${CONFIGDIR}.bkp"

            if [[ -d $CONFIGDIR ]];then

                debug "\n  $CONFIGDIR já existe"

                if yad_question "Substituir sessão salva existente?"
                then
                    mv "$CONFIGDIR" "$CONFIGDIR_BKP" # && mkdir -p "$CONFIGDIR"
                    del=1
                else
                    continue
                fi
            fi

            mkdir -p "$CONFIGDIR" || return 1
            SETTINGS="$CONFIGDIR/settings.cfg"
            LISTMSG="$CONFIGDIR/LISTMSG.txt"
            :> "$SETTINGS"
            :> "$LISTMSG"
            break
        fi

    done # imprimir somente o primeiro arquivo encontrado.


    time=$(date +%d/%m/%Y-%H:%M:%S)
    if (( del == 1 ));then
        txt="  (Sessão existente substituída)"
    else
        txt=""
    fi

    debug "\n  A configuração será salva como: $NEWNAME$txt"


#     Armazenar lista em $LISTMSG

    echo -e "<b>Nome da configuração: $NEWNAME</b>\t$txt\n\nSalvo em: $time\n" >> "$LISTMSG"

}


# $1 [$2...] são caminhos relativos passados ​​de funções de salvamento
# Salva o arquivo de configuração do usuário no diretório correspondente em $CONFIGDIR/user.
# CONFIGDIR é global definido por setName()

function saveFiles(){

    local i src_file target_file

    for i in "$@"
    do
        src_file="$HOME/$i"
        target_file="$CONFIGDIR/user/$i"

        saveFileAbs "$src_file" "$target_file" || {

            echo "$0: Falha ao salvar $src_file" >&2
            return 1
        }

    done
}


# $1 e $2 são caminhos de arquivo de origem e destino absolutos
# destino deve estar dentro do CONFIGDIR recém-criado
# se a origem for um diretório, ele será salvo recursivamente

function saveFileAbs(){

    local src_file target_file target_dir

    src_file="$1"

    [[ -L "$src_file" ]] && debug "$src_file é um link simbólico, apontando para $(readlink -f "$src_file")"
    [[ -r $src_file ]] || {
        echo "$0: Não é possível ler o arquivo de origem $src_file" >&2
        return 1
    }
    target_file="$2"
    [[ $target_file = $CONFIGDIR/* ]] || {
        echo "$0: O alvo não está dentro de $CONFIGDIR" >&2
        return 1
    }
    target_dir="${target_file%/*}"
    mkdir -p "$target_dir" || return 1
    if [[ -d $src_file ]];then
        cp -r "$src_file" "$target_file" || return 1
        debug "diretório $src_file e conteúdo salvo em $target_dir"
    else
        cp "$src_file" "$target_file" || return 1
        debug "arquivo $src_file salvo em $target_dir"
    fi
}



# CONFIGDIR é um conjunto global definido por setName()

function saveDconf(){ # passed dconf directory as #1 and name of app (for dumpfile) as $2
    local dconfdir appname dumpfile
    dconfdir=$1
    appname=$2
    mkdir -p "$CONFIGDIR/dconf" || return 1
    dumpfile="$CONFIGDIR/dconf/${appname// /_}" # remove any spaces from name
    dconf dump "$dconfdir" > "$dumpfile" || return 1
    if [[ -s $dumpfile ]]
    then
        debug "Saved dconf $dconfdir to $dumpfile"
    elif [[ -e $dumpfile ]]
    then
        debug "dconf $dconfdir is default, created empty file $dumpfile"
    else
        "$0: failed to create $dumpfile" >&2
        return 1
    fi
}

# prints newest of files in "$@", returns 1 if no file is passed
# used in getBg
function newest()  {
    [[ -n $1 ]] || return 1
    local i candidate
    for i in "$@"
    do
        [[ -f $i ]] || continue
        if [[ -n $candidate ]]
        then
            [[ $i -nt $candidate ]] && candidate="$i"
        else
            candidate="$i"
        fi
    done
    [[ -n $candidate ]] || return 1
    printf '%s' "$candidate"
}

function getBg(){    # Find if feh, nitrogen or other was used. Save config file(s) if possible.
    local bgsetter='' bgsetterfile img # img is set by the child get* functions

    bgsetter=$(checkBgDaemon) || debug "no background setting daemons running"

    [[ -z $bgsetter ]] && {
        if bgsetterfile="$( newest "$HOME/$NITROFILE" "$HOME/$FEHFILE" )"; then
            case $bgsetterfile in
            "$HOME/$NITROFILE")
                bgsetter=NITROGEN
                ;;
            "$HOME/$FEHFILE")
                bgsetter=FEH
                ;;
            esac
        else
            echo "$0:  Nenhum arquivo nitrogen ou feh encontrado" >&2
            bgsetter="None"
        fi
    }


    debug "\nPlano de fundo a ser definido com $bgsetter"

    case "$bgsetter" in
    NITROGEN)
        getNitrogen || {
            echo "$0: Falha ao salvar a configuração do nitrogen." >&2
            return 1
        }
        ;;
    FEH)
        getFeh || {
            echo "$0: Falha ao salvar a configuração feh." >&2
            return 1
        }
        ;;
    XFDESKTOP)
        getXfdesktop || {
            echo "$0: Falha ao salvar a configuração do xfdesktop." >&2
            return 1
        }
        ;;
    PCMANFM)
        getPcmanfm || {
            echo "$0: Falha ao salvar a configuração do pcmanfm." >&2
            return 1
        }
        ;;
    None)
        echo "$0: Nenhum aplicativo de configuração de plano de fundo encontrado" >&2
        
        echo -e "O papel de parede (Background) não pode ser definido.\n" >> "$LISTMSG"

        ;;

    esac
    img=$( readlink -f "$img" )
    echo "[BACKGROUND] $bgsetter" >> "$SETTINGS"
    echo "(wallpaper) $img" >> "$SETTINGS" # restore functions will be able to access this
}

# NITROFILE is config global
# CONFIGDIR is global set by setName()
function getNitrogen(){  # get Nitrogen saved backgrounds
    local nfile="$CONFIGDIR/user/$NITROFILE" imgfile imglist
    saveFiles "$NITROFILE" || {
        echo "$0: Failed to save nitrogen configs file $NITROFILE" >&2
        return 1
    }
    img="" # img is local to getBg
    imgfile=""
    imglist=""
    while read -r line;do
        [[ $line = 'file='* ]] || continue
        imgfile=${line#file=}
        imglist="${imglist}${imgfile}\n\t"
        img=${img:-${imgfile}} # save first image only (may be restored by other background setter if nitrogen not available)
    done < "$nfile"

    debug "\nBackgrounds set with Nitrogen, using:\t$CONFIGDIR/user/$NITROFILE"

    debug "$imglist"

    echo -e "Conjunto de fundo com Nitrogen:\n\t$imglist\n" >> "$LISTMSG"
}

# FEHFILE is config global
# CONFIGDIR is global set by setName()
function getFeh(){    # get Feh saved backgrounds
    local ffile="$CONFIGDIR/user/$FEHFILE" imglist
    saveFiles "$FEHFILE" || {
        echo "$0: Failed to save feh configs file $FEHFILE" >&2
        return 1
    }
    img="" # img is local to getBg
    # get fields between single quotes
    while read -r line;do
        imglist="${imglist}${line}\n\t"
        img="${img:-${line}}" # save first image only (may be restored by other background setter if feh not available)
    done < <(grep -o "'[^']*'" "$ffile" | sed "s/'//g" 2>/dev/null)
    debug "\nBackgrounds set with Feh, using:\t$CONFIGDIR/user/$FEHFILE"
    debug "$imglist"
    echo -e "Background set with feh:\n\t$imglist\n" >> "$LISTMSG"
}

function getXfdesktop(){
    local mon ws props prop
    debug "Getting wallpaper set by xfdesktop"
    mon=$(bl-xinerama-prop --monitor) || return 1 # monitor onde o ponteiro está
    debug "on monitor $mon"
    ws=$(xdotool get_desktop)
    debug "on desktop $ws"
    props=$(xfconf-query -c xfce4-desktop -l | grep --fixed-strings "/monitor${mon}/workspace${ws}/last-image")
    [[ -z $props ]] && return 1
    # save first image found on connected monitor, current workspace
    while read -r prop
    do
        img=$(xfconf-query -c xfce4-desktop -p "$prop") # img is local to getBg
        [[ -r "$img" ]] && break
    done <<< "$props"
    debug "\nBackground set with xfdesktop:"
    debug "\t$img"
    echo -e "Background set with xfdesktop:\n\t$img\n" >> "$LISTMSG"
}

# get profile currently running pcmanfm is using
function getPcmanfmProfile(){
    local cmdline profile
    cmdline=$(pgrep -afx 'pcmanfm[[:blank:]].*') || {
        echo "$0: pcmanfm is not running" >&2
        return 1
    }
    cmdline=${cmdline#* } # remove pid
    if [[ $cmdline =~ [[:blank:]]-p[[:blank:]]([^[:blank:]]+) ]]
    then
        profile="${BASH_REMATCH[1]}"
    elif [[ $cmdline =~ [[:blank:]]--profile(=|[[:blank:]]+)([^[:blank:]]+) ]]
    then
        profile="${BASH_REMATCH[2]}"
    else
        profile=default
    fi
    printf '%s' "$profile"
}

function getPcmanfm(){
    local profile ws line
    debug "Getting wallpaper set by pcmanfm"
    profile=$(getPcmanfmProfile) || {
        echo "$0: failed to get pcmanfm profile"
        return 1
    }
    debug "pcmanfm profile is $profile"
    ws=$(xdotool get_desktop)
    debug "on desktop $ws"
    for i in "$HOME/.config/pcmanfm/$profile/"desktop-items-*.conf
    do
        while read -r line
        do
            [[ $line =~ wallpaper=(.*)$ || $line =~ wallpaper${ws}=(.*)$ ]] && {
                img="${BASH_REMATCH[1]}"       # img is local to getBg
                [[ -r "$img" ]] && break 2
            }
        done < "$i"
    done
    debug "\nBackground set with pcmanfm:"
    debug "\t$img"
    echo -e "Background set with pcmanfm:\n\t$img\n" >> "$LISTMSG"
}

# generates command array idCmd from window id (hex or decimal)
# WARNING WM_COMMAND is deprecated: https://www.x.org/releases/X11R7.6/doc/xorg-docs/specs/ICCCM/icccm.html#obsolete_session_manager_conventions
# TODO switch to using mapfile with pids and /proc/${pid}/cmdline as in getTint()
# but, need to handle conkys on specific desktops.

# Usage: getIdCmd <id>
# called in getConky() where idCmd is local array variable
# NOTE: this works with conky windows, but not with tint2 which provides no WM_COMMAND data.
function getIdCmd(){
    local wmc del s
    wmc=$(xprop -id "$1"  WM_COMMAND)
    wmc=${wmc#*\"} # strip first & last quotes & everything outside
    wmc=${wmc%\"*}
    wmc=${wmc//\\\"/\"} # unescape any inner quotes
    del='", "' # delimiter
    s=${wmc}${del}
    idCmd=()
    while [[ -n $s ]]; do
        idCmd+=("${s%%${del}*}")
        s=${s#*${del}}
    done
}

# extracts path to conky config file from idCmd array generated by getIdCmd()
# conkyfile is local to getConky()
function getCfile(){
    local i
    conkyfile=''
    for i in "${!idCmd[@]}"; do
        [[ ${idCmd[i]} = '-c' ]] && { conkyfile="${idCmd[i+1]}"; break;}
        [[ ${idCmd[i]} = '--config='* ]] && { conkyfile="${idCmd[i]#--config=}"; break;}
    done
}

# trim /home/<user>/ from filepath
# reject absolute path elsewhere in system
# pass relative path as-is, assume relative to ~/
userFilepath(){
    local file=$1
    if [[ $file = "$HOME"/* ]]
    then
        file=${file#"$HOME"/}
    elif [[ $file = /* ]]
    then
        debug "${file} is not in user HOME, not using."
        return 1
    fi
    printf '%s' "$file"
}

# If conky is not to be saved in new theme, pass '--tmp <filepath>'
# to store current conkys in tempfile <filepath> while making scrot.
function getConky(){
    local conkyfile conkyline saved_conkysession num_desktops CONKYCMDS CONKYTXT
    local -a idCmd
    local -A arrSTICKY
    local save=1
    if [[ $1 = '--tmp' ]]
    then
        saved_conkysession=$2 # temporary sessionfile while scrot is taken
        save=0
    else
        saved_conkysession="$CONFIGDIR/user/$CONKYSESSION"
        mkdir -p "${saved_conkysession%/*}"
    fi

    num_desktops=$(xdotool get_num_desktops)
    CONKYCMDS=''
    CONKYTXT=''

    :> "$saved_conkysession"

    pgrep -x conky -u "$USER" >/dev/null || {
        debug "No conkys are running"
        ((save)) && {
            echo '[CONKY] none' >> "$SETTINGS"
            echo -e "Nenhum conky.\n(Qualquer Conky em execução será interrompido.)\n" >> "$LISTMSG"
        }
        return 0
    }

    while read -r id;do  # get all running conky id's
        arrSTICKY["$id"]=1
    done < <(xdotool search --class conky)

    for (( d=0; d<num_desktops; d++ ));do  # get all conkys running on specific desktops
        while read -r id;do
            unset arrSTICKY["$id"] # remove from sticky list
            if [[ -n "$id" ]];then
                getIdCmd "$id" # generates array idCmd
                getCfile # extract conky config file as variable $conkyfile
                if [[ "${idCmd[*]}" == "conky" ]] || [[ "${idCmd[*]}" == "conky -q" ]];then # $conkyfile will be empty
                    conkyfile='.config/conky/conky.conf'
                    CONKYTXT="$CONKYTXT\n\tDesktop $i:  Default Conky"
                    debug "Found running default conky on Desktop $d"
                    ((save)) && debug "saving copy of default conky file"
                else
                    conkyfile=$( userFilepath "$conkyfile" ) || continue
                    CONKYTXT="$CONKYTXT\n\tDesktop $d:  ~/$conkyfile"
                    debug "Found running conky file $conkyfile on Desktop $d"
                    ((save)) && debug "Saving copy of $conkyfile"
                fi
                ((save)) && { saveFiles "$conkyfile" || {
                    echo "$0: Failed to save conky config file $conkyfile" >&2
                    return 1
                    }
                }
                # line to start on specified desktop with bl-conky-session
                conkyline="D[$d] $conkyfile"
                CONKYCMDS="${CONKYCMDS}${conkyline};" # add semicolon separator here
                echo "$conkyline" >> "$saved_conkysession"
                debug "Added '$conkyline' to saved conkysession file"
            fi
        done < <(xdotool search --desktop $((d)) --class conky)
    done

    for id in "${!arrSTICKY[@]}";do  # get commands - we don't need wmctrl for these
        if [[ -n "$id" ]];then
            getIdCmd "$id" # generates array idCmd
            getCfile # extract conky config file
            if [[ "${idCmd[*]}" == "conky" ]] || [[ "${idCmd[*]}" == "conky -q" ]];then
                conkyfile='.config/conky/conky.conf'
                CONKYTXT="$CONKYTXT\n\tDefault Conky"
                debug "Found running default conky"
                ((save)) && debug "saving copy of default conky file"
            else
                conkyfile=$( userFilepath "$conkyfile" ) || continue
                CONKYTXT="$CONKYTXT\n\t~/$conkyfile"
                debug "Found running conky file $conkyfile"
                ((save)) && debug "Saving copy of $conkyfile"
            fi
            ((save)) && { saveFiles "$conkyfile" || {
                echo "$0: Failed to save conky config file $conkyfile" >&2
                return 1
                }
            }
            conkyline="$conkyfile"
            CONKYCMDS="${CONKYCMDS}${conkyline};" # add semicolon separator here
            echo "$conkyline" >> "$saved_conkysession"
            debug "Added '$conkyline' to saved conkysession file"
        fi
    done
    ((save)) && {
        echo "[CONKY] $CONKYCMDS" >> "$SETTINGS" # semicolon-delimited list CONKYCMDS is now only a fallback in case sessionfile is missing
        echo -e "Correndo Conkys:\t$CONKYTXT\n" >> "$LISTMSG"
    }
    debug "\n  Saved running Conky(s)\n"
}

# If tint2 is not to be saved in new theme, pass '--tmp <filepath>'
# to store current tint2s in tempfile <filepath> while making scrot.
function getTint(){
    local tpath saved_tintsession TINTCMDS TINT2TXT
    local save=1
    if [[ $1 = '--tmp' ]]
    then
        saved_tintsession=$2 # temporary sessionfile while scrot is taken
        save=0
    else
        saved_tintsession="$CONFIGDIR/user/$TINTSESSION"
        mkdir -p "${saved_tintsession%/*}"
    fi

    TINTCMDS=""
    TINT2TXT=""

    :> "$saved_tintsession"

    pgrep -x tint2 -u "$USER" >/dev/null || {
        debug "No tint2 instances are running"
        ((save)) && {
            echo "[TINT2] none" >> "$SETTINGS"
            echo -e "Nenhum tint2.\n(Qualquer tint2 em execução será interrompido.)" >> "$LISTMSG"
        }
        return 0
    }

    while read -r pid; do
        mapfile -d '' -t command < "/proc/${pid}/cmdline"
        [[ ${command[0]} = 'tint2' ]]  || {
            echo "$0: pgrep parsing failed: command is not 'tint2'" >&2
            continue
        }
        if (( ${#command[@]} > 1 )); then
            tpath=${command[-1]} # tint2 takes no options other than -c, which is optional
            tpath=$( userFilepath "$tpath" ) || continue # assume path is relative to $HOME
        else
            tpath='.config/tint2/tint2rc'
        fi
        [[ -f $HOME/$tpath ]] || {
            echo "$0: pgrep tint2 parsing failed: $HOME/$tpath is not a file" >&2
            continue
        }
        echo "$tpath" >> "$saved_tintsession"
        debug "Added '$tpath' to saved tintsession file"
        ((save)) || continue
        TINTCMDS="$TINTCMDS$tpath;"
        if (( ${#command[@]} == 1 ));then
            TINT2TXT="$TINT2TXT\n\tDefault Tint2"
            debug "saving copy of default tint2 config file"
        else
            TINT2TXT="$TINT2TXT\n\t~/$tpath"
            debug "saving copy of $tpath"
        fi
        saveFiles "$tpath" || {
            echo "$0: Failed to save tint2 config file $tpath" >&2
            return 1
        }
    done < <(pgrep -x 'tint2' -u "$USER")

    ((save)) && {
        echo "[TINT2] $TINTCMDS" >> "$SETTINGS" # $TINTCMDS only fallback if sessionfile is missing
        echo -e "Correndo Tint2s:\t$TINT2TXT\n" >> "$LISTMSG"
    }
    debug "\n  Saved running Tint2(s)\n"
}




# ----------------------------------------------------------------------------------------

function getPlank(){


# Só salva se o processo do Plank estiver rodando para o usuário atual.

 pgrep -fx "plank" -u "$USER" >/dev/null || {

        echo "$0: Plank não está em execução."

        return 1

    }


# Salva os lançadores do Plank ~/.config/plank/dock1/launchers/

    local txt
    saveFiles "$PLANKPATH" || {
        echo "$0: Falha ao salvar o arquivo de configuração do Plank $PLANKPATH" >&2
        return 1
    }
    txt="\nConfiguração do Plank:  ~/$PLANKPATH\n"
    debug "\n  Salvo $txt"
    echo "[plank]" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"


# Salvar o tema do Plank ~/.local/share/plank/themes/ que o usuário esta usando atualmente.



}

# ----------------------------------------------------------------------------------------

function getobmenu-generator(){


# Só salva se o obmenu-generator estiver no arquivo ~/.config/openbox/menu.xml para o usuário atual.

cat ~/.config/openbox/menu.xml | grep obmenu-generator || {

        echo "$0: obmenu-generator não está em execução."

        return 1

    }


# Salva as configurações do obmenu-generator ~/.config/obmenu-generator/

    local txt
    saveFiles "$obmenu_generator_PATH" || {
        echo "$0: Falha ao salvar o arquivo de configuração do obmenu-generator $obmenu_generator_PATH" >&2
        return 1
    }
    txt="\nConfiguração do obmenu-generator:  ~/$obmenu_generator_PATH\n"
    debug "\n  Salvo $txt"
    echo "[obmenu-generator]" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"

}

# ----------------------------------------------------------------------------------------


# copy <theme> section from bl-rc.xml to obtheme.txt

function getOBtheme(){
    local obfile obtheme xpath
    obfile="$CONFIGDIR/obtheme.txt"
    [[ -r $RCFILE ]] || {
        RCFILE="$OLDRCFILE"
        debug "Getting openbox theme from $OLDRCFILE instead of $RCFILE"
    }
    [[ -r $RCFILE ]] || {
        echo "$0: Openbox config file $RCFILE not found" >&2
        return 1
    }
    xsl='<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ob="http://openbox.org/3.4/rc">
  <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" />

  <xsl:template match="/">
    <xsl:apply-templates select="/ob:openbox_config/ob:theme" />
  </xsl:template>

  <xsl:template match="*">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*|node()" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|text()|comment()">
    <xsl:copy/>
  </xsl:template>

</xsl:stylesheet>
'

# Alterado de xmlstarlet para xml

    xmlstarlet transform <(cat <<<"$xsl") "$RCFILE" > "$obfile" || return 1
    [[ -s $obfile ]] || {
        echo "$0: Failed to generate Openbox theme settings in $obfile" >&2
        return 1
    }
    # $obfile has no namespace declarations, so '_:' syntax unnecessary
    xpath='/theme/name/text()'

# Alterado de xmlstarlet para xml

    obtheme=$(xmlstarlet sel --template --value-of "$xpath" "$obfile")
    [[ -n $obtheme ]] || {
        echo "$0: Failed to determine the Openbox theme name to be saved" >&2
        return 1
    }
    echo "Openbox theme:  $obtheme" >> "$LISTMSG"
    echo "[OBTHEME] $obtheme" >> "$SETTINGS"
    debug "copied Openbox theme (${obtheme}) section from $RCFILE"
}

function getGTKtheme(){
    saveFiles "$GTK2" "$GTK2MINE" "$GTK3/settings.ini" "$GTK3/gtk.css" "$GTK3x" || {
        echo "$0: Falha ao salvar os arquivos de configuração GTK necessários" >&2
        return 1
    }
    getGTKname || {
        echo "$0: Failed to parse $gtk3_settings" >&2
        return 1
    }
}

function getGTKname(){ # get saved GTK3 theme name and Icon theme name
    local gtk3_settings gtktheme icontheme txt
    gtk3_settings="$CONFIGDIR/user/$GTK3/settings.ini"
    # parseKeyfile generates global associative array KEYS
    parseKeyfile "$gtk3_settings" || { echo "$0: getGTKname() Failed to parse $gtk3_settings." 2>&1; return 1;}
    gtktheme=${KEYS[gtk-theme-name]}
    echo "[GTK] $gtktheme" >> "$SETTINGS"
    icontheme=${KEYS[gtk-icon-theme-name]}
    echo "[ICONS] $icontheme" >> "$SETTINGS"
    unset KEYS
    txt="GTK theme:  $gtktheme\nIcon Theme: $icontheme\n"
    debug "\n  Saved $txt"
    echo -e "$txt" >> "$LISTMSG"
}

function getDmenu(){
    local txt
    saveFiles "$DMENU" || {
        echo "$0: Falha ao salvar o arquivo de configuração do demenu $DMENU" >&2
        return 1
    }
    txt="dmenu config:  ~/$DMENU\n"
    debug "\n  Saved $txt"
    echo "[DMENU]" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"
}

function getLightdm(){
    local txt
    saveFileAbs "$LDMDIR/$LDM" "$CONFIGDIR/$LDM" || {
        echo "$0: Falha ao salvar o arquivo de configuração do LightDM $LDMDIR/$LDM em $CONFIGDIR/$LDM" >&2
        return 1
    }
    txt="Configuração do Lightdm:  $LDMDIR/$LDM\n(a senha será necessária para restaurar)\n"
    debug "\n  Saved $txt"
    echo "[LIGHTDM]" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"
}

# passed termfile as $1 and pickterm as $2 by saveSettings()
function getTerminal(){
    local termname termfile txt
    termfile="$1"
    termname="$2"
    case "$termfile" in # dconf "directories" get prefixed with %dconf% in checkTerm()
    '%dconf%'*)
        saveDconf "${termfile#'%dconf%'}" "$termname" || {
            echo "$0: Failed to save $termname dconf config: $termfile" >&2
            return 1
        }
        txt="$termname dconf config: ${termfile#'%dconf%'}\n"
        ;;
    *)
        saveFiles "$termfile" || {
            echo "$0: Failed to save $termname configs file $termfile" >&2
            return 1
        }
        txt="$termname config:  ~/$termfile\n"
        ;;
    esac
    debug "\n  Saved $txt"
    echo "[$termname] $termfile" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"
}

function getXconfig(){
    local txt
    saveFiles "$XFILE" || {
        echo "$0: Falha ao salvar o arquivo de configuração X $XFILE" >&2
        return 1
    }
    txt="X config:  ~/$XFILE\n"
    debug "\n  Saved $txt"
    echo "[XFILE]" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"
}

function getBashRC(){
    local txt
    saveFiles "$BASHRC" || {
        echo "$0: Failed to save bash configs file $BASHRC" >&2
        return 1
    }
    txt="Configuração do Bash: ~/$BASHRC\n"
    debug "\n  Saved $txt"
    echo "[BASHRC]" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"
}

function getComp(){
    local txt
    [[ -r "$HOME/$COMPFILE" ]] || COMPFILE=$OLDCOMPFILE
    saveFiles "$COMPFILE" || {
        echo "$0: Falha ao salvar o arquivo de configuração do compositor $COMPFILE" >&2
        return 1
    }
    txt="Compositor settings: ~/$COMPFILE\n"
    debug "\n  Saved $txt"
    echo "[COMPOSITOR] $COMPFILE" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"
}

function getJgmenu(){
    local txt
    [[ -r $HOME/$JGMENURC ]] || {
        debug "No jgmenu config file, not saving"
        return 0
    }
    saveFiles "$JGMENURC" || {
        echo "$0: Failed to save jgmenu configs file $JGMENURC" >&2
        return 1
    }
    txt="Configurações do jgmenu: ~/$JGMENURC\n"
    debug "\n  Saved $txt"
    echo "[JGMENU]" >> "$SETTINGS"
    echo -e "$txt" >> "$LISTMSG"
}


function getScrot(){


# Chama a função verificar_virtualbox para identificar se esta usando esse script no VirtualBox

verificar_virtualbox


    debug "\n Preparando para tirar uma captura de tela (screenshot)..."

    local conkyFLAG tint2FLAG currDesktop scrot mons hiddenWins
    conkyFLAG=1
    tint2FLAG=1
    grep -q "CONKY" "$SETTINGS" || {
        conkyFLAG=0    # Conkys not to be saved
        tmpConky=$(mktemp --tmpdir blob.XXXX)
        getConky --tmp "$tmpConky" # save current conky session to restore after taking scrot
        debug "Hiding Conkys - they are not to be saved to this BLOB."
        safeKill conky
    }
    grep -q "TINT2" "$SETTINGS" || {
        tint2FLAG=0    # Tint2s not to be saved
        tmpTint=$(mktemp --tmpdir blob.XXXX)
        getTint --tmp "$tmpTint" # save current tint2 session to restore after taking scrot
        debug "Hiding tint2s - they are not to be saved to this BLOB"
        safeKill tint2
    }
    currDesktop=$(xdotool get_desktop)
    debug "Current desktop is $currDesktop"
    scrot="$USRCONFIGPATH/$NEWNAME/${NEWNAME}.jpg"
    mons=$(xrandr -q | grep -c " connected")    # number of monitors

    # set mouse position, for appearance of root-menu
    local -a dim
    read -r -a dim < <(bl-xinerama-prop)
    screenW=${dim[0]}
    screenH=${dim[1]}
    if (( mons == 1 ));then # single monitor
        appX=$(( (screenW/20)*8 ))
        menuX=$(( (screenW/20)*2 ))
    else
        appX=$(( (screenW/20)*4 ))
        menuX=$(( (screenW/20)*1 ))
    fi
    appY=$(( (screenH/20)*4 ))
    menuY=$(( (screenH/20)*4 ))

    debug "minimizing open windows"
    # minimize all visible non-sticky windows on current desktop (most conkys are sticky)
    sleep 0.5 # make sure previous yad window is completely closed before listing
    hiddenWins=()
    for w in $(xdotool search --onlyvisible --desktop "$currDesktop" --name '.*')
    do
        grep -iq <<<"$(xprop WM_CLASS -id "$w")" 'conky' && continue # remove any non-sticky conkys from hide list
        hiddenWins+=("$w")
        xdotool windowminimize "$w"
    done


    # Iniciar lxappearance

    lxappearance 2>/dev/null &

    sleep 0.5

    # get lx window, make sure it loses focus, then move mouse and start root-menu
    LX=$(xdotool getwindowfocus)
    xdotool windowmove --sync "$LX" "$appX" "$appY" && sleep 0.3 && \
    xdotool mousemove --sync --window "$LX" -- -50 0 && xdotool click 1
    sleep 0.3
    xdotool mousemove --sync "$menuX" "$menuY"
    sleep 0.1

    case $OBSESSION in

    bunsenlabs)
        jgmenu_run &
        sleep 0.5
        xdotool key --delay 100 Home
        i=1
        while (( i <= KEYDOWN ));do
            xdotool key --delay 100 Down
            i=$(( i+1 ))
        done
        xdotool key --delay 50 Right
        xdotool key --delay 50 Right && sleep 0.5
        ;;

    openbox)
        xdotool key --clearmodifiers "$MENUMODIFIER"
        i=1
        while (( i <= KEYDOWN ));do
            xdotool key --delay 100 Down
            i=$(( i+1 ))
        done
        xdotool key --delay 50 Right && sleep 0.5
        ;;

    esac

    debug "Fazendo captura de tela..."

    # pegue o scrot
    scrot -t 9 "$scrot"    # miniatura do scrot @9% em tamanho real

    sleep 0.5

    debug "Restaurando desktop"

    # close root menu
    xdotool mousemove_relative --sync --polar 0 10 "${MOUSECMD[@]}"
    sleep 0.5
    # kill lxappearance
    pkill -P "$$" lxappearance
    sleep 0.5
    # restore hidden windows

    for w in "${hiddenWins[@]}"
    do
        xdotool windowmap --sync "$w"
        sleep 0.5
    done
    # if conkys or tint2s were killed, restore previously running session
    ((conkyFLAG)) || {
        bl-conky-session "$tmpConky"
        rm -f "$tmpConky"
        sleep 0.5
    }
    ((tint2FLAG)) || {
        bl-tint2-session "$tmpTint"
        rm -f "$tmpTint"
        sleep 0.5
    }
}


# choose terminal settings to save, based on what is x-terminal-emulator
# sets termfile and pickterm, local inside saveSettings()

function checkTerm(){

    case $( readlink /etc/alternatives/x-terminal-emulator ) in
    /usr/bin/lxterminal)
        termfile='.config/lxterminal/lxterminal.conf'
        pickterm='Lxterminal'
        ;;
    /usr/bin/terminator)
        termfile='.config/terminator/config'
        pickterm='Terminator'
        ;;
    /usr/bin/xfce4-terminal)
        termfile='.config/xfce4/terminal/terminalrc'
        pickterm='Xfce4-terminal'
        ;;
    /usr/bin/sakura)
        termfile='.config/sakura/sakura.conf'
        pickterm='Sakura'
        ;;
    /usr/bin/gnome-terminal.wrapper)
        termfile='%dconf%/org/gnome/terminal/'
        pickterm='Gnome-terminal'
        ;;
    /usr/bin/mate-terminal.wrapper)
        termfile='%dconf%/org/mate/terminal/'
        pickterm='Mate-terminal'
        ;;
    /usr/bin/tilix.wrapper)
        termfile='%dconf%/com/gexperts/Tilix/'
        pickterm='Tilix'
        ;;
    *)
        termfile=''
        ;;
    esac

}

# NEWNAME global set by setName()
function saveSettings(){
    local configs termfile pickterm txt txt2
    configs=(
        "$PICKOB"
        "$PICKGTK"
        "$PICKBG"
        "$PICKCONKY"
        "$PICKTINT"
        "$PICKPLANK"
        "$PICKobmenugenerator"
        "$PICKDMENU"
        "$PICKLDM"
        "$PICKX"
        "$PICKBASH"
        "$PICKCOMP"
        "$PICKJGMENU"
    )

    checkTerm # Define termfile e pickterm

    # Adicione um terminal ao array se um com um arquivo de configuração estiver em uso.

    if  [[ -n $termfile ]];then
        configs+=("$pickterm")
    fi


    for item in "${configs[@]}";do  # Agora salvando todas as configurações

        case "$item" in

            "$PICKOB"   )   getOBtheme
                            ;;
            "$PICKGTK"  )   getGTKtheme
                            ;;
            "$PICKBG"   )   getBg
                            ;;
            "$PICKCONKY")   getConky
                            ;;
            "$PICKTINT" )   getTint
                            ;;
            "$PICKPLANK" )  getPlank
                            ;;
            "$PICKobmenugenerator" )  getobmenu-generator
                            ;;
            "$PICKDMENU")   getDmenu
                            ;;
            "$PICKLDM"  )   getLightdm
                            ;;
            "$PICKX"    )   getXconfig
                            ;;
            "$PICKBASH" )   getBashRC
                            ;;
            "$PICKCOMP" )   getComp
                            ;;
            "$PICKJGMENU")  getJgmenu
                            ;;
            "$pickterm" )   getTerminal "$termfile" "$pickterm"
                            ;;

            *           )   echo "$0:  Valor de configuração desconhecido na função saveSettings" >&2

                            exit 1

                            ;;
        esac
    done

    txt="<big><b><u>Configurações de temas a serem salvas:</u></b></big>\n\n"
    txt2=$(cat "$LISTMSG")

    yad_prompt "$txt$txt2" --button="Cancelar":252 --button="OK":0

    ret=$?
    if (( ret == 1 ));then

        cleanup all
        return 1

    else

        debug "Configurações atuais salvas como \"$NEWNAME\""

        echo "$NEWNAME" > "$CURSESSFILE"     # Substituir entrada no arquivo de sinalizador de configuração salvo
    fi
}


###################### Fim das funções de salvamento ##############################




###################### Restaurar funções ###############################

# pass icon theme name as $1

function checkICONS(){ # check if icon theme is still present

#    local ICOTXT="Icon theme <b>$1</b> not found\n\n  The default icon theme will be used..."

    debug "Verificando o tema do ícone $1"

    for i in "${iconPaths[@]}";do # iconPaths defined at top
        if [[ -d "$i/$1" ]];then
            debug "\n  Encontrado $1 tema de ícones."
            return 0
        fi
    done

    local pkg="${icon_pkgs[$1]}"

    if [[ -n "${pkg}" ]] && hash bl-install >/dev/null
    then

        debug "\n Tema de ícones $1 não foi encontrado\n Oferecendo para instalar $pkg..."

        if yad_question "Tema de ícone necessário <b>$1</b> não encontrado\n Você gostaria de instalar o pacote <b>${pkg}</b> que contém esse tema?" --button="Cancelar":1 --button="OK":0
        then

            local retfile retval

            retfile="$( mktemp )"

            bl-install -f "$retfile" "$pkg"

            # sleep 0.3 # dê tempo para o bl-install gravar em $retfile (agora feito no bl-install)

            retval="$(<"$retfile")"

            rm "$retfile"

            if [[ "$retval" = 0 ]]
            then

                debug "O pacote de ícones $pkg foi instalado."

                return 0

            else

                yad_warning "Falha na instalação do pacote." --button="Cancelar":1 --button="OK":0

                debug "Pacote de ícones ${pkg}: falha na instalação."

                return 1
            fi

        fi


    fi

    debug "\n  Tema de ícones $1 não foi encontrado."
#        yad_warning "$ICOTXT"

    return 1

}


# Passe o nome do tema GTK como $1

function checkGTK(){    # Verifique se o tema gtk ainda está presente.

    local INSTGTKTXT="Tema GTK necessário <b>$1</b> não encontrado\n Você gostaria de instalar o pacote <b>${pkg}</b> que contém esse tema?"

    local NOGTKTXT="Tema GTK <b>$1</b> não encontrado\n\n  Continuar com o tema GTK atual ou sair?"


    debug "Verificando o tema GTK $1"

    for i in "${gtkPaths[@]}";do # gtkPaths defined at top
        if [[ -d "$i/$1" ]];then
            debug "\n  Tema GTK de $1 encontrado."
            return 0
        fi
    done

    local pkg="${theme_pkgs[$1]}"

    if [[ -n "${pkg}" ]] && hash bl-install >/dev/null
    then

        debug "\n  O tema GTK $1 não foi encontrado\n Oferecendo a instalação do $pkg..."

        if yad_question "$INSTGTKTXT"
        then
            local retfile retval
            retfile="$( mktemp )"
            bl-install -f "$retfile" "$pkg"
            # sleep 0.3 # allow time for bl-install to write to $retfile (now done in bl-install)
            retval="$(<"$retfile")"

            rm "$retfile"

            if [[ "$retval" = 0 ]]
            then
                return 0
            else
                yad_warning "Falha na instalação do pacote."
            fi

        fi
    fi

    debug "\n Tema GTK $1 não foi encontrado."

#    yad_warning_option "$NOGTKTXT"

    return 1
}


# restoreIcons <icontheme>
# $1 is $VAL from restoreSettings()
# This function is needed only when not restoring GTK settings - icon theme is included there.

function restoreIcons(){

    local new_icon_theme current_gtk3_settings current_gtk2_settings new_gtk3_settings new_icon_theme

#    new_icon_theme=$1

    current_gtk3_settings="$HOME/$GTK3/settings.ini"
    current_gtk2_settings="$HOME/$GTK2"
    new_gtk3_settings="$THEMEPATH/user/$GTK3/settings.ini"
    parseKeyfile "$new_gtk3_settings" || { echo "$0: restoreIcons() Failed to parse $new_gtk3_settings." 2>&1; return 1;} # new GTK settings will not be restored, reading icon theme only
    new_icon_theme=${KEYS[gtk-icon-theme-name]}
    unset KEYS

    debug "Definir tema de ícone $new_icon_theme encontrado em $new_gtk3_settings"

    checkICONS "$new_icon_theme" || {

        yad_warning "Tema de ícones <b>$new_icon_theme</b> não encontrado \n\n  O tema de ícones atual será usado."

        debug "Tema de ícones $new_icon_theme não foi encontrado, continuando a usar o tema de ícones atual."

        return 0 # retornar 1 acionaria uma mensagem de erro
    }

    debug "\n Definir tema de ícone para $new_icon_theme, O tema GTK não foi alterado."

    editKeyfile "$current_gtk3_settings" "gtk-icon-theme-name=$new_icon_theme" || return 1
    editKeyfile --gtk2 "$current_gtk2_settings" "gtk-icon-theme-name=$new_icon_theme" || return 1
    reloadGTK
}


# THEMEPATH is global set by displayBlobs()
# restoreGTK [--noicons] <gtktheme> <icontheme>
# gtk/icon themes to be restored are $VAL from restoreSettings()
#  (these could be parsed from "$THEMEPATH/user/$GTK3/settings.ini" instead)
# option --noicons causes icon theme to be reset to current setting

function restoreGTK(){

    local restore_icons current_gtk3_settings new_gtk3_settings current_gtk2_settings current_gtk_theme new_gtk_theme current_icon_theme new_icon_theme
    restore_icons=true
    [[ $1 = '--noicons' ]] && { restore_icons=false; debug "Not setting a new icon theme."; shift; }

#    new_gtk_theme=$1
#    [[ -n $2 ]] && new_icon_theme=$2

    current_gtk2_settings="$HOME/$GTK2"
    current_gtk3_settings="$HOME/$GTK3/settings.ini"
    new_gtk3_settings="$THEMEPATH/user/$GTK3/settings.ini"
    parseKeyfile "$current_gtk3_settings" || { echo "$0: restoreGTK() Failed to parse ${current_gtk3_settings}." 2>&1; return 1;} # settings before restoring files with new theme
    current_gtk_theme=${KEYS[gtk-theme-name]}
    current_icon_theme=${KEYS[gtk-icon-theme-name]}
    unset KEYS
    debug "current gtk theme is ${current_gtk_theme}, icon theme is $current_icon_theme"
    parseKeyfile "$new_gtk3_settings" || { echo "$0: restoreGTK() Failed to parse $new_gtk3_settings." 2>&1; return 1;} # settings after restoring files with new theme
    new_gtk_theme=${KEYS[gtk-theme-name]}
    new_icon_theme=${KEYS[gtk-icon-theme-name]}
    unset KEYS
    debug "Setting GTK theme $new_gtk_theme found in $new_gtk3_settings"

    checkGTK "$new_gtk_theme" || {
        local NOGTKTXT="GTK theme <b>$new_gtk_theme</b> not found\n\n  Continue with the current GTK theme, or exit?"
        if yad_warning_option "$NOGTKTXT"; then
            debug "$new_gtk_theme not found, continuing with current GTK theme $current_gtk_theme"
            if [[ $restore_icons = 'true' ]]; then
                debug "icon theme $new_icon_theme will be applied"
                restoreIcons "$new_icon_theme" || return 1 # applying new icon theme without gtk theme ( includes checkICONS )
            fi
            return 0
        else
            exit 1
        fi
    }


    [[ $restore_icons = 'true' ]] && {

        debug "Definir tema de ícone $new_icon_theme encontrado em $new_gtk3_settings"

        checkICONS "$new_icon_theme" || {

            local NOICOTXT="Tema de ícones <b>$new_icon_theme</b> não encontrado\n\n O tema de ícones atual será usado."

            yad_warning "$NOICOTXT"

            restore_icons=false
        }
    }

    safeKill jgmenu # If jgmenu is not running, GTK3 file edit will not trigger hook.
    restoreFiles "$GTK2" "$GTK2MINE" "$GTK3" "$GTK3x"
    # $HOME/$GTK3/settings.ini has now been updated
    [[ $restore_icons = 'false' ]] && {
        debug "Setting icon theme back to current $current_icon_theme"
        editKeyfile "$current_gtk3_settings" "gtk-icon-theme-name=$current_icon_theme" || return 1
        editKeyfile --gtk2 "$current_gtk2_settings" "gtk-icon-theme-name=$current_icon_theme" || return 1

    }
    # If jgmenu cache is set, restart will not trigger GTK sync.
    # This means GTK sync will have to be done in this script, if wanted.
    # Currently done in restoreSettings().
    jgmenu_write_gtkcache "$current_gtk3_settings"
    reloadGTK
    reloadXfceNotifyd
    # restartThunar # not needed now that bl-reload-gtk23 updates xsettings
}



function reloadGTK(){ # Recarregar tema gtk após restaurar configuração salva.

    debug "\nRecarregando o tema GTK..."

    if ((DEBUG_FLAG)); then
        bl-reload-gtk23 --force && debug "\nbl-reload-gtk23: done\n" || echo "bl-reload-gtk23 failed" >&2
    else
        bl-reload-gtk23 --force >/dev/null 2>&1 || echo "bl-reload-gtk23 failed" >&2
    fi
}


# pass gtk keyfile as $1, parse GTK theme from there instead of accepting name in settings.cfg
function jgmenu_write_gtkcache(){
    local gtktheme jgmenu_cachedir
    jgmenu_cachedir="$HOME/.cache/jgmenu"
    mkdir -p "$jgmenu_cachedir"
    parseKeyfile "$1" || { echo "$0: jgmenu_write_gtkcache() Failed to parse $1" 2>&1; return 1;}
    gtktheme=${KEYS[gtk-theme-name]}
    debug "Setting $gtktheme as GTK theme in jgmenu cache."
    printf '%s' "$gtktheme" > "$jgmenu_cachedir/.last-gtktheme"
    unset KEYS
}

# next time xfce4-notifyd is called it will restart the two daemons, with latest config
function reloadXfceNotifyd(){
    debug "Stopping xfconf and xfce4-notify daemons."
    safeKill xfconfd
    safeKill xfce4-notifyd
}

function checkOBTHEME(){
    local FOUNDOB=0
    local OBTXT="Tema OpenBox <b>$1</b> não encontrado\n\n  O tema padrão do OpenBox será usado..."
    for i in "${gtkPaths[@]}";do # gtkPaths defined at top
        if [[ -d "$i/$1/openbox-3" ]];then
            debug "\n  Encontrado $1 tema OpenBox"
            FOUNDOB=1
            break
        fi
    done
    if (( FOUNDOB == 0 ));then

        debug "\n Tema OpenBox $1 não foi encontrado\n  O tema padrão do OpenBox será usado..."

        yad_warning "$OBTXT"
    fi
}


# escape filepaths for xmlstarlet

urlencode() {
    local LC_ALL=C c i e=''
    for (( i = 0; i < ${#1}; i++ )); do
        c=${1:i:1}
        case $c in
            [[:alnum:].~_-]) ;;
            *) printf -v c '%%%02X' "'$c" ;;
        esac
        e+=$c
    done
    printf '%s' "$e"
}

# RCFILE and OLDRCFILE set in USER CONFIG VARIABLES at top.
# THEMEPATH and BKP_SFX are globals,
# set by displayBlobs() and restoreSettings() respectively.

function restoreOBrc(){

    local themefile rcbkp xsl
    themefile="$THEMEPATH/obtheme.txt"

    [[ -r $RCFILE ]] || {

        debug "Restaurando tema de $themefile para $OLDRCFILE em vez de $RCFILE"

        RCFILE="$OLDRCFILE"
    }


    # Backup bl-rc.xml primeiro

    rcbkp="${RCFILE}${BKP_SFX}"
    cp "$RCFILE" "$rcbkp"


    # Remover backups mais antigos

    for f in "$OBPATH"/*.blob~ ;do
        if [[ $f -ot $rcbkp ]];then
            rm "$f"
        fi
    done

    debug "\n  $RCFILE feito backup como $rcbkp"


    # Substitua o elemento <theme> em $RCFILE de $themefile:

    xsl='<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ob="http://openbox.org/3.4/rc" >
  <xsl:output method="xml" encoding="UTF-8" />
  <xsl:param name="themefile" /> <!-- must url encode this file path -->

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="ob:theme">
    <xsl:apply-templates  select="document($themefile)" />
  </xsl:template>
  <!-- create elements with default namespace -->
  <xsl:template match="*" >
    <xsl:element name="{local-name()}" namespace="http://openbox.org/3.4/rc">
      <xsl:apply-templates select="@*|node()" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|text()|comment()">
    <xsl:copy/>
  </xsl:template>

</xsl:stylesheet>
'
    themefile="file://$(urlencode "$themefile")"

# Alterado de xmlstarlet para xml

    xmlstarlet transform <(cat <<<"$xsl") -p themefile="'$themefile'"  "$RCFILE" > "${RCFILE}_tmp" || return 1
    cat "${RCFILE}_tmp" > "$RCFILE" || return 1
    rm "${RCFILE}_tmp"

    debug "\n  $RCFILE editado para tema OpenBox"

    openbox --reconfigure || return 1

    debug "\n OpenBox reconfigurado"
}


# pass path to image as $1
# returns 0 if OK, 2 if image file available but path is different ($img is updated), 3 if user declines to install needed package, 1 if image cannot be found

function checkWallpaper(){

    fixed_img='' # will be inherited by background restoring functions
    [[ -n $1 ]] || { debug "No image path sent to checkWallpaper()"; return 1; }
    local imgpath="$1" imgname found_imgpath pkg
    [[ -r "$imgpath" ]] && {
        debug "Papel de parede encontrado $imgpath"
        return 0
    }
    imgname=${imgpath##*/}
    debug "$imgpath not found, checking if $imgname is somewhere else on system..."
    found_imgpath=$(find -L "${wallpaths[@]}" -type f -name "$imgname" -print -quit 2>/dev/null) # print first found file only
    [[ -n $found_imgpath ]] && {
        found_imgpath=$( readlink -f "$found_imgpath" )
        debug "Found $imgname at $found_imgpath"
        fixed_img=$found_imgpath # img is inherited by restoreBg(), inside restoreSettings()
        return 2
    }
    debug "Unable to find $imgname in the expected places, checking all installed packages..."
    found_imgpath=$(dpkg-query --search "*/${imgname}" 2>/dev/null) && {
        pkg=${found_imgpath%%: *}
        found_imgpath=${found_imgpath#${pkg}: }
        debug "Package $pkg includes $imgname at $found_imgpath"
        fixed_img=$found_imgpath
        return 2
    }
    debug "No installed package includes $imgname"
    pkg="${wallpaper_pkgs[$imgname]}"
    if [[ -n "${pkg}" ]] && hash bl-install >/dev/null
    then
        debug "\n  Wallpaper $imgname was not found\n  Offering to install $pkg..."
        local yad_wallpaper_q="Papel de parede necessário <b>$imgname</b> não encontrado\n Você gostaria de instalar o pacote <b>${pkg}</b> que contém esse papel de parede?\n Se não quiser instalar o pacote, você pode continuar com o papel de parede atual ou sair agora."

        yad_question "${yad_wallpaper_q}" --button='Instalar pacote':0 --button='Continuar com o papel de parede atual':2 --button='Sair':1

        case $? in
        0)
            local retfile retval
            retfile="$( mktemp )"
            bl-install -f "$retfile" "$pkg"
            # sleep 0.3 # allow time for bl-install to write to $retfile (now done in bl-install)
            retval="$(<"$retfile")"
            rm "$retfile"
            if [[ "$retval" = 0 ]]
            then

                debug "Pacote de imagens $pkg foi instalado."

                found_imgpath=$(dpkg-query --listfiles "$pkg" | grep "/${imgname//./\\.}$") || {
                    echo "${0}: installed $pkg but $imgname was not found" >/&2
                    yad_warning "Pacote instalado $pkg mas não consegui encontrar $imgname"
                    debug "\n  Wallpaper $imgname  was not found in $pkg"
                    return 1
                }
                if [[ "$found_imgpath" = "$imgpath" ]] # check if image path has changed in new package
                then
                    debug "$imgname now available at original path $imgpath"
                    return 0 # $img is correct
                else
                    debug "$imgname now available but path has changed to $found_imgpath"
                    fixed_img=$found_imgpath
                    return 2
                fi
            else
                yad_warning "Falha na instalação do pacote."
                debug "Image package ${pkg}: install failed."
                return 1
            fi

            ;;
        2)
            debug "Declined install of ${pkg}, so ${imgname} is unavailable."
            return 3
            ;;
        1)
            exit
            ;;

        esac
    fi

    debug "\n  Papel de parede $imgname não foi encontrado"
    return 1
}

# $1 is path to nitrogen file
function parseNitrofile(){ # get first image set in a nitrogen file
    while read -r line;do
        [[ $line = 'file='* ]] || continue
        printf '%s' "${line#file=}"
        break
    done < "$1"
}

# $1 is path to feh file
function parseFehfile(){ # get first image set in a feh file
    # get fields between single quotes
    while read -r line;do
        printf '%s' "${line}"
    done < <(grep -o "'[^']*'" "$1" | sed "s/'//g" 2>/dev/null)
}

function restoreBg(){    # $1 = $VAL from restoreSettings(), img is inherited from restoreSettings()
    case $1 in
    NITROGEN)
        restoreNitrogen  || { echo "$0: falha ao aplicar papel de parede com Nitrogen" >&2; return 1; }
        ;;
    FEH)
        restoreFeh       || { echo "$0: falha ao aplicar papel de parede com feh" >&2; return 1; }
        ;;
    XFDESKTOP)
        restoreXfdesktop || { echo "$0: falha ao aplicar papel de parede com xfdesktop" >&2; return 1; }
        ;;
    PCMANFM)
        restorePcmanfm   || { echo "$0: falha ao aplicar papel de parede com pcmanfm" >&2; return 1; }
        ;;
    esac
}


function restoreNitrogen(){

    local nitroimg need_edit=false

    debug "Usando Nitrogen para fixar papel de parede"

    nitroimg=$(parseNitrofile "$THEMEPATH/user/${NITROFILE}")
    [[ -n $nitroimg ]] || { echo "$0: failed to parse new $NITROFILE" >&2; return 1; }
    debug "Image $nitroimg is set in $THEMEPATH/user/${NITROFILE}"
    checkWallpaper "$nitroimg"
    case $? in
    0)
        debug "Wallpaper image $nitroimg can be used."
        ;;
    2)
        debug "Wallpaper image now found at ${fixed_img}, ${HOME}/${NITROFILE} will be edited after restoring."
        need_edit=true # image file was found at a different path
        ;;
    1)
        debug "$nitroimg cannot be found"
        return 1
        ;;
    3)
        debug "Necessary package was not installed, continuing with current wallpaper."
        return 0
        ;;
    esac
    restoreFiles "$NITROFILE" || { echo "$0: failed to apply $NITROFILE" >&2; return 1; }
    [[ $need_edit = true ]] && {
        debug "Replacing $nitroimg with $fixed_img in ${HOME}/${NITROFILE}..."
        sed -i "s/${nitroimg//'/'/'\/'}/${fixed_img//'/'/'\/'}/" "${HOME}/${NITROFILE}" || { echo "$0: failed to edit $NITROFILE" >&2; return 1; }
        [[ $( parseNitrofile "${HOME}/${NITROFILE}" ) = "${fixed_img}" ]] || { echo "$0: failed to edit $NITROFILE" >&2; return 1; }
    }
    nitrogen --restore
}


function restoreFeh(){

    local fehimg need_edit=false

    debug "Usando feh para definir papel de parede"

    fehimg=$(parseFehfile "$THEMEPATH/user/${FEHFILE}")

    [[ -n $fehimg ]] || { echo "$0: falha ao analisar novo $FEHFILE" >&2; return 1; }

    debug "Imagem $fehimg está definido em $THEMEPATH/user/${FEHFILE}"


    checkWallpaper "$fehimg"

    case $? in

    0)
        debug "A imagem de papel de parede $fehimg pode ser usada."

        ;;

    2)
        debug "Imagem de papel de parede agora encontrada em $fixed_img"

        need_edit=true # O arquivo de imagem foi encontrado em um caminho diferente.

        ;;

    1)
        debug "$fehimg não pode ser encontrado."

        return 1

        ;;

    3)
        debug "O pacote necessário não foi instalado, continuando com o papel de parede atual."

        return 0

        ;;

    esac



    restoreFiles "$FEHFILE" || { echo "$0: falhou ao aplicar $FEHFILE" >&2; return 1; }

    [[ $need_edit = true ]] && {

        debug "Substituindo $fehimg por $fixed_img em ${HOME}/${FEHFILE}..."

        sed -i "s/${fehimg//'/'/'\/'}/${fixed_img//'/'/'\/'}/" "${HOME}/${FEHFILE}" || { echo "$0: falha ao editar $FEHFILE" >&2; return 1; }

        [[ $( parseFehfile "${HOME}/${FEHFILE}" ) = "${fixed_img}" ]] || { echo "$0: falha ao editar $NITROFILE" >&2; return 1; }
    }

    source "$HOME/$FEHFILE"
}



function restoreXfdesktop(){


    local ws wallpaper=$img # img is inherited from restoreSettings via restoreBg()

    ws=$(xdotool get_desktop)

    pgrep -fx "xfdesktop" -u "$USER" >/dev/null || {

        echo "$0: xfdesktop não está em execução."

        return 1

    }


    debug "Usando xfdesktop para definir papel de parede $wallpaper na área de trabalho ${ws}"

    checkWallpaper "$wallpaper"

    case $? in

    0)
        debug "Imagem de papel de parede $wallpaper pode ser usado."

        ;;
    2)
        debug "Substituindo $wallpaper por ${fixed_img}..."

        wallpaper=$fixed_img

        ;;
    1)
        debug "$wallpaper não pode ser encontrado."

        return 1

        ;;
    3)
        debug "O pacote necessário não foi instalado, continuando com o papel de parede atual."

        return 0

        ;;

    esac


    props=$(xfconf-query -c xfce4-desktop -l | grep --fixed-strings "/workspace${ws}/last-image")

    [[ -z $props ]] && {

        debug "Falha ao encontrar propriedade xfdesktop segurando /workspace${ws}/last-image"

        return 1

    }


    while read -r prop
    do
        xfconf-query -c xfce4-desktop -p "$prop" --set "$wallpaper" || {

            echo "$0: falha ao definir $wallpaper para $prop" >&2

            return 1
        }

    done <<< "$props"


    if hash bl-restart
    then
        bl-restart xfdesktop
    else
        xfdesktop --reload
    fi
}



function restorePcmanfm(){
    local re wallpaper=$img # img is inherited from restoreSettings via restoreBg()
    re='pcmanfm[[:blank:]].*--desktop'
    pgrep -fx "$re" -u "$USER" >/dev/null || {
        echo "$0: pcmanfm is not setting the wallpaper"
        return 1
    }
    debug "Using pcmanfm to set wallpaper $img"
    checkWallpaper "$wallpaper"
    case $? in
    0)
        debug "Wallpaper image ${wallpaper} can be used."
        ;;
    2)
        debug "Replacing ${wallpaper} with ${fixed_img}..."
        wallpaper=$fixed_img
        ;;
    1)
        debug "$wallpaper cannot be found"
        return 1
        ;;
    3)
        debug "Necessary package was not installed, continuing with current wallpaper."
        return 0
        ;;
    esac
    pcmanfm --set-wallpaper="$wallpaper" || {
        echo "$0: pcmanfm failed to set $wallpaper as wallpaper"
        return 1
    }
}


function restoreConky(){    # $1 = $VAL from restoreSettings()

    local conkycmds currDesktop user_conkysession saved_conkysession
    conkycmds="${1//;/$'\n'}" # only used as fallback if there is no sessionfile
    user_conkysession="$HOME/$CONKYSESSION"
    saved_conkysession="$THEMEPATH/user/$CONKYSESSION"
    # cd only applies during subshell
    (
        cd "$THEMEPATH/user" && {
            shopt -s globstar dotglob nullglob
            for i in **/*conky*.conf **/*conkyrc **/*conky
            do
                [[ -f "$i" ]] || continue
                debug "aplicando arquivo conky $i"
                restoreFiles "$i" || echo "$0: falha ao aplicar o arquivo conky $i" >&2
            done
            shopt -u globstar dotglob nullglob
        }
    )
    if [[ -f $saved_conkysession ]]
    then

        debug "Restaurando o arquivo de sessão do conky."

    elif [[ -n $conkycmds ]]
    then

        debug "Nenhum arquivo conkysession salvo encontrado, usando comandos em settings.cfg"

        if [[ $conkycmds = 'none' ]]
        then
            debug "Nenhum conky salvo - removendo conteúdo do arquivo de sessão do conky."
            :> "$saved_conkysession"
        else
            echo "$conkycmds" > "$saved_conkysession"
        fi

    else

        echo "$0: não é possível restaurar o conky, não há informações da sessão." >&2
        return 1

    fi

    restoreFiles "$CONKYSESSION" || {

        echo "$0: falha ao restaurar sessão conky $saved_conkysession" >&2
        return 1
    }

    hash bl-conky-session || return 1 # bl-conky-session should be available - it comes with bl-obthemes in bunsen-utilities
    bl-conky-session --kill-running "$user_conkysession" || { # bl-conky-session can handle old-style sessionfiles, desktops too
        "$0: falha ao iniciar sessão conky $user_conkysession com bl-conky-session" >&2
        return 1
    }

    debug "\n  Conky restaurado\n"
}


function restoreTint2(){    # $1 = $VAL from restoreSettings()

    local tintcmds user_tintsession saved_tintsession
    tintcmds="${1//;/$'\n'}"
    user_tintsession="$HOME/$TINTSESSION"
    saved_tintsession="$THEMEPATH/user/$TINTSESSION"


# restaurar quaisquer configurações do tint2 que foram salvas
# assumir que estão todas no diretório tint2


    [[ -d "$THEMEPATH/user/.config/tint2" ]] || {

        echo "$0: não é possível restaurar Tint2, diretório $THEMEPATH/user/.config/tint2 não existe" >&2
        return 1
    }

    if [[ -f "$saved_tintsession" ]]
    then
        debug "Restoring tint2 sessionfile."
    elif [[ -n $tintcmds ]]
    then
        debug "No saved tintsession file found, using filepaths in settings.cfg"
        if [[ $tintcmds = 'none' ]]
        then
            debug "No saved tint2s - generating empty tint2 sessionfile."
            :> "$saved_tintsession"
        else
            echo "$tintcmds" > "$saved_tintsession"
        fi
    else
        echo "$0: não é possível restaurar o tint2, não há informações de sessão." >&2
        return 1
    fi
    restoreFiles  '.config/tint2' || { # restoreFiles will restore whole directory with contents
        echo "$0: falha ao aplicar o diretório user/.config/tint2 em $THEMEPATH" >&2
        return 1
    }
    if hash bl-tint2-session # bl-tint2-session comes in bunsen-utilities, which bunsen-blob depends on
    then
        bl-tint2-session "$user_tintsession" || {
            echo "$0: failed to start tint2 session $user_tintsession with bl-tint2-session" >&2
            return 1
        }
    fi

    debug "\n Tint2 restaurado\n"

}



# ----------------------------------------------------------------------------------------


# Restaurar os lançadores do Plank ~/.config/plank/dock1/launchers/

function restorePlank(){ 


# restaurar quaisquer configurações do plank que foram salvas
# assumir que estão todas no diretório plank

    [[ -d "$THEMEPATH/user/.config/plank" ]] || {

        echo -e "\n$0: ${RED}não é possível restaurar Plank, diretório $THEMEPATH/user/.config/plank não existe \n ${NC}" >&2

        return 1
    }



        echo -e "\nRestaurado Plank...\n"

        mkdir -p ~/.config/
 
        cp -r $THEMEPATH/user/.config/plank ~/.config/  && echo -e "\n${GREEN}Plank restaurado [OK] ${NC}\n" || { # restoreFiles irá restaurar todo o diretório com o conteúdo

        echo -e "\n$0: ${RED}falha ao aplicar o diretório $THEMEPATH/user/.config/plank em $HOME/.config/ \n ${NC}" >&2

        return 1
    }



        echo -e "\nRecarregando as configurações do Plank...\n"

        pkill plank ; plank 1>/dev/null 2>/dev/null &

    


} 

# ----------------------------------------------------------------------------------------



# Restaurar as configurações do obmenu-generator

function restoreobmenugenerator(){ 


# restaurar quaisquer configurações do obmenu-generator que foram salvas
# assumir que estão todas no diretório obmenu-generator

    [[ -d "$THEMEPATH/user/.config/obmenu-generator" ]] || {

        echo -e "\n$0: ${RED}não é possível restaurar obmenu-generator, diretório $THEMEPATH/user/.config/obmenu-generator não existe \n ${NC}" >&2

        return 1
    }



        echo -e "\nRestaurado obmenu-generator...\n"

        mkdir -p ~/.config
 
        # cp -r $THEMEPATH/user/.config/obmenu-generator ~/.config

        restoreFiles  '.config/obmenu-generator'  && echo -e "\n${GREEN}obmenu-generator restaurado [OK] ${NC}\n" || { # restoreFiles irá restaurar todo o diretório com o conteúdo

        echo -e "\n$0: ${RED}falha ao aplicar o diretório $THEMEPATH/user/.config/obmenu-generator em $HOME/.config/ \n ${NC}" >&2

        return 1
    }



        # echo -e "\nRecarregando as configurações do obmenu-generator...\n"

        # obmenu-generator -i -p && obmenu-generator -R 1>/dev/null 2>/dev/null &

    


} 

# ----------------------------------------------------------------------------------------



# THEMEPATH and BKP_SFX are globals,
# set by displayBlobs() and restoreSettings() respectively.

function restoreLightdm(){   # need sudo to restore lightdm-gtk-greeter.conf
    local msg ret
    [[ -r "$THEMEPATH/$LDM" ]] || {
        echo "$0: Cannot read file $THEMEPATH/$LDM" >&2
        return 1
    }
    diff -qBEbZ "$THEMEPATH/$LDM" "$LDMDIR/$LDM" >/dev/null && {
        debug "\n $THEMEPATH/$LDM and $LDMDIR/$LDM are identical, no need to restore."
        return 0
    }


    while true;do

        msg="Por favor, digite sua senha para editar o arquivo de sistema lightdm-gtk-greeter.conf"

        yad_prompt "$msg" --entry --hide-text | sudo -S cp --backup --suffix="$BKP_SFX" "$THEMEPATH/$LDM" "$LDMDIR/$LDM" 2>/dev/null

        ret=( "${PIPESTATUS[@]}" )

        if [[ ${ret[1]} = 0 ]]
        then
            msg="Aplicado: lightdm-gtk-greeter.conf"
            debug "\n  $msg"
            return 0

        elif [[ ${ret[0]} = 1 ]]
        then
            msg="Autenticação cancelada\n\nlightdm-gtk-greeter.conf não foi aplicado."
            echo "$0: $msg" >&2
            return 1

        else
            msg="Falha na entrada da senha\n\nlightdm-gtk-greeter.conf não foi aplicado."
            echo "$0: $msg" >&2
            yad_warning "$msg"

        fi

    done

}


# $1 [$2...] are relative paths passed from displayBlobs()
# THEMEPATH is global set by displayBlobs()
# If source is directory, its contents will be copied to the equivalent user directory.

function restoreFiles(){
    local src_file target_file i
    for i in "$@"
    do
        debug "\nRestoring ${i}..."
        src_file="$THEMEPATH/user/$i"
        target_file="$HOME/$i"
        if [[ -d $src_file ]]; then
            copyDir "$src_file" "$target_file" || return 1
        elif [[ -f $src_file ]]; then
            restoreFileAbs "$src_file" "$target_file" || return 1
        else
            echo "$0: File to restore, $src_file does not exist." >&2
            return 1
        fi
    done
}


# Copy all the contents of a directory, recursively.
# $1 and $2 are absolute paths of source and target directories.

function copyDir(){

    local src_dir target_dir i

    src_dir="$1"
    target_dir="$2"

    if [[ -f $target_dir ]]
    then
        echo "$0: target directory $target_dir is an ordinary file" >&2
        return 1
    fi

    debug "\n  making directory $target_dir"

    mkdir -p "$target_dir" || return 1

    for i in "$src_dir"/*
    do
        [[ -e "$i" ]] || continue
        if [[ -d "$i" ]]
        then
            copyDir "$i" "$target_dir/${i##*/}" || return 1
        else
            restoreFileAbs "$i" "$target_dir/${i##*/}" || return 1
        fi
    done
}



# $1 e $2 são caminhos de arquivo de origem e destino absolutos
# BKP_SFX é global definido por restoreSettings()()

function restoreFileAbs(){

    local src_file src_content tmpsrc target_file target_file_canon target_dir bkp_file extra_txt
    src_file="$1"
    target_file="$2"
    target_file_canon="$(readlink -f "$target_file")" # canonical path
    [[ -L "$target_file" ]] && debug "$target_file is a symbolic link, pointing to $target_file_canon"
    [[ -w "$target_file" ]] || {
        echo "$0: Não é possível restaurar $src_file porque $target_file não é gravável." >&2
        return 1
    }
    target_dir="${target_file%/*}"
    mkdir -p "$target_dir" || return 1
    extra_txt=''
    grep -qF "$HOME_MARKER" "$src_file" && {
        src_content=$(< "$src_file" )
        tmpsrc="$(mktemp)" || return 1
        echo "${src_content//$HOME_MARKER/$HOME}" > "$tmpsrc"
        src_file=$tmpsrc
        extra_txt=' (home path adjusted)'
    }
    if [[ -e $target_file ]];then        # backup config first
        diff -qBEbZ "$src_file" "$target_file" >/dev/null && {
            debug "\n  $target_file and ${src_file}${extra_txt} are identical, no need to restore."
            return 0
        }
        needBackup "${target_file}" && {
            bkp_file="${target_file_canon}${BKP_SFX}"
            cp "$target_file" "$bkp_file" || return 1
            debug "\n  $target_file backed up to $bkp_file"
        }
        cp "$src_file" "$target_file" || return 1
        debug "\n  $target_file restored"
    else
        cp "$src_file" "$target_file" || return 1
        debug "\n  $target_file did not exist, now added"
    fi
    rm -f "$tmpsrc"
}


# Take absolute filepath (in $HOME) as $1, from restoreFileAbs().
# Check if an identical backed-up file already exists, and if not,
# search for identical file in existing saved BLOBs.
# Return 1 if found (no backup needed before overwrite),
# otherwise return 0 (do backup).

needBackup(){

    local file file_canon bkp_file path dir blobfile homefile_content blobfile_content
    file=$1
    file_canon="$(readlink -f "$file")" # canonical path if $file is symlink
    for bkp_file in "${file_canon}"*~
    do
        [[ -f $bkp_file ]] || continue
        diff -qBEbZ "$file" "$bkp_file" >/dev/null && {
            debug "$file already has identical backup ${bkp_file}, no need to backup again"
            return 1
        }
    done
    path="${file#$HOME/}"
    for dir in "$USRCONFIGPATH"/*/user "$SYSCONFIGPATH"/*/user
    do
        [[ -f $dir/$path ]] || continue
        blobfile=$dir/$path
        if grep -qF "$HOME_MARKER" "$blobfile"; then
            homefile_content=$(< "$file" )
            blobfile_content=$(< "$blobfile" )
            [[ "$homefile_content" = "${blobfile_content//$HOME_MARKER/$HOME}" ]]  && {
                debug "$file has identical copy $blobfile, no need to backup"
                return 1
            }
        else
            diff -qBEbZ "$file" "$blobfile" >/dev/null && {
                debug "$file has identical copy ${blobfile}, no need to backup"
                return 1
            }
        fi
    done
    return 0
}


# THEMEPATH and BKP_SFX are globals set by displayBlobs() and restoreSettings() respectively.
# dconfdir and appname passed as $1 and $2 from restoreSettings()
# dconfdir is a dconf path, not a file path.

function restoreDconf(){
    local dconfdir appname src_file bkpdir bkp_file current_state blob_state
    dconfdir=$1
    appname=$2
    src_file="$THEMEPATH/dconf/${appname// /_}"
    [[ -f $src_file ]] || {
        echo "$0: cannot find dconf config $src_file for ${appname}" >&2
        return 1
    }
    bkpdir="$HOME/.config/dconf-backups"
    bkp_file="$bkpdir/${appname// /_}${BKP_SFX}"
    current_state=$( dconf dump "$dconfdir" ) || return 1
    blob_state=$(< "$src_file" )
    [[ $current_state = "$blob_state" ]] && { # including when both are empty, ie default state
        debug "${appname}: no need to restore dconf, settings are the same."
        return 0
    }
    [[ -n $current_state ]] && {
        mkdir -p "$bkpdir" || return 1
        debug "${appname}: backing up dconf settings to $bkp_file"
        printf '%s\n' "$current_state" > "$bkp_file" || return 1
        dconf reset -f "$dconfdir" || return 1
    }
    [[ -n $blob_state ]] && {
        debug "${appname}: restoring dconf settings from $src_file"
        dconf load "$dconfdir" < "$src_file" || return 1
    }
}


# This function is run in displayBlobs() below
# CURRENTSESSION and NUMDIRS from getCurrent()
# DLGARR and CURRENTSESSDIR are local to displayBlobs()

function UpdateDisplayDialog(){   # list saved theme collections for yad as DLGARR
    getCurrent                    # get name of latest set BLOB config
    if (( NUMDIRS == 0 ));then    # no saved configs; go back to Intro dialog
        Intro
    fi
    local seticon themename thumbnail
    declare -A uniqnames # hide duplicate directories
    DLGARR=()
    for dir in "$USRCONFIGPATH"/* "$SYSCONFIGPATH"/* ;do
        [[ -d $dir && -e $dir/settings.cfg ]] || continue
        themename="${dir##*/}" # strip path
        themename=${themename// /_}   # replace any spaces in dir name
        [[ "${uniqnames[$themename]}" = 'found' ]] && continue
        uniqnames["$themename"]='found'
        # get name of current session, set icon for TRUE/FALSE
        if [[ $CURRENTSESSION = "$themename" ]];then
            seticon="gtk-yes"
            CURRENTSESSDIR="$dir"
        elif [[ "$dir" = "$SYSCONFIGPATH"/* ]]; then
            seticon="system"
        else
            seticon="gtk-home"
        fi
        thumbnail="$dir/$themename-thumb.jpg"
        [[ -r $thumbnail ]] || thumbnail='None'     # placeholder if no thumbnail found
        DLGARR+=( "$seticon" "<big>$themename</big>" "$thumbnail" )
    done
}


# This function is run in displayBlobs() below to set width and height for View dialog.
# generates DLGWIDTH and DLGHEIGHT, local to displayBlobs()

function getActiveMonitorDimensions(){
    local -a dim
    read -r -a dim < <(bl-xinerama-prop)
    DLGWIDTH=$(( dim[0] / 3 ))
    DLGHEIGHT=$(( dim[1] * 2 / 3 ))
    [[ $DLGWIDTH =~ ^[0-9]+$ ]] && [[ $DLGHEIGHT =~ ^[0-9]+$ ]] || {
        print 'Error in getActiveMonitorDimensions'
        exit 1
    }
}


# Check for a running background-setting daemon.
# (There should not be more than one!)

function checkBgDaemon(){
    local daemon_bgsetters
    daemon_bgsetters=('XFDESKTOP' 'PCMANFM') # If any of these are running they can set a wallpaper just by its filepath.
    for i in "${daemon_bgsetters[@]}"
    do
        case $i in
        XFDESKTOP)
            re='xfdesktop'
            ;;
        PCMANFM)
            re='pcmanfm[[:blank:]].*--desktop'
            ;;
        esac
        pgrep -fx "$re" -u "$USER" >/dev/null && {
            printf '%s' "$i"
            return 0
        }
    done
    return 1
}


# This function is run in displayBlobs() below
# global THEMEPATH is set there
# themename is local to displayBlobs()

restoreSettings() {
    # get chosen saved configs and restore them
    # Conky and Tint2 will be killed by their restore functions, if called.
    BKP_SFX=".$(date +"%d%m%Y-%H%M%S").blob~" # global: unified backup suffix that restore functions will use
    local TAG VAL labels label columns select ret CHOICE jgmenu_sync jgmenu_sync_ob jgmenu_sync_gtk bgsetter orig_bgsetter img
    # img will be inherited by restoreBg and its children

    # pass label to be removed from restore dialog list
    unset_label(){
        local i label
        label=$1
        for i in "${!labels[@]}"; do
            [[ ${labels[i]} = "$label" ]] && {
                unset 'labels[i]'
                return 0 # first instance will be unset (there should only be one)
            }
        done
        return 1 # label not found
    }

    labels=()
    declare -A values
    while read -r TAG VAL; do
        case "$TAG" in
            "[OBTHEME]"     )   labels+=("$PICKOB")       # A ordem dos "valores" da matriz associativa não está definida,
                                values["$PICKOB"]="$VAL"  # mas o array indexado "labels" preserva a ordem de settings.cfg.
                                ;;
            "[GTK]"         )   labels+=("$PICKGTK")
                                values["$PICKGTK"]="$VAL"
                                ;;
            "[ICONS]"       )   labels+=("$PICKICONS")
                                values["$PICKICONS"]="$VAL"
                                ;;
            "[BACKGROUND]"  )   [[ $VAL = None ]] || {
                                    labels+=("$PICKBG")
                                    values["$PICKBG"]="$VAL"
                                }
                                ;;
            "[CONKY]"       )   labels+=("$PICKCONKY")
                                values["$PICKCONKY"]="$VAL"
                                ;;
            "[TINT2]"       )   labels+=("$PICKTINT")
                                values["$PICKTINT"]="$VAL"
                                ;;
            "[DMENU]"       )   labels+=("$PICKDMENU")
                                values["$PICKDMENU"]="$VAL"
                                ;;
            "[PLANK]"       )   labels+=("$PICKPLANK")
                                values["$PICKPLANK"]="$VAL"
                                ;;

            "[obmenu_generator]" )   labels+=("$PICKobmenugenerator")
                                     values["$PICKobmenugenerator"]="$VAL"
                                ;;

            "[LIGHTDM]"     )   labels+=("$PICKLDM")
                                values["$PICKLDM"]="$VAL"
                                ;;
            "[EXITRC]"      )   : # ignore obsolete setting
                                ;;
            "[XFILE]"       )   labels+=("$PICKX")
                                values["$PICKX"]="$VAL"
                                ;;
            "[BASHRC]"      )   labels+=("$PICKBASH")
                                values["$PICKBASH"]="$VAL"
                                ;;
            "[COMPOSITOR]"  )   labels+=("$PICKCOMP")
                                values["$PICKCOMP"]="$VAL"
                                ;;
            "[JGMENU]"      )   labels+=("$PICKJGMENU")
                                values["$PICKJGMENU"]="$VAL"
                                ;;
            '['*']'         )   TAG="${TAG#[}" # strip outside brackets
                                TAG="${TAG%]}"
                                labels+=("$TAG")
                                values["$TAG"]="$VAL"
                                ;;
            '('*')'         )   TAG="${TAG#(}" # "hidden" tags not added to labels, but may be used when restoring
                                TAG="${TAG%)}"
                                values["$TAG"]="$VAL"
                                ;;
            '')                 :
                                ;;
            *               )   echo "$0: Ignoring unknown value: ${TAG} in $THEMEPATH/settings.cfg" >&2
                                ;;
        esac
    done < "$THEMEPATH/settings.cfg"


    # check if wallpaper can be restored by currently running daemon instead of original bgsetter
    img=${values[wallpaper]} # only set by recent versions of BLOB
    orig_bgsetter=${values["$PICKBG"]} # one of NITROGEN, FEH, XFDESKTOP, PCMANFM or possibly others, from settings.cfg

    if bgsetter="$(checkBgDaemon)"; then # not using nitrogen or feh

        if [[ -n $img ]]; then
            debug "$bgsetter will use image $img to draw wallpaper, set by $orig_bgsetter"
            values["$PICKBG"]="$bgsetter"
        else
            debug "$bgsetter cannot restore wallpaper without an image set in settings.cfg"
            unset_label "$PICKBG" # restore background will not be offered
        fi

    else
        debug "not using a background setting daemon"
        debug "can restore background ${img:+$img }with $orig_bgsetter"

        case "$orig_bgsetter" in

        NITROGEN)
            hash nitrogen || {
                debug "cannot restore wallpaper: nitrogen not found"
                unset_label "$PICKBG"
            }
            ;;
        FEH)
            hash feh || {
                debug "cannot restore wallpaper: feh not found"
                unset_label "$PICKBG"
            }
            ;;
        *)
            debug "cannot restore wallpaper set by $orig_bgsetter"
            unset_label "$PICKBG"
            ;;
        esac
    fi

    select='TRUE'

    while true
    do
        columns=()
        for i in "${labels[@]}"
        do
            columns+=("$select" "$i")
        done

        CHOICE=$(yad "${yad_args[@]}" --list --checklist \
            --title="Escolha as configurações a serem aplicadas..." \
            --button="Desmarcar tudo:2" $CANCEL $OK \
            --height=400 --width=400 \
            --print-column=2 --separator='' \
            --column="Selecione" --column="Configuração" "${columns[@]}" )

        ret=$?

        if (( ret == 1 )); then # Botão cancelar pressionado

            debug " Cancelado restauração de $themename"
            return

        elif (( ret == 2 ));then
            select="FALSE"
            continue
        fi

        if [[ -z $CHOICE ]] ; then # entry field is empty, so try again
            yad_question "\n  Faça uma seleção...." $EXIT $OK
            if (( $? == 1 ));then
                exit 0
            else
                select='FALSE'
                continue
            fi
        fi
        break
    done





    # Oferecer para sair se qualquer função de restauração falhar.

    # TODO: adicionar 'return 1' às funções conforme necessário.

    trap 'trap_error $LINENO "$FUNCNAME" "$BASH_COMMAND"' ERR

    jgmenu_sync=true
    jgmenu_sync_ob=false
    jgmenu_sync_gtk=false
    restore_gtk=false
    restore_icons=false


    # Percorra as opções selecionadas pelo usuário.

    while read -r label
    do
        VAL="${values[$label]}"
        VAL="${VAL//$HOME_MARKER/$HOME}" # HOME_MARKER é global

        debug "\n Restaurando $label${VAL:+ with $VAL}"


        case "$label" in

            "$PICKOB"       )   [[ -n $VAL ]] && checkOBTHEME "$VAL"
                                restoreOBrc
                                jgmenu_sync_ob=true
                                ;;
            "$PICKGTK"      )   restore_gtk="${VAL:-true}"
                                ;;
            "$PICKICONS"    )   restore_icons="${VAL:-true}"
                                ;;
            "$PICKBG"       )   restoreBg "$VAL"
                                ;;
            "$PICKCONKY"    )   restoreConky "$VAL"
                                ;;
            "$PICKTINT"     )   restoreTint2 "$VAL"
                                ;;
            "$PICKPLANK"     )   restorePlank "$VAL"
                                ;;
            "$PICKobmenugenerator" )   restoreobmenugenerator "$VAL"
                                ;;
            "$PICKDMENU"    )   restoreFiles "$DMENU"
                                ;;
            "$PICKLDM"      )   restoreLightdm
                                ;;
            "$PICKX"        )   restoreFiles "$XFILE"
                                xrdb ~/.Xresources
                                ;;
            "$PICKBASH"     )   restoreFiles "$BASHRC"
                                ;;
            "$PICKJGMENU"   )   restoreFiles "$JGMENURC"
                                jgmenu_sync=false # no need for openbox or gtk theme syncing, theme is provided in $JGMENURC
                                ;;
            "$PICKCOMP"     )   restoreFiles "$VAL"
                                hash bl-compositor 2>/dev/null && bl-compositor --restart || true # bl-compositor is in bunsen-pipemenus
                                ;;
            *               )   if [[ $VAL = '%dconf%'* ]] # dconf directories come prefixed with %dconf% in checkTerm (and others in future?)
                                then
                                    restoreDconf "${VAL#'%dconf%'}" "$label"
                                else
                                    restoreFiles "$VAL"
                                fi
                                ;;
        esac
    done <<< "$CHOICE"


    if [[ $restore_gtk != 'false' ]]; then # restoring GTK theme
        jgmenu_sync_gtk=true
        if [[ $restore_icons != 'false' ]]; then
            restoreGTK "$restore_gtk" "$restore_icons" # restoreGTK will restore GTK settings including icons
        else
            restoreGTK --noicons "$restore_gtk" # icon theme will be reset to current theme by restoreGTK
        fi
    else
        if [[ $restore_icons != 'false' ]]; then
            restoreIcons "$restore_icons" # only icon theme will be set
        fi
    fi


    hash jgmenu_run 2>/dev/null && [[ $jgmenu_sync = 'true' ]] && {

        if [[ $jgmenu_sync_ob = 'true' ]]
        then
            jgmenu_run init --apply-obtheme && debug "\n jgmenu sincronizado com o tema OpenBox."

        elif [[ $jgmenu_sync_gtk = 'true' ]]
        then
            jgmenu_run init --apply-gtktheme && debug "\n jgmenu sincronizado com o tema gtk."

        else
            debug "\n Tema jgmenu não alterado."
        fi
    }

    trap - ERR # Remover armadilha para tratamento normal de erros

    echo "$themename" > "$CURSESSFILE"
}


# used in displayBlobs() below and intro()
# NEWNAME CONFIGDIR and CONFIGDIR_BKP are globals set by setName()

function saveNewBlob() {
    need_restart=( xfdesktop ) # Hack because xfdesktop sometimes gets confused after getScrot - can add others if necessary.
    setName || return 1

    debug "\n  Salvando configurações como $NEWNAME"

    saveSettings || return 1
    getScrot
    yad_prompt "As configurações foram salvas como <b>$NEWNAME</b>" --image="gtk-save" "$OK"
    if [[ -d $CONFIGDIR_BKP ]];then
        rm -rf "$CONFIGDIR_BKP"

        debug "\n  Backup temporário de $CONFIGDIR excluído.\n"

    fi
    hash bl-restart && {
        for i in "${need_restart[@]}"
        do
            if pgrep -x -u "$USER" "$i" >/dev/null ; then # avoid noisy "not running" messages from bl-restart
                bl-restart "$i"
            fi
        done
    }
}


# used in displayBlobs() below
# tests if every file in $1 is identical with its equivalent in $2
# (files not present in both directories are ignored)
# $1 is usually the blob theme directory and $2 is usually $HOME
# difflist is local inside displayBlobs()

function sameFiles() {

    local smalldir bigdir dir file bigdirfile file_content bigdirfile_content
    smalldir=$1
    bigdir=$2
    difflist=()
    debug "Comparing $smalldir and $bigdir"
    for dir in "$smalldir" "$bigdir"
    do
        [[ -d $dir ]] || {
            echo "$0: ${dir} is not a directory." >&2
            return 1
        }
    done
    shopt -s globstar dotglob
    for file in "$smalldir"/**
    do
        [[ -f $file ]] || continue
        bigdirfile=${file/#$smalldir/$bigdir}
        [[ -f $bigdirfile ]] || continue
        extra_txt=''
        if grep -qF "$HOME_MARKER" "$file"; then
            file_content=$(< "$file" )
            bigdirfile_content=$(< "$bigdirfile" )
            extra_txt=' (home path adjusted)'
            [[ "${file_content//$HOME_MARKER/$HOME}" = "$bigdirfile_content" ]] || {
                debug "${file}${extra_txt} is different from $bigdirfile"
                difflist+=("$bigdirfile")
            }
        else
            diff -BEbZ "$file" "$bigdirfile" >/dev/null || {
                debug "${file} is different from $bigdirfile"
                difflist+=("$bigdirfile")
            }
        fi
    done
    shopt -u globstar dotglob
    [[ ${#difflist[@]} -eq 0 ]] && {
        debug "All files in $smalldir are identical with those in $bigdir"
        return 0
    }
    return 1
}


# compare 2 files, opening new terminal window if needed
# If --title is passed it will be used as title of a new terminal (if opened).
# Usage: differ [--title] firstfile secondfile

differ () {

    local title firstfile secondfile diffcmd
    if [[ $1 = '--title' ]]
    then
        title=$2
        shift 2
    fi
    firstfile=$1
    secondfile=$2
    # if a GUI diff is available, use that instead
    for gui in meld kompare diffuse
    do
        hash "$gui" 2>/dev/null && {
            "$gui" "$firstfile" "$secondfile" &
            return
        }
    done
    diffcmd=(colordiff -s -u)
    type colordiff >/dev/null 2>&1 || diffcmd=(diff -s -u)
    diffcmd+=("$firstfile" "$secondfile")
    if [[ -t 0 && -t 1 ]] # on terminal
    then
        "${diffcmd[@]}"
    else

        local termname termcmd

        [[ -n $title ]] || title="Diff of $firstfile and $secondfile"
        termname=$( readlink -f "$( which x-terminal-emulator )" )
        termname=${termname##*/}
        badterm_msg="$0: não é possível exibir a diferença de arquivo com a nova janela ${termname}."

        case $termname                                                   # Lidar com inconsistências terminais
        in
            lxterminal)
                termcmd=(lxterminal --no-remote -T "$title" -e)          # Caso contrário, o lxterminal não inicia um novo processo
                ;;
            mate-terminal.wrapper)
                termcmd=(mate-terminal --disable-factory -t "$title" -x) # mate-terminal.wrapper não suporta --disable-factory
                ;;
            tilix.wrapper)
                termcmd=(tilix --new-process -t "$title" -e)             # tilix.wrapper não suporta --new-process
                ;;
            qterminal|terminology)
                echo "$badterm_msg" >&2
                return 1
                ;;
            *)
                termcmd=(x-terminal-emulator -T "$title" -e)             # O caso normal
                ;;
        esac

        "${termcmd[@]}" bash -c '"$@"; echo -e "\nPress any key to close"; read -srn1' _ "${diffcmd[@]}"
    fi
}


########################################################################


######## Main BLOB list display function ###############################

# sets globals THEMEPATH and BKP_SFX (via restoreSettings) for restore functions


function displayBlobs(){

    local DLGWIDTH DLGHEIGHT DLGARR RET CONFIG CURRENTSESSDIR themename SYSDIRTXT TEXT difflist userfile img

    getActiveMonitorDimensions

    while true ;do

        UpdateDisplayDialog # generates DLGARR aand CURRENTSESSDIR

        CONFIG=$(yad "${yad_args[@]}" --list --title="$TITLE" \
            --text="Clique duas vezes na seleção destacada ou use a tecla \"Enter\", ou o botão \"Aplicar Blob Selecionado\" para aplicar o conjunto de temas selecionado à sua área de trabalho.\n" \
            --separator=" " \
            --button="_Salvar Blob Atual:3" --button="_Exibir Blob Selecionado:4" \
            --button="_Aplicar Blob Selecionado:0" --button="_Excluir Blob Selecionado:2" \
            $HLPBTN --button="Sair :1" \
            --always-print-result \
            --center --image-preview \
            --expand-column=3 \
            --column="Último conjunto:IMG" \
            --column="Nome da configuração":TEXT \
            --column="Captura de tela":IMG \
            "${DLGARR[@]}" \
            --width="$DLGWIDTH" --height="$DLGHEIGHT" 2>/dev/null)

# Para determinar o tamanho da tema do yad usar o bl-xinerama-prop

# --width="800" --height="500"


        RET=$?

        if [[ $CONFIG =~ '<big>'(.+)'</big>' ]];then

            themename=${BASH_REMATCH[1]}

             # If same name found, user directory will take precedence.

            if [[ -d "$USRCONFIGPATH/$themename" ]]
            then
                THEMEPATH="$USRCONFIGPATH/$themename"

            elif [[ -d "$SYSCONFIGPATH/$themename" ]]
            then
                THEMEPATH="$SYSCONFIGPATH/$themename"

            else
                msg="não é possível encontrar o tema BLOB $themename"
                echo "$0: $msg" >&2
                yad_fatal_error "$msg"
                exit 1
            fi

        else

            msg="a função displayBlobs retornou um valor estranho $CONFIG"

            echo "$0: $msg" >&2

            exit 1

        fi

        case $RET in
            0)  sameFiles "$CURRENTSESSDIR/user" "$HOME" || {
                    while true; do
                        if [[ -d $CURRENTSESSDIR ]]; then
                            TEXT="Você pode ter modificado a aparência da sua área de trabalho desde que ela foi salva como <b>${CURRENTSESSION}</b>.
Esses arquivos agora são diferentes:

 ${difflist[*]/%/\\n}
Você deseja salvar sua sessão atual antes de aplicar <b>${themename}</b>?"
                            yad_question "$TEXT" --button='Salve as configurações primeiro':2 --button='Não, aplicar agora':0 --button='Ver diferença(ões)':3 --button='Cancelar':1
                        else
                            TEXT="Parece que você não salvou a aparência atual da sua área de trabalho.
Você deseja salvar sua sessão atual antes de aplicar <b>${themename}</b>?"
                            yad_question "$TEXT" --button='Salve as configurações primeiro':2 --button='Não, aplicar agora':0 --button='Cancelar':1
                        fi
                        case $? in
                            0)
                                debug "\n Alguns arquivos de usuário foram alterados, mas mesmo assim o $themename foi restaurado."
                                break
                            ;;
                            1)
                                debug "\n Restauração cancelada de $themename"
                                continue 2
                            ;;
                            2)
                                debug "\n Salvando as configurações atuais da área de trabalho antes de restaurar $themename"
                                saveNewBlob || debug "As configurações atuais não foram salvas."
                                break
                            ;;
                            3)
                                debug "\n Mostrando diferenças de arquivo"
                                for userfile in "${difflist[@]}"; do
                                    differ --title "Changes in user files" "$CURRENTSESSDIR/user/${userfile#$HOME/}" "$userfile"
                                done
                            ;;
                        esac
                    done
                }

#                SAVED="$THEMEPATH/LISTMSG.txt"
#                TEXT="These configs saved as $CONFIG can be restored:\n\n"
#                TEXT="$TEXT$(< "$SAVED")"
#                yad_prompt "$TEXT" || continue

                debug "\n Restoring BLOB theme $themename"
                restoreSettings
                ;;

            1)  
                clear
                exit 0
                ;;

            2)  if [[ ! $CONFIG ]];then
                    if yad_prompt "Faça uma seleção antes de tentar excluir" "$EXIT" "$OK"
                    then
                        continue
                    else
                        exit 0
                    fi
                fi

                SYSDIRTXT="Sorry, system preset theme <b>${themename}</b> cannot be deleted"
                if [[ "${THEMEPATH%/*}" = "$SYSCONFIGPATH" ]]
                then
                    yad_warning "$SYSDIRTXT"
                    continue
                fi

                TEXT="Excluir configurações salvas <b>$THEMEPATH</b>\n e captura de tela?"
                if yad_prompt "$TEXT" --button="Cancelar":1 --button="OK":0
                then
                    rm -rf "$THEMEPATH"
                    debug "\n$themename DELETED"
                    if [[ $(< "$CURSESSFILE") = "$themename" ]];then
                        :> "$CURSESSFILE"
                    fi
                fi
                ;;

            3)  saveNewBlob || debug "As configurações não foram salvas"
                ;;

            4)  # show screenshot in image viewer
                if [[ -n $themename ]];then
                    if [[ -r "$THEMEPATH/${themename}.jpg" ]]; then
                        img="$THEMEPATH/${themename}.jpg"
                    elif [[ -r "${THEMEPATH%/*}/${themename}.jpg" ]]; then
                        img="${THEMEPATH%/*}/${themename}.jpg"
                    else
                        echo "$0: No screenshot ${themename}.jpg found" >&2
                        continue
                    fi
                    $IMGCMD "$img" 2> /dev/null
                else
                    yad_prompt "Faça uma seleção" "$OK"
                fi
                ;;

            10) yad --center --window-icon="distributor-logo-bunsenlabs" --title="O gerenciador de temas BLOB" --fontname=Monospace --text-info --filename="/usr/share/doc/bl-obthemes/helpfile-blob.txt" --button="OK":0 --width="900" --height="700" 2> /dev/null

                Intro

# /usr/share/bunsen/docs/helpfiles/helpfile-blob.txt

                ;;

            *)  if (( RET == 252 ));then
                    echo "$0:  Exited with \"ESC\" key" >&2
                else
                    echo "$0:  Error= $RET" >&2
                fi
                exit 1
                ;;
        esac
    done
}

################### Fim das funções de restauração ##############################

function cleanup(){

    if [[ $1 = all ]];then
        if [[ -d $CONFIGDIR ]];then
            rm -rf "$CONFIGDIR"

            debug "\n  Excluída $CONFIGDIR"
        fi
        if [[ -d $CONFIGDIR_BKP ]];then

            mv "$CONFIGDIR_BKP" "$CONFIGDIR"

            debug "\n  Cancelada\n..Backup $CONFIGDIR restaurado.\n"

        fi

        rm -f /tmp/blob.*

    elif [[ $1 = save ]];then
        saveSettings
    fi

}

###################### FUNÇÕES FINAIS ###################################

# add this where an error should trigger a warning, optional exit:
#trap 'trap_error $LINENO "$BASH_COMMAND"' ERR
# to remove trap:
#trap - ERR

# check not running as root, test for openbox session startup file
# sets OBSESSION
firstChecks

# test for blobthemes config directory, create if it doesn't exist
mkdir -p "$USRCONFIGPATH"

# create file to hold most recent saved configuration name
if [[ ! -f $CURSESSFILE ]];then
    touch "$CURSESSFILE"
fi

# convert config filepaths in any existing user saved BLOBs to new scheme
# store conky and tint2 commands in session files
upgradeBlobs

Intro --one-view-only





exit 0

