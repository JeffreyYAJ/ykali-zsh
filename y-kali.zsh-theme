#Author : JeffreyYAJ (https://github.com/JeffreyYAJ)

HOSTNAME=$(hostname)
length=$(echo -n "$HOSTNAME" | wc -c)

setopt PROMPT_SUBST
get_ip() {
  if [[ -n "$(ifconfig tun0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig tun0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ifconfig wlan0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig wlan0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}

shorten_path() {
  local path=$(pwd)
  local path_length=${#path}

  if (( path_length > 45 )); then
    echo "...${path: -40}" 
  else
    echo "$path"
  fi
}



if (( length < 15 )); then
  PROMPT=$'
┌─[%B%F{blue}'"${USER}"' '"${HOSTNAME}"'  $(shorten_path "$PWD")%f%b] [%F{green} $(get_ip)%f] $(git_prompt_info)
└─%B%F$%f%b '
else
  PROMPT=$'
┌─[%F{blue}'"${USER}"'  %~%f] [%F{green} $(get_ip)%f] $(git_prompt_info)
└─%B%F$%f%b '
fi

RPROMPT='%(?..'"${RED}Exit %?"')'

# Paste the rest in your .zshrc file 
# Make sure to have lolcat installed and adjust to as you wish

# # Reset #
# RESET_COLOR='\033[0m' # Text Reset

# # Regular Colors #
# Black='\033[0;30m'  Red='\033[0;31m'     Green='\033[0;32m'  Yellow='\033[0;33m'
# Blue='\033[0;34m'   Purple='\033[0;35m'  Cyan='\033[0;36m'   White='\033[0;37m'

# # Bold #
# BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
# BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

# # Underline #
# UBlack='\033[4;30m' URed='\033[4;31m'    UGreen='\033[4;32m' UYellow='\033[4;33m'
# UBlue='\033[4;34m'  UPurple='\033[4;35m' UCyan='\033[4;36m'  UWhite='\033[4;37m'

# # Background #
# On_Black='\033[40m' On_Red='\033[41m'    On_Green='\033[42m' On_Yellow='\033[43m'
# On_Blue='\033[44m'  On_Purple='\033[45m' On_Cyan='\033[46m'  On_White='\033[47m'

# # High Intensity #
# IBlack='\033[0;90m' IRed='\033[0;91m' IGreen='\033[0;92m' IYellow='\033[0;93m'
# IBlue='\033[0;94m' IPurple='\033[0;95m' ICyan='\033[0;96m' IWhite='\033[0;97m'

# # Bold High Intensity #
# BIBlack='\033[1;90m' BIRed='\033[1;91m' BIGreen='\033[1;92m' BIYellow='\033[1;93m'
# BIBlue='\033[1;94m' BIPurple='\033[1;95m' BICyan='\033[1;96m' BIWhite='\033[1;97m'

# # High Intensity backgrounds #
# On_IBlack='\033[0;100m' On_IRed='\033[0;101m' On_IGreen='\033[0;102m' On_IYellow='\033[0;103m'
# On_IBlue='\033[0;104m' On_IPurple='\033[0;105m' On_ICyan='\033[0;106m' On_IWhite='\033[0;107m'


# host=$(hostname)

# echo '   Welcome to Kali Linux'| lolcat
#  echo -e ${Blue} "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━┓"
#  echo -e ${Blue} "┃                                                                 ┃ ${Cyan}  ${BRed}${USER} on ${host} ${Blue}┃ ${BGreen}  ${BYellow}  ${Blue}┃"${RESET_COLOR}
#  echo -e ${Blue} "┃ ██╗ ██╗    ██╗ ██╗   █████╗  ██╗     ██╗       ██████╗ ███████╗ ┣━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━┫"${RESET_COLOR}
#  echo -e ${Blue} "┃████████╗   ██║██╔╝  ██╔══██╗ ██║     ██║      ██╔═══██╗██╔════╝ ┃                             ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃╚██╔═██╔╝   ████╔╝   ███████║ ██║     ██║      ██║   ██║███████╗ ┃ ${Cyan}  ${Blue}@author : ${BIGreen}YAJ     ${Blue}       ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃████████╗   ██║██╗   ██╔══██║ ██║     ██║      ██║   ██║╚════██║ ┃ ${Cyan}  ${Blue}Developed by : ${BIGreen}YAJ       ${Blue}┃"${RESET_COLOR}
#  echo -e ${Blue} "┃╚██╔═██╔╝   ██║ ███╗ ██║  ██║ ██████╗ ██║      ╚██████╔╝███████║ ┃ ${Cyan}  ${Blue}GitHub : ${BIGreen}@JeffreyYAJ    ${Blue} ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃ ╚═╝ ╚═╝    ╚═╝ ╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝       ╚═════╝ ╚══════╝ ┃                             ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃                                                                 ┃                             ┃"${RESET_COLOR}
#  echo -e ${Blue} "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"${RESET_COLOR}

#  echo -e "   Welcome back ${BIGreen}Master.${USER} ${RESET_COLOR}\n" | lolcat
