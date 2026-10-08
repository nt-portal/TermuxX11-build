# Termux X11 Build — Edisi MATE

Instalasi desktop **MATE** + **Termux-X11** di Termux melalui script interaktif.

- **Aktor:** Tarno
- **Branch:** `mate`

## Instalasi

Via curl (langsung jalankan):

```bash
curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/mate/setup.sh | bash
```

Via clone (lokal):

```bash
git clone -b mate https://github.com/nt-portal/TermuxX11-build.git
cd TermuxX11-build
bash setup.sh
```

## Menu

| Opsi | Fungsi |
|------|--------|
| `[1]` | Install — update paket, pasang X11 + MATE, buat launcher `desk` |
| `[2]` | Remove — hapus semua paket X11 + launcher `desk` |
| `[3]` | Help — panduan gestur, pintasan, dan daftar paket |
| `[*]` | Exit |

## Paket yang dipasang

`termux-x11-nightly`, `mate-desktop-environment`, `dbus`, `pulseaudio`,
`pavucontrol`, `ffmpeg`, `termux-api`, `neovim`

## Cara pakai

```bash
desk        # jalankan desktop MATE
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

Jalankan script lagi lalu pilih `[2] Remove`.

## Lisensi

Lihat [LICENSE](LICENSE).
