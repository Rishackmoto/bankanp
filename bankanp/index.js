const express = require('express');
const cors = require('cors');
const sql = require('mssql');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Koneksi SQL Server
const dbConfig = {
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  server: process.env.DB_SERVER, // contoh: '192.168.1.10'
  database: process.env.DB_NAME,
  options: {
    encrypt: true, // true kalau Azure / false kalau server lokal
    trustServerCertificate: true
  }
};

// Test koneksi database
sql.connect(dbConfig)
  .then(() => console.log('✅ Koneksi SQL Server berhasil'))
  .catch(err => console.error('❌ Koneksi gagal:', err));

// API root
app.get('/', (req, res) => {
  res.send('API AYAM is running...');
});

// API untuk simpan pengaduan
app.post('/pengaduan', async (req, res) => {
  const { nama, nohp, tgl, jenis, deskripsi } = req.body;

  if (!nama || !nohp || !tgl || !jenis || !deskripsi) {
    return res.status(400).json({ message: 'Semua field wajib diisi' });
  }

  try {
    const pool = await sql.connect(dbConfig);
    await pool.request()
      .input('nama', sql.NVarChar, nama)
      .input('nohp', sql.NVarChar, nohp)
      .input('tgl', sql.Date, tgl)
      .input('jenis', sql.NVarChar, jenis)
      .input('deskripsi', sql.NVarChar, deskripsi)
      .query(`
        INSERT INTO PengaduanNasabah (nama, nohp, tgl, jenis, deskripsi)
        VALUES (@nama, @nohp, @tgl, @jenis, @deskripsi)
      `);

    res.json({ message: 'Pengaduan berhasil disimpan' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Gagal simpan pengaduan', error: err.message });
  }
});

// Jalankan server
app.listen(port, () => {
  console.log(`🚀 Server berjalan di port ${port}`);
});
