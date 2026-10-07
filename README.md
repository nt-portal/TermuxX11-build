# Termux X11 Build — Edisi XFCE

Instalasi desktop **XFCE4** + **Termux-X11** di Termux melalui script interaktif.

- **Aktor:** Tarno
- **Branch:** `xfce`

## Instalasi

Via curl (langsung jalankan):

```bash
curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/xfce/setup.sh | bash
```

Via clone (lokal):

```bash
git clone -b xfce https://github.com/nt-portal/TermuxX11-build.git
cd TermuxX11-build
bash setup.sh
```

## Menu

| Opsi | Fungsi |
|------|--------|
| `[1]` | Install — update paket, pasang X11 + XFCE, buat launcher `desk` |
| `[2]` | Remove — hapus semua paket X11 + launcher `desk` |
| `[3]` | Help — panduan gestur, pintasan, dan daftar paket |
| `[*]` | Exit |

## Paket yang dipasang

`termux-x11-nightly`, `xfce4`, `xfce4-goodies`, `dbus`, `pulseaudio`,
`pavucontrol`, `ffmpeg`, `thunar`, `thunar-archive-plugin`, `file-roller`,
`xarchiver`, `ristretto`, `parole`, `mousepad`, `lxtask`, `xfce4-terminal`,
`xfce4-notifyd`, `xfce4-pulseaudio-plugin`, `xfce4-whiskermenu-plugin`,
`xfce4-taskmanager`, `gvfs`, `termux-api`, `neovim`

## Cara pakai

```bash
desk        # jalankan desktop XFCE
```

- **Display:** `:1`
- **Audio:** `pulseaudio --start` (otomatis dijalankan oleh `desk`)

### Panduan gestur

| Aksi | Gestur |
|------|--------|
| Gerakan kursor | usap satu jari |
| Klik kiri | ketuk satu jari |
| Klik dua kali | ketuk dua kali satu jari |
| Seret / Pilih | tekan lama satu jari lalu usap |
| Menu klik kanan | ketuk dua jari |
| Gulir halaman | usap dua jari |
| Tampilkan keyboard | gestur kembali |
| Keluar X11 | gestur layar utama |

### Pintasan tombol

| Tombol | Fungsi |
|--------|--------|
| `Alt+Ctrl+t` | Terminal |
| `Alt+Ctrl+x` | Firefox (jika terpasang) |
| `Alt+Ctrl+k` | Task Manager |

## Uninstall

Jalankan script lagi lalu pilih `[2] Remove`, atau hapus manual:

```bash
rm -f $PREFIX/bin/desk
pkg uninstall -y xfce4 xfce4-goodies termux-x11-nightly x11-repo
```

## Lisensi

Lihat [LICENSE](LICENSE).
