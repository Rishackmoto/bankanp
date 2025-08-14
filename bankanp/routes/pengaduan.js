// routes/pengaduan.js
const express = require('express');
const router = express.Router(); // <-- ini wajib
const { poolPromise, sql } = require('../db'); // koneksi db

router.post('/', async (req, res) => { // <-- sekarang route-nya '/'
  try {
    const { nama, nohp, tgl, jenis, deskripsi } = req.body;

    const pool = await poolPromise;
    await pool.request()
      .input('nama', sql.VarChar, nama)
      .input('nohp', sql.VarChar, nohp)
      .input('tgl', sql.Date, tgl)
      .input('jenis', sql.VarChar, jenis)
      .input('deskripsi', sql.VarChar, deskripsi)
      .query(`
        INSERT INTO PengaduanNasabah (nama, nohp, tgl, jenis, deskripsi)
        VALUES (@nama, @nohp, @tgl, @jenis, @deskripsi)
      `);

    res.json({ success: true, message: 'Pengaduan berhasil dikirim' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Terjadi kesalahan server' });
  }
});

module.exports = router;
