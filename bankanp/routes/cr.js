const express = require('express');
const router = express.Router();
const { sql, poolPromise } = require('../db'); // sesuaikan dengan file koneksi kamu

// GET semua debitur monitoring
router.get('/', async (req, res) => {
    try {
        const pool = await poolPromise;
        const result = await pool.request().query('SELECT * FROM cr');
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.put('/:no', async (req, res) => {
    const { no } = req.params;
    const { dupd } = req.params;
    const { metode } = req.body;
    const { nama } = req.body;
    const { ad } = req.body;
    const { hasil } = req.body;
    const { janji } = req.body;
    const { ket } = req.body;
    const { nominal } = req.body;
    const { lampiran } = req.body;
    const { hp } = req.body;
    const { email } = req.body;
    const { kol } = req.body;
    const { slip } = req.body;


    try {
        const pool = await poolPromise;
        await pool.request()
            .input('no', sql.DateTime, nocr)
            .input('dupd', sql.DateTime, dupd)
            .input('metode', sql.VarChar, metode)
            .input('nama', sql.VarChar, metode)
            .input('ad', sql.VarChar, metode)
            .input('hasil', sql.VarChar, metode)
            .input('janji', sql.Date, metode)
            .input('ket', sql.VarChar, metode)
            .input('nominal', sql.Decimal, metode)
            .input('lampiran', sql.VarChar, metode)
            .input('hp', sql.VarChar, metode)
            .input('email', sql.VarChar, metode)
            .input('kol', sql.Numeric, metode)
            .input('slip', sql.VarChar, metode)
            .query('UPDATE cr SET dupd = @dupd,metode = @metode, nama = @nama,ad = @ad,hasil = @hasil,janji = @janji,ket = @ket,nominal = @nominal,lampiran = @lampiran,hp = @hp,email = @email,kol = @kol,slip = @slip,WHERE no = @nocr');

        res.status(200).json({ message: 'Data berhasil diupdate' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

router.delete('/:no', async (req, res) => {
    const { nocr } = req.params;

    try {
        const pool = await poolPromise;
        await pool.request()
            .input('no', sql.VarChar, nocr)
            .query('DELETE FROM cr WHERE no = @nocr');

        res.status(200).json({ message: 'Data berhasil dihapus' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


module.exports = router;
