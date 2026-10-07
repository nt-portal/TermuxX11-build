#!/data/data/com.termux/files/usr/bin/bash
set -u

SCRIPT_PATH="$0"
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

github_remote() {
  git -C "$(dirname "$SCRIPT_PATH")" remote get-url origin 2>/dev/null ||
    git remote get-url origin 2>/dev/null ||
    echo "https://github.com/nt-portal/TermuxX11-build.git"
}

pause() {
  read -r -p "[Enter] kembali ke menu" _
  echo
}

# ── Warna ──
R='\033[1;31'
G='\033[1;32'
Y='\033[1;33'
B='\033[1;34'
C='\033[1;36'
M='\033[1;35'
W='\033[1;37'
D='\033[0;90'
N='\033[0'

c() { printf "\033[${1}m"; }

separator() {
  echo -e "$(c "$D")───────────────────────────────────────────────────$(c "$N")"
}

X11_PACKAGES=(
  termux-x11-nightly
  icewm
  st
  pcmanfm
  firefox
  mousepad
  ristretto
  parole
  lxtask
  xvkbd
  pulseaudio
  ffmpeg
)

create_desk_launcher() {
  cat >"$PREFIX/bin/desk" <<'LAUNCHER'
#!/data/data/com.termux/files/usr/bin/bash
export DISPLAY=:0
export XDG_RUNTIME_DIR=$TMPDIR

pulseaudio --start >/dev/null 2>&1

if pgrep -f "termux-x11.*:0" >/dev/null; then
    icewm-session --replace &
    pcmanfm --desktop &
else
    termux-x11 :0 &
    sleep 2
    icewm-session &
    pcmanfm --desktop &
fi
LAUNCHER

  chmod +x "$PREFIX/bin/desk"
}

init_install() {
  pkg update -y && pkg upgrade -y &&
    pkg install tur-repo -y &&
    pkg install x11-repo -y &&
    pkg install -y "${X11_PACKAGES[@]}"

  create_desk_launcher
  echo -e "$(c "$G")  ✓ Selesai install$(c "$N")"
  pause
}

configure_icewm() {
  mkdir -p ~/.icewm
  mkdir -p ~/.config

  rm -f ~/.config/mimeapps.list
  rm -f "$PREFIX/share/icewm"/{keys,menu,preferences,programs,toolbar,winoptions}
  rm -f "$PREFIX/share/icewm"/icons/{emacs,gimp,java,kde,vim,xterm,xv,xload}_*.xpm

  ln -sf "$PREFIX/bin/st" "$PREFIX/bin/xterm"

  cat >~/.icewm/menu <<'EOF'
prog "Command Terminal" /data/data/com.termux/files/usr/share/icons/AdwaitaLegacy/48x48/legacy/utilities-terminal st
prog "Text Editor" org.xfce.mousepad mousepad
prog "Virtual Keyboard" input-keyboard xvkbd
prog "Firefox" firefox firefox
prog "File Explorer" gtk3-widget-factory pcmanfm
prog "Task Manager" /data/data/com.termux/files/usr/share/icons/Adwaita/scalable/mimetypes/application-x-executable.svg lxtask
prog "Picture Viewer" /data/data/com.termux/files/usr/share/icons/Adwaita/scalable/mimetypes/image-x-generic ristretto
prog "Media Player" /data/data/com.termux/files/usr/share/icons/Adwaita/scalable/mimetypes/video-x-generic parole
EOF

  cat >~/.icewm/preferences <<'EOF'
TaskBarClockLeds=1
TaskBarShowNetStatus=0
TaskBarShowCPUStatus=0
EOF

  cat >~/.config/mimeapps.list <<'EOF'
[Default Applications]
x-scheme-handler/http=firefox.desktop
x-scheme-handler/https=firefox.desktop
x-scheme-handler/chrome=firefox.desktop
text/html=firefox.desktop
application/xhtml+xml=firefox.desktop
video/mp4=parole.desktop
video/x-ms-wmv=parole.desktop
video/x-matroska=parole.desktop
video/webm=parole.desktop
video/avi=parole.desktop
video/quicktime=parole.desktop
video/mpeg=parole.desktop
video/x-flv=parole.desktop
audio/mpeg=parole.desktop
audio/flac=parole.desktop
audio/ogg=parole.desktop
audio/wav=parole.desktop
audio/mp4=parole.desktop
audio/aac=parole.desktop
audio/x-m4a=parole.desktop
image/jpeg=ristretto.desktop
image/png=ristretto.desktop
image/gif=ristretto.desktop
image/webp=ristretto.desktop
image/bmp=ristretto.desktop
image/tiff=ristretto.desktop
image/svg+xml=ristretto.desktop
text/plain=mousepad.desktop
text/x-log=mousepad.desktop
text/x-python=mousepad.desktop
application/json=mousepad.desktop
application/xml=mousepad.desktop
inode/directory=pcmanfm.desktop

[Added Associations]
x-scheme-handler/http=firefox.desktop;
x-scheme-handler/https=firefox.desktop;
text/html=firefox.desktop;
video/mp4=parole.desktop;
audio/mpeg=parole.desktop;
image/jpeg=ristretto.desktop;
text/plain=mousepad.desktop;
inode/directory=pcmanfm.desktop;
EOF

  cat >~/.icewm/toolbar <<'EOF'
prog "Command Terminal" /data/data/com.termux/files/usr/share/icons/AdwaitaLegacy/48x48/legacy/utilities-terminal st
prog "Firefox" firefox firefox
prog "Virtual Keyboard" input-keyboard xvkbd
prog "Task Manager" /data/data/com.termux/files/usr/share/icons/Adwaita/scalable/mimetypes/application-x-executable.svg lxtask
EOF

  cat >~/.icewm/keys <<'EOF'
key "Alt+Ctrl+t" st
key "Alt+Ctrl+x" firefox
key "Alt+Ctrl+k" lxtask
key "Alt+Ctrl+T" st
key "Alt+Ctrl+X" firefox
key "Alt+Ctrl+K" lxtask
EOF

  echo -e "$(c "$G")  ✓ Selesai konfigurasi$(c "$N")"
  pause
}

remove_packages() {
  printf "Hapus semua paket X11? [y/N] "
  read -r answer
  case "$answer" in
  y | Y | ya | Ya) ;;
  *)
    echo "Dibatalkan"
    pause
    return
    ;;
  esac

  rm -f "$PREFIX/bin/desk"
  rm -f "$PREFIX/bin/xterm"
  rm -rf ~/.icewm
  pkg uninstall -y "${X11_PACKAGES[@]}" x11-repo tur-repo
  echo -e "$(c "$R")  ✓ Selesai remove$(c "$N")"
  pause
}

show_help() {
  local github
  github="$(github_remote)"

  echo -e "
$(separator)
$(c "$W")  Termux-X11 Config$(c "$N")
$(c "$D")  Aktor      : $(c "$Y")Tarno$(c "$N")
$(c "$D")  Mode GUI   : $(c "$C")icewm$(c "$N")
$(c "$D")  Github     : $(c "$C")$github$(c "$N")
$(separator)
$(c "$G")  Aplikasi:$(c "$N")
$(c "$D")  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─$(c "$N")
$(c "$Y")  ST              $(c "$D"):$(c "$N") Terminal
$(c "$Y")  Firefox         $(c "$D"):$(c "$N") Browser
$(c "$Y")  PCManFM         $(c "$D"):$(c "$N") File Manager
$(c "$Y")  Mousepad        $(c "$D"):$(c "$N") Text Editor
$(c "$Y")  Ristretto       $(c "$D"):$(c "$N") Image Viewer
$(c "$Y")  Parole          $(c "$D"):$(c "$N") Media Player
$(c "$Y")  LXTask          $(c "$D"):$(c "$N") Task Manager
$(c "$Y")  XVKBD           $(c "$D"):$(c "$N") Virtual Keyboard
$(separator)
$(c "$G")  Panduan Interaktif:$(c "$N")
$(c "$D")  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─$(c "$N")
$(c "$W")  Gerakan kursor      $(c "$D"):$(c "$N") usap satu jari
$(c "$W")  Klik kiri           $(c "$D"):$(c "$N") ketuk satu jari
$(c "$W")  Klik dua kali       $(c "$D"):$(c "$N") ketuk dua kali satu jari
$(c "$W")  Seret / Pilih       $(c "$D"):$(c "$N") tekan lama satu jari lalu usap
$(c "$W")  Menu klik kanan     $(c "$D"):$(c "$N") ketuk dua jari
$(c "$W")  Gulir halaman       $(c "$D"):$(c "$N") usap dua jari
$(c "$W")  Tampilkan keyboard  $(c "$D"):$(c "$N") gestur kembali
$(c "$W")  Keluar X11          $(c "$D"):$(c "$N") gestur layar utama
$(separator)
$(c "$G")  Pintasan Tombol:$(c "$N")
$(c "$D")  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─$(c "$N")
$(c "$Y")  Alt+Ctrl+t $(c "$D"):$(c "$N") Terminal
$(c "$Y")  Alt+Ctrl+x $(c "$D"):$(c "$N") Firefox
$(c "$Y")  Alt+Ctrl+k $(c "$D"):$(c "$N") Task Manager
$(separator)
$(c "$G")  Cara Pakai:$(c "$N")
$(c "$D")  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─$(c "$N")
$(c "$W")  Jalankan desktop $(c "$D"):$(c "$C") desk$(c "$N")
$(c "$W")  Display          $(c "$D"):$(c "$C") :0$(c "$N")
$(c "$W")  Audio            $(c "$D"):$(c "$C") pulseaudio --start$(c "$N")
$(separator)
$(c "$G")  Paket Terpasang:$(c "$N")
$(c "$D")  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─$(c "$N")
$(c "$C")  termux-x11-nightly  icewm  st  pcmanfm
  firefox  mousepad  ristretto  parole
  lxtask  xvkbd  pulseaudio  ffmpeg$(c "$N")
$(separator)"

  pause
}

print_banner() {
  clear
  echo -e "
$(c "$C")  8b        d8      88      88
$(c "$C")   Y8,    ,8P     ,d88    ,d88
$(c "$B")    \`8b  d8'    888888  888888
$(c "$B")      Y88P          88      88
$(c "$M")      d88b          88      88
$(c "$M")    ,8P  Y8,        88      88
$(c "$R")   d8'    \`8b       88      88
$(c "$R")  8P        Y8      88      88$(c "$W")-configurations$(c "$N")
$(c "$D")  Aktor: $(c "$Y")Tarno$(c "$D") | $(c "$C")$(github_remote)$(c "$N")
$(separator)
$(c "$G")  [1]$(c "$W") Install
$(c "$C")  [2]$(c "$W") Config
$(c "$R")  [3]$(c "$W") Remove
$(c "$Y")  [4]$(c "$W") Help
$(c "$D")  [*]$(c "$W") Exit$(c "$N")
$(separator)"
}

main() {
  while true; do
    print_banner
    read -s -n1 key
    echo

    case "$key" in
    1)
      clear
      init_install
      ;;
    2)
      clear
      configure_icewm
      ;;
    3)
      clear
      remove_packages
      ;;
    4)
      clear
      show_help
      ;;
    *) exit 0 ;;
    esac
  done
}

main "$@"
