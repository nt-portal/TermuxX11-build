#!/data/data/com.termux/files/usr/bin/bash
set -u

SCRIPT_PATH="$0"
PREFIX="${PREFIX:-/data/data/com.termux/files/usr/bin}"

github_remote() {
  git -C "$(dirname "$SCRIPT_PATH")" remote get-url origin 2>/dev/null ||
    git remote get-url origin 2>/dev/null ||
    echo "https://github.com/nt-portal/TermuxX11-build.git"
}

pause() {
  read -r -p "[Enter] kembali ke menu" _ </dev/tty
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
  plasma
  breeze
  kdeplasma-addons
  plasma-nm
  plasma-pa
  plasma-systemmonitor
  plasma-browser-integration
  powerdevil
  plasma-workspace-wallpapers
  kaccounts-integration
  kpipewire
  qqc2-breeze-style
  dbus
  polkit
  polkit-qt6
  xdg-utils
  dolphin
  konsole
  ark
  gwenview
  spectacle
  kate
  filelight
  okular
  pulseaudio
  ffmpeg
  termux-api
  neovim
)

create_desk_launcher() {
  cat >"$PREFIX/bin/desk" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
export DISPLAY=:1
export XDG_RUNTIME_DIR=$TMPDIR
export XDG_CURRENT_DESKTOP=KDE
export XDG_SESSION_DESKTOP=KDE
export KDE_FULL_SESSION=true
export QT_QPA_PLATFORM=xcb

pulseaudio --start >/dev/null 2>&1

termux-x11 :1 \
    -xstartup "dbus-launch --exit-with-session startplasma-x11"
EOF

  chmod +x "$PREFIX/bin/desk"
}

init_install() {
  pkg update -y && pkg upgrade -y &&
    pkg install x11-repo -y &&
    pkg install -y "${X11_PACKAGES[@]}"

  create_desk_launcher
  echo -e "$(c "$G")  ✓ Selesai install$(c "$N")"
  pause
}

remove_packages() {
  printf "Hapus semua paket X11? [y/N] "
  read -r answer </dev/tty
  case "$answer" in
  y | Y | ya | Ya) ;;
  *)
    echo "Dibatalkan"
    pause
    return
    ;;
  esac

  rm -f "$PREFIX/bin/desk"
  pkg uninstall -y "${X11_PACKAGES[@]}" x11-repo termux-x11-nightly
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
$(c "$D")  Mode GUI   : $(c "$C")kde plasma$(c "$N")
$(c "$D")  Github     : $(c "$C")$github$(c "$N")
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
$(c "$Y")  Alt+Ctrl+t $(c "$D"):$(c "$N") Terminal (Konsole)
$(c "$Y")  Alt+Ctrl+x $(c "$D"):$(c "$N") Firefox (jika terpasang)
$(c "$Y")  Alt+Ctrl+k $(c "$D"):$(c "$N") Task Manager (KDE System Monitor)
$(separator)
$(c "$G")  Cara Pakai:$(c "$N")
$(c "$D")  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─$(c "$N")
$(c "$W")  Jalankan desktop $(c "$D"):$(c "$C") desk$(c "$N")
$(c "$W")  Display          $(c "$D"):$(c "$C") :1$(c "$N")
$(c "$W")  Audio            $(c "$D"):$(c "$C") pulseaudio --start$(c "$N")
$(separator)
$(c "$G")  Paket Terpasang:$(c "$N")
$(c "$D")  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─$(c "$N")
$(c "$C")  termux-x11-nightly  plasma  breeze  kdeplasma-addons
  plasma-nm  plasma-pa  plasma-systemmonitor  powerdevil
  dolphin  konsole  ark  gwenview  spectacle  kate
  filelight  okular  dbus  pulseaudio  ffmpeg  neovim$(c "$N")
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
$(c "$R")  [2]$(c "$W") Remove
$(c "$Y")  [3]$(c "$W") Help
$(c "$D")  [*]$(c "$W") Exit$(c "$N")
$(separator)"
}

main() {
  while true; do
    print_banner
    read -s -n1 key </dev/tty
    echo

    case "$key" in
    1)
      clear
      init_install
      ;;
    2)
      clear
      remove_packages
      ;;
    3)
      clear
      show_help
      ;;
    *) exit 0 ;;
    esac
  done
}

main "$@"
