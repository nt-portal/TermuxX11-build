# Melaporkan Masalah

Terima kasih sudah membantu memperbaiki **TermuxX11-build**!

## Sebelum Membuat Issue

1. Pastikan menggunakan versi terbaru (`git pull` atau unduh ulang script)
2. Cek [issue yang sudah ada](https://github.com/nt-portal/TermuxX11-build/issues) — mungkin sudah dilaporkan
3. Pastikan Termux dan Termux:X11 terinstall dari **F-Droid**, bukan Play Store

## Cara Melaporkan

Buka issue baru di [halaman Issues](https://github.com/nt-portal/TermuxX11-build/issues/new) dengan informasi berikut:

### 1. Judul yang Jelas

❌ `gak bisa`
✅ `[xfce] Desktop tidak muncul setelah jalankan desk`

Format judul: `[nama-branch] deskripsi singkat`

### 2. Isi Laporan

Sertakan informasi ini:

```
Branch    : (xfce / icewm / lain)
Perangkat : (misal: Samsung A14, Redmi Note 12)
Android   : (misal: Android 13)
Termux    : (jalankan `termux-info` lalu tempel hasilnya)

Langkah mengulang masalah:
1. ...
2. ...
3. ...

Yang diharapkan:
(apa yang seharusnya terjadi)

Yang terjadi:
(apa yang benar-benar terjadi)

Pesan error (jika ada):
(tempel pesan error lengkap)
```

### 3. Sertakan Log (Jika Ada)

Jalankan script dengan mode debug untuk menangkap error:

```bash
bash -x setup.sh 2>&1 | tee /tmp/debug.log
```

Lalu tempel isi `/tmp/debug.log` ke issue.

## Label Issue

| Label | Kegunaan |
|-------|----------|
| `bug` | Sesuatu yang rusak / tidak berfungsi |
| `enhancement` | Saran fitur atau peningkatan |
| `question` | Pertanyaan tentang cara pakai |
| `xfce` | Masalah khusus edisi XFCE |
| `icewm` | Masalah khusus edisi IceWM |
| `mate` | Masalah khusus edisi MATE |
| `lxqt` | Masalah khusus edisi LXQt |
| `openbox` | Masalah khusus edisi Openbox |
| `kde` | Masalah khusus edisi KDE Plasma |

## Yang Bukan Bug

- Masalah karena Termux dari **Play Store** (gunakan F-Droid)
- Masalah jaringan saat `pkg install` (coba `termux-change-repo`)
- Fitur yang memang belum ada (buat sebagai `enhancement`)

## Keamanan

Jika menemukan masalah keamanan, **jangan buat issue publik**. Hubungi langsung via [profil GitHub](https://github.com/nt-portal).
