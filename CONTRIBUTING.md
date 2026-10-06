# Panduan Kontribusi

Terima kasih sudah tertarik berkontribusi ke **TermuxX11-build**!

## Aturan Branch

> **Branch `main` hanya untuk dokumentasi** (`*.md`, `LICENSE`) dan **hanya admin repository** yang boleh push ke sini.
> Semua kode (`setup.sh`, dll) ada di branch edisi masing-masing.

| Tujuan | Target Branch | Akses |
|--------|---------------|-------|
| Dokumentasi (`*.md`, `LICENSE`) | `main` | Admin saja |
| Perbaiki/tambah fitur XFCE | `xfce` | Kontributor |
| Tambah edisi baru | branch baru (nama desktop, misal `kde`, `lxqt`) | Kontributor |

**Jangan pernah push kode (`.sh`, `.py`, dll) ke `main`.**
**Jangan push langsung ke `main` — hanya admin repository.**

## Penamaan Branch

Nama branch **harus** menggunakan nama desktop environment-nya.

✅ Benar: `xfce`, `kde`, `lxqt`, `mate`, `cinnamon`, `i3`
❌ Salah: `fix-bug`, `dev`, `test`, `feature-audio`, `v2`

```bash
# Contoh: tambah edisi KDE
git checkout -b kde
```

## Cara Berkontribusi

### 1. Fork & Clone

```bash
git clone https://github.com/<username>/TermuxX11-build.git
cd TermuxX11-build
```

### 2. Checkout Branch yang Tepat

```bash
# Contoh: kontribusi ke edisi xfce
git checkout xfce
```

### 3. Lakukan Perubahan

- Ikuti gaya kode yang sudah ada (bash, `set -u`, indent 2 spasi)
- Pastikan script berjalan di Termux
- Test manual sebelum push

### 4. Commit & Push

```bash
git add .
git commit -m "fix: perbaiki autostart pulseaudio"
git push origin xfce
```

### 5. Buat Pull Request

- **Base branch:** pilih branch edisi yang sesuai (misal `xfce`), **bukan** `main`
- Jelaskan apa yang diubah dan kenapa
- Sertakan screenshot jika ada perubahan tampilan

## Format Commit

```
tipe: deskripsi singkat

Contoh:
feat: tambah opsi resolusi layar
fix: perbaiki deteksi pulseaudio
docs: update panduan gestur
style: rapihkan warna menu
```

## Yang Tidak Diterima

- PR langsung ke `main` yang berisi kode
- Perubahan yang belum ditest di Termux
- Penambahan dependensi besar tanpa diskusi di issue dulu

## Pertanyaan?

Buka [issue](https://github.com/nt-portal/TermuxX11-build/issues) untuk diskusi.
