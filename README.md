# Termux X11 Build — Edisi IceWM

Instalasi desktop **IceWM** + **Termux-X11** di Termux melalui script interaktif.

- **Aktor:** Tarno
- **Branch:** `icewm`

## Instalasi

```bash
curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/icewm/setup.sh | bash
```

## Menu

| Opsi | Fungsi |
|------|--------|
| `[1]` | Install — update paket, pasang X11 + IceWM + aplikasi |
| `[2]` | Config — setup dotfiles IceWM, menu, toolbar, shortcut, mimeapps |
| `[3]` | Remove — hapus semua paket X11 + config |
| `[4]` | Help — panduan gestur, pintasan, dan daftar paket |
| `[*]` | Exit |

## Paket yang dipasang

`termux-x11-nightly`, `icewm`, `st`, `pcmanfm`, `firefox`, `mousepad`,
`ristretto`, `parole`, `lxtask`, `xvkbd`, `pulseaudio`, `ffmpeg`

## Cara pakai

```bash
# 1. Jalankan setup
bash setup.sh

# 2. Pilih [1] Install, lalu [2] Config

# 3. Jalankan desktop
desk
```

- **Display:** `:0`
- **Audio:** `pulseaudio --start` (otomatis dijalankan oleh `desk`)

### Aplikasi

| Aplikasi | Fungsi |
|----------|--------|
| ST | Terminal |
| Firefox | Browser |
| PCManFM | File Manager |
| Mousepad | Text Editor |
| Ristretto | Image Viewer |
| Parole | Media Player |
| LXTask | Task Manager |
| XVKBD | Virtual Keyboard |

### Pintasan tombol

| Tombol | Fungsi |
|--------|--------|
| `Alt+Ctrl+t` | Terminal |
| `Alt+Ctrl+x` | Firefox |
| `Alt+Ctrl+k` | Task Manager |

## Uninstall

Jalankan script lagi lalu pilih `[3] Remove`.

## Lisensi

Lihat [LICENSE](LICENSE).
