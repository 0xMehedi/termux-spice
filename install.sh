#!/data/data/com.termux/files/usr/bin/bash

########################################################################
# "Termux Spice" Install Script
# Execute install.sh
#
# Copyright (C) 2022 Mehedi Hasan
#
# Authors: Mehedi Hasan <0xmehedi@tutanota.com>
#
# Webpage: https://github.com/0xMehedi/termux-spice
#
# Any questions, comments, or bug reports may be sent to
# above email address. Enjoy "Termux Spice"!
#
# License: MIT License
########################################################################

# Intro

printf '\n%s\n' "© 2022 Mehedi Hasan"
printf '%s\n' "https://github.com/0xMehedi"
printf '%s\n' "Spice Up Termux, Anytime!"

# Storage Permission

printf '\n%s\n' "Grant Storage Permission if Asked"
termux-setup-storage
sleep 5

# Packages

printf '\n%s\n' "→ Updating & Upgrading Pre-installed Packages"
pkg update -y && pkg upgrade -y

printf '\n%s\n' "→ Installing Selected Packages"
pkg install -y ffmpeg git gnupg man nano neofetch openssh openssh-sftp-server python tree
sleep 1

# Clone Repositiry

printf '\n%s\n' "→ Cloning Termux Spice Repo"
git clone https://github.com/0xMehedi/termux-spice.git "${HOME}/termux-spice"

# yt-dlp

printf '\n%s\n' "→ Upgrading setuptools"
pip install --upgrade setuptools

printf '\n%s\n' "→ Installing yt-dlp"
pip install yt-dlp
sleep 1

# yt-dlp Config

printf '\n%s\n' "→ Creating Blank yt-dlp config File"
mv "${HOME}/.config/yt-dlp/config" "${HOME}/.config/yt-dlp/config.bak"
mkdir -p "${HOME}/.config/yt-dlp"
touch "${HOME}/.config/yt-dlp/config"
sleep 1

# termux-url-opener Handle

printf '\n%s\n' "→ Setting Up Termux URL Opener"
mv "${HOME}/bin/termux-url-opener" "${HOME}/bin/termux-url-opener.bak"
mkdir -p "${HOME}/bin"
cp "${HOME}/termux-spice/home/bin/termux-url-opener" "${HOME}/bin"
sleep 1

# .netrc File

printf '\n%s\n' "→ Creating .netrc"
touch "${HOME}/.netrc"
chmod a-rwx,u+rw "${HOME}/.netrc"
sleep 1

# nano Config

printf '\n%s\n' "→ Configuring nano"
mkdir -p "${HOME}/.config/nano"
touch "${HOME}/.config/nano/nanorc"
{
  printf '%s\n' "set autoindent"
  printf '%s\n' "set linenumbers"
  printf '%s\n' "set locking"
  printf '%s\n' "set tabsize 2"
  printf '%s\n' "set tabstospaces"
} > "${HOME}/.config/nano/nanorc"
sleep 1

# Oh My Bash

printf '\n%s\n' "→ Installing Oh My Bash"
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash
mv "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
cp "${HOME}/.oh-my-bash/templates/bashrc.osh-template" "${HOME}/.bashrc"
sleep 1

printf '\n%s\n' "→ Changing Oh My Bash Theme"
sed -i '/^OSH_THEME/d' "${HOME}/.bashrc"
sed -i '6iOSH_THEME="sexy"' "${HOME}/.bashrc"
sleep 1

# Restart

printf '\n%s\n' "✔ Done."
printf '%s\n' "Please Restart Termux App."
printf '%s\n' "Thank You!"

exit
