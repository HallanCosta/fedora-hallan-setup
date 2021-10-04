#! /bin/bash

pkexec bash -c "

dnf remove -y adwaita-qt5 totem epiphany evolution lohit-assamese-fonts lohit-bengali-fonts lohit-devanagari-fonts lohit-gujarati-fonts lohit-gurmukhi-fonts lohit-kannada-fonts lohit-malayalam-fonts lohit-marathi-fonts lohit-nepali-fonts lohit-odia-fonts lohit-tamil-classical-fonts lohit-tamil-fonts lohit-telugu-fonts google-noto-cjk-fonts-common google-noto-emoji-color-fonts google-noto-sans-cjk-ttc-fonts google-noto-sans-gurmukhi-fonts google-noto-sans-sinhala-vf-fonts bitstream-vera* paktype* java-11-openjdk java-11-openjdk-devel gnome-shell-extension-window-list gnome-shell-extension-places-menu gnome-shell-extension-background-logo &&

dnf install -y fedora-workstation-repositories https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&

dnf --enablerepo=updates-testing install xorg-x11-server-utils &&

dnf -y install dnf-plugins-core &&

dnf config-manager --set-enabled rpmfusion-free &&

dnf config-manager --set-enabled rpmfusion-free-updates &&

dnf config-manager --set-enabled rpmfusion-nonfree &&

dnf config-manager --set-enabled rpmfusion-nonfree-updates &&

dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo &&

rpm --import https://repo.vivaldi.com/archive/linux_signing_key.pub &&

wget -P /etc/yum.repos.d https://repo.vivaldi.com/archive/vivaldi-fedora.repo &&


# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash &&

source ~/.nvm/nvm.sh &&

nvm install v16 &&

dnf install -y gnome-shell-extension-dash-to-dock gnome-shell-extension-caffeine gnome-shell-extension-appindicator gnome-shell-extension-gsconnect gnome-shell-extension-no-overview rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data simplescreenrecorder yaru-theme gnome-extensions-app x264 x265 python python2 python3 make cmake automake autoconf gcc g++ adb procyon-decompiler gnupg hunspell-en wget git evince-nautilus nautilus-image-converter gvfs-mtp perl openssl npm nautilus-extensions docker-ce docker-ce-cli containerd.io gnome-tweaks luajit xset vivaldi-stable &&

dnf update -y &&

dnf clean packages &&

dnf autoremove -y &&

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

flatpak install -y flathub com.visualstudio.code &&

flatpak install -y flathub io.github.Figma_Linux.figma_linux &&

flatpak install -y flathub com.microsoft.Teams &&

flatpak install -y flathub org.gnome.gitlab.somas.Apostrophe &&

flatpak install -y --user https://flathub.org/repo/appstream/app.ytmdesktop.ytmdesktop.flatpakref &&

flatpak install flathub org.mozilla.Thunderbird &&

flatpak install flathub rest.insomnia.Insomnia &&

flatpak install flathub com.discordapp.Discord &&

flatpak install -y flathub com.bitwarden.desktop"

# Active Keyboard LED
sudo cp /etc/gdm/custom.conf /etc/gdm/custom-backup.conf &&
sudo sed "s/WaylandEnable=false/WaylandEnable=true/g" /etc/gdm/custom.conf && 
sudo mkdir -p /usr/share/keyboard-lights &&
sudo mkdir -p /usr/share/keyboard-lights/icons &&
sudo cp desktop/keyboard-lights/keyboard-lights.png /usr/share/keyboard-lights/icons &&
sudo cp desktop/keyboard-lights/keyboard-lights.desktop /usr/share/applications &&
sudo cp scripts/keyboard-lights /usr/bin &&
sudo chmod +x /usr/bin/keyboard-lights &&
sudo mkdir -p /home/hallancosta/.config/autostart/
sudo cp desktop/keyboard-lights/keyboard-lights.desktop /home/hallancosta/.config/autostart/
sudo sed "s/Exec=keyboard-lights/Exec=xset led 3/g" /home/hallancosta/.config/autostart/keyboard-lights.desktop && 

# Create Docker Desktop Icon
sudo mkdir -p /usr/share/docker && 
sudo mkdir -p /usr/share/docker/icons && 
sudo curl https://user-images.githubusercontent.com/60573155/135366543-253fd98f-76e9-4f4c-bcb8-b94ea72c16cc.png > docker.png &&
sudo mv docker.png /usr/share/docker/icons
sudo cat > docker.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=Docker
Comment=Atalho para inicar o Docker
Type=Application
Terminal=true
Exec=sudo systemctl enable docker.service
Icon=/usr/share/docker/icons/docker.png
StartupNotify=true
EOF
sudo mv docker.desktop /usr/share/applications/

# Add Theme macOS BigSur
sudo mkdir -p ~/.themes && 
sudo cp themes/WhiteSur-dark.tar.xz ~/.themes &&
sudo tar -xvf ~/.themes/WhiteSur-dark.tar.xz -C ~/.themes &&
sudo rm -rf ~/.themes/WhiteSur-dark.tar.xz && 

# Add Icons theme macOS BigSur
sudo mkdir -p ~/.icons && 
sudo cp icons/BigSur-Originals-Prime.tar.xz ~/.icons &&
sudo tar -xvf ~/.icons/BigSur-Originals-Prime.tar.xz -C ~/.icons &&
sudo rm -rf ~/.icons/BigSur-Originals-Prime.tar.xz && 

cd ~/.cache
mkdir wget
cd wget
wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansDevanagari-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifDevanagari-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansBengali-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifBengali-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansGujarati-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifGujarati-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansKannada-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifKannada-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansMalayalam-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifMalayalam-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansOriya-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansTamil-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifTamil-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansTelugu-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifTelugu-hinted.zip https://noto-website-2.storage.googleapis.com/pkgs/NotoSansGurmukhi-hinted.zip
unzip -o \*.zip
mkdir -p ~/.fonts
rsync -P --exclude=*UI-Regular* *Regular* ~/.fonts
cd ~/
rm -fr ~/.cache
gsettings set org.gnome.desktop.interface gtk-theme WhiteSur-dark
gsettings set org.gnome.desktop.sound theme-name Yaru
gsettings set org.gnome.desktop.interface icon-theme BigSur-Originals-Prime-dark
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu,close,minimize,maximize:"
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.shell enabled-extensions "['dash-to-dock@micxgx.gmail.com', 'appindicatorsupport@rgcjonas.gmail.com', 'no-overview@fthx', 'gsconnect@andyholmes.github.io']"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-overview'
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'DYNAMIC'
gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas true
gsettings set org.gnome.shell.extensions.dash-to-dock max-alpha 0.2
gsettings set org.gnome.shell.extensions.dash-to-dock min-alpha 0.15
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

# Muda tamanho da fonte - Scale 
gsettings set org.gnome.desktop.interface text-scaling-factor 0.95


/usr/bin/canberra-gtk-play --id="desktop-login" --description="GNOME Login"

sh -x xdg-open https://extensions.gnome.org/extension/2950/compiz-alike-windows-effect/ >&/tmp/errors

read -n1 -r -p "Instale e ative Wobbly Effect, pressione enter quando ativar" key

read -n1 -r -p "Instalações e Configurações finalizadas. Pressione enter para finalizar e reinicar o computador!!" key
