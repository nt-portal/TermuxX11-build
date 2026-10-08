<div align="center">

# TermuxX11-build

**Desktop environment installer untuk Termux via script interaktif.**

[![License](https://img.shields.io/github/license/nt-portal/TermuxX11-build?style=for-the-badge&logo=gnu&logoColor=white&color=blue)](LICENSE)
[![Stars](https://img.shields.io/github/stars/nt-portal/TermuxX11-build?style=for-the-badge&logo=github&logoColor=white&color=gold)](https://github.com/nt-portal/TermuxX11-build/stargazers)
[![Forks](https://img.shields.io/github/forks/nt-portal/TermuxX11-build?style=for-the-badge&logo=git&logoColor=white&color=green)](https://github.com/nt-portal/TermuxX11-build/network)
[![Issues](https://img.shields.io/github/issues/nt-portal/TermuxX11-build?style=for-the-badge&logo=github&logoColor=white&color=red)](https://github.com/nt-portal/TermuxX11-build/issues)
[![Last Commit](https://img.shields.io/github/last-commit/nt-portal/TermuxX11-build?style=for-the-badge&logo=git&logoColor=white&color=purple)](https://github.com/nt-portal/TermuxX11-build/commits)

[![Bash](https://img.shields.io/badge/BASH-SCRIPT-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](setup.sh)
[![Termux](https://img.shields.io/badge/TERMUX-ANDROID-black?style=for-the-badge&logo=android&logoColor=3DDC84)](https://termux.dev)
[![XFCE](https://img.shields.io/badge/XFCE-DESKTOP-2284F2?style=for-the-badge&logo=xfce&logoColor=white)](https://xfce.org)
[![IceWM](https://img.shields.io/badge/ICEWM-DESKTOP-888888?style=for-the-badge&logo=linux&logoColor=white)](https://ice-wm.org)
[![MATE](https://img.shields.io/badge/MATE-DESKTOP-87A96B?style=for-the-badge&logo=linux&logoColor=white)](https://mate-desktop.org)
[![LXQt](https://img.shields.io/badge/LXQT-DESKTOP-006699?style=for-the-badge&logo=lxqt&logoColor=white)](https://lxqt-project.org)
[![Openbox](https://img.shields.io/badge/OPENBOX-WM-333333?style=for-the-badge&logo=linux&logoColor=white)](http://openbox.org)
[![KDE](https://img.shields.io/badge/KDE-PLASMA-1D99F3?style=for-the-badge&logo=kde&logoColor=white)](https://kde.org)
[![Maintained](https://img.shields.io/badge/MAINTAINED-YES-brightgreen?style=for-the-badge&logo=checkmarx&logoColor=white)](https://github.com/nt-portal/TermuxX11-build)

</div>

---

## Apa ini?

**TermuxX11-build** adalah kumpulan script bash yang mengotomasi instalasi desktop environment di [Termux](https://termux.dev) menggunakan [Termux-X11](https://github.com/nicetomeetyou/termux-x11). Cukup jalankan satu perintah — pilih menu — desktop siap pakai.

Setiap edisi desktop environment disimpan di **branch terpisah**. Branch `main` hanya berisi dokumentasi.

## Edisi Tersedia

| Branch | Desktop | Status | Install |
|--------|---------|--------|---------|
| [`xfce`](https://github.com/nt-portal/TermuxX11-build/tree/xfce) | XFCE4 | ✅ Aktif | `curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/xfce/setup.sh \| bash` |
| [`icewm`](https://github.com/nt-portal/TermuxX11-build/tree/icewm) | IceWM | ✅ Aktif | `curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/icewm/setup.sh \| bash` |
| [`mate`](https://github.com/nt-portal/TermuxX11-build/tree/mate) | MATE | ✅ Aktif | `curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/mate/setup.sh \| bash` |
| [`lxqt`](https://github.com/nt-portal/TermuxX11-build/tree/lxqt) | LXQt | ✅ Aktif | `curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/lxqt/setup.sh \| bash` |
| [`openbox`](https://github.com/nt-portal/TermuxX11-build/tree/openbox) | Openbox WM | ✅ Aktif | `curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/openbox/setup.sh \| bash` |
| [`kde`](https://github.com/nt-portal/TermuxX11-build/tree/kde) | KDE Plasma | ✅ Aktif | `curl -sL https://raw.githubusercontent.com/nt-portal/TermuxX11-build/kde/setup.sh \| bash` |

> Edisi lain bisa ditambahkan di branch baru (nama branch = nama desktop).

## Cara Install

1. Buka **Termux**
2. Jalankan perintah sesuai edisi yang dipilih (lihat tabel di atas)
3. Pilih `[1] Install` dari menu interaktif
4. Selesai — jalankan desktop dengan perintah `desk`

## Fitur

- 🎨 Menu interaktif berwarna di terminal
- 📦 Install & uninstall otomatis satu klik
- 🖥️ Launcher `desk` untuk menjalankan desktop
- 🔊 PulseAudio otomatis
- 📖 Panduan gestur & pintasan built-in (`[3] Help`)

## Prasyarat

- [Termux](https://f-droid.org/en/packages/com.termux/) (F-Droid)
- [Termux:X11](https://github.com/nicetomeetyou/termux-x11/releases) (APK)
- [Termux:API](https://f-droid.org/en/packages/com.termux.api/) (opsional)

## Struktur Branch

```
main        ← dokumentasi saja (README, LICENSE, CONTRIBUTING, ISSUE)
├── xfce    ← edisi XFCE4
├── icewm   ← edisi IceWM
├── mate    ← edisi MATE Desktop
├── lxqt    ← edisi LXQt Desktop
├── openbox ← edisi Openbox WM
├── kde     ← edisi KDE Plasma
└── ...     ← edisi lain
```

## Kontribusi

Kontribusi sangat diterima! Baca [CONTRIBUTING.md](CONTRIBUTING.md) untuk panduan lengkap.

**Penting:** Branch `main` hanya dokumentasi dan dikelola oleh admin repository saja. Semua kontribusi kode harus ditujukan ke branch edisi yang sesuai (misal `xfce`, `icewm`, `mate`, `lxqt`, `openbox`, `kde`).

## Melaporkan Masalah

Temukan bug atau ada saran? Baca [ISSUE.md](ISSUE.md) untuk panduan melaporkan masalah.

## Kontributor
Terima kasih kepada semua yang telah berkontributor pada TermuxX11-build.

<a href="https://github.com/nt-portal/TermuxX11-build/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=nt-portal/TermuxX11-build" />
</a>

## Lisensi

[GNU General Public License v3.0](LICENSE)
