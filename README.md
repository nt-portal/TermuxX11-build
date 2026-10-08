# Termux X11 Build — Edisi KDE Plasma

Instalasi desktop **KDE Plasma** + **Termux-X11** di Termux melalui script interaktif.

- **Aktor:** Tarno
- **Branch:** `kde`

## Instalasi

Via curl (langsung jalankan):

```bash
curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/kde/setup.sh | bash
```

Via clone (lokal):

```bash
git clone -b kde https://github.com/nt-portal/TermuxX11-build.git
cd TermuxX11-build
bash setup.sh
```

## Menu

| Opsi | Fungsi |
|------|--------|
| `[1]` | Install — update paket, pasang X11 + KDE Plasma + aplikasi KDE |
| `[2]` | Remove — hapus semua paket X11 + launcher `desk` |
| `[3]` | Help — panduan gestur, pintasan, dan daftar paket |
| `[*]` | Exit |

## Paket yang dipasang

`termux-x11-nightly`, `plasma`, `breeze`, `kdeplasma-addons`, `plasma-nm`, `plasma-pa`,
`plasma-systemmonitor`, `plasma-browser-integration`, `powerdevil`, `plasma-workspace-wallpapers`,
`kaccounts-integration`, `kpipewire`, `qqc2-breeze-style`, `dbus`, `polkit`, `polkit-qt6`, `xdg-utils`,
`dolphin`, `konsole`, `ark`, `gwenview`, `spectacle`, `kate`, `filelight`, `okular`, `pulseaudio`, `ffmpeg`

## Cara pakai

```bash
desk        # jalankan desktop KDE Plasma
```

- **Display:** `:1`
- **Audio:** `pulseaudio --start` (otomatis dijalankan oleh `desk`)

### Aplikasi KDE

| Aplikasi | Fungsi |
|----------|--------|
| Konsole | Terminal |
| Dolphin | File Manager |
| Kate | Text Editor |
| Gwenview | Image Viewer |
| Spectacle | Screenshot Tool |
| Ark | Archive Manager |
| Okular | Document Viewer |
| Filelight | Disk Usage |

### Pintasan tombol

| Tombol | Fungsi |
|--------|--------|
| `Alt+Ctrl+t` | Konsole |
| `Alt+Ctrl+x` | Firefox (jika terpasang) |
| `Alt+Ctrl+k` | KDE System Monitor |

## Uninstall

Jalankan script lagi lalu pilih `[2] Remove`.

## Lisensi

Lihat [LICENSE](LICENSE).
