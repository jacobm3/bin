#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

# fix broken hardware crypto acceleration in virtualbox+wsl
#sudo mkdir -p /etc/gcrypt
#echo all | sudo tee /etc/gcrypt/hwf.deny

# add hashi stuff
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository -y "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install -y nmap bzip2 netcat net-tools git htop sysstat iotop vim-nox python3-pip jq

sudo apt-get install -y terraform vault

# Install Docker CE
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
echo '#'
echo '#'
echo '#'
echo '# YOU MUST REBOOT FOR THE DOCKER-CE IPTABLES CHANGE TO TAKE EFFECT!!!
echo '#'
echo '#'
echo '#'

sudo usermod -G docker -a ubuntu

#sudo apt-get upgrade -y

# Install Astronomer CLI
curl -sSL install.astronomer.io | sudo bash -s

# Install k3s 
#curl -sfL https://get.k3s.io | sh -



# add environment
cd /home/$USER/gbin && sudo cp pg ng /usr/local/bin

cd /home/$USER && mkdir -p .vim/colors 
cat > .vim/colors/jacobm3.vim <<EOF
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "jacobm3"
hi Normal ctermbg=Black ctermfg=LightGrey
hi ErrorMsg             term=standout   ctermbg=DarkRed ctermfg=White
hi IncSearch            term=reverse            cterm=bold
hi ModeMsg                      term=bold                       cterm=bold
hi StatusLine   term=bold                       cterm=bold
hi StatusLineNC term=bold                       cterm=bold
hi VertSplit            term=bold                       cterm=bold
hi Visual                       term=bold                       cterm=reverse
hi VisualNOS            term=underline,bold cterm=underline,bold
hi DiffText             term=reverse cterm=bold ctermbg=grey
hi Directory            term=bold ctermfg=cyan
hi LineNr                       term=underline ctermfg=darkgrey
hi MoreMsg                      term=bold ctermfg=LightGreen
hi NonText                      term=bold ctermfg=darkgrey
hi Question             term=standout ctermfg=LightGreen
hi Search                       term=reverse ctermbg=Yellow ctermfg=Black
hi SpecialKey   term=bold ctermfg=grey
hi Title                                term=bold ctermfg=darkGreen
hi WarningMsg   term=standout ctermfg=grey
hi WildMenu                     term=standout ctermbg=Yellow ctermfg=Black
hi Folded                       term=standout ctermbg=LightGrey ctermfg=grey
hi FoldColumn   term=standout ctermbg=LightGrey ctermfg=grey
hi DiffAdd                      term=bold ctermbg=grey
hi DiffChange   term=bold ctermbg=cyan
hi DiffDelete   term=bold ctermfg=grey ctermbg=cyan
hi Comment                      ctermfg=darkgrey
hi String                               ctermfg=grey
hi Statement            ctermfg=blue
hi Keyword              ctermfg=blue
hi PreCondit            ctermfg=blue
hi Function             ctermfg=grey
hi Constant             term=underline ctermfg=grey
hi Special                      term=bold ctermfg=grey
if &t_Co > 8
  hi Statement  term=bold cterm=bold ctermfg=grey
endif
hi Ignore                       ctermfg=LightGrey
EOF

cat > /home/$USER/.vimrc <<EOF
set number
set ts=4
set autoindent
set expandtab
set tabstop=4
set sw=4
colorscheme jacobm3
syntax on
EOF

sudo mkdir -p /root/.vim/colors 
sudo cp /home/$USER/.vim/colors/jacobm3.vim /root/.vim/colors
sudo cp /home/$USER/.vimrc /root
echo ". /home/$USER/gbin/jacobrc" | sudo tee /root/.bashrc

