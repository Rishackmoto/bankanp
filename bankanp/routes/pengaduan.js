const express = require('express');
const router = express.Router();
const db = require('../db');

router.post('/', async (req, res) => {
  try {
    const { nama, no_hp, tanggal_pengaduan, jenis, deskripsi } = req.body;
    await db.query(`
      INSERT INTO PengaduanNasabah (nama, no_hp, tanggal_pengaduan, jenis, deskripsi)
      VALUES (@nama, @no_hp, @tanggal_pengaduan, @jenis, @deskripsi)
    `, { nama, no_hp, tanggal_pengaduan, jenis, deskripsi });

    res.json({ success: true, message: 'Pengaduan berhasil dikirim' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Terjadi kesalahan server' });
  }
});

module.exports = router;
