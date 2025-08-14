// pengaduan.js
router.post('/', async (req, res) => {
  try {
    const { nama, no_hp, tanggal_pengaduan, jenis, deskripsi } = req.body;

    const pool = await db.poolPromise;
    await pool.request()
      .input('nama', db.sql.VarChar, nama)
      .input('no_hp', db.sql.VarChar, no_hp)
      .input('tanggal_pengaduan', db.sql.Date, tanggal_pengaduan)
      .input('jenis', db.sql.VarChar, jenis)
      .input('deskripsi', db.sql.Text, deskripsi)
      .query(`
        INSERT INTO PengaduanNasabah (nama, nohp, tgl, jenis, deskripsi)
        VALUES (@nama, @no_hp, @tanggal_pengaduan, @jenis, @deskripsi)
      `);

    res.json({ success: true, message: 'Pengaduan berhasil dikirim' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Terjadi kesalahan server' });
  }
});
