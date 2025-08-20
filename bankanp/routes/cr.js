const express = require('express');
const router = express.Router();
const { sql, poolPromise } = require('../db'); // koneksi

// GET semua data
router.get('/', async (req, res) => {
    try {
        const pool = await poolPromise;
        const result = await pool.request().query('SELECT * FROM cr');
        res.json(result.recordset);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// UPDATE data
router.put('/:no', async (req, res) => {
    const { no } = req.params;
    const { dupd, metode, nama, ad, hasil, janji, ket, nominal, lampiran, hp, email, kol, slip } = req.body;

    try {
        const pool = await poolPromise;
        await pool.request()
            .input('no', sql.VarChar, no)
            .input('dupd', sql.DateTime, dupd)
            .input('metode', sql.VarChar, metode)
            .input('nama', sql.VarChar, nama)
            .input('ad', sql.VarChar, ad)
            .input('hasil', sql.VarChar, hasil)
            .input('janji', sql.Date, janji)
            .input('ket', sql.VarChar, ket)
            .input('nominal', sql.Decimal(18,2), nominal)
            .input('lampiran', sql.VarChar, lampiran)
            .input('hp', sql.VarChar, hp)
            .input('email', sql.VarChar, email)
            .input('kol', sql.Int, kol)
            .input('slip', sql.VarChar, slip)
            .query(`
                UPDATE cr 
                SET dupd = @dupd,
                    metode = @metode,
                    nama = @nama,
                    ad = @ad,
                    hasil = @hasil,
                    janji = @janji,
                    ket = @ket,
                    nominal = @nominal,
                    lampiran = @lampiran,
                    hp = @hp,
                    email = @email,
                    kol = @kol,
                    slip = @slip
                WHERE no = @no
            `);

        res.status(200).json({ message: 'Data berhasil diupdate' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// DELETE data
router.delete('/:no', async (req, res) => {
    const { no } = req.params;

    try {
        const pool = await poolPromise;
        await pool.request()
            .input('no', sql.VarChar, no)
            .query('DELETE FROM cr WHERE no = @no');

        res.status(200).json({ message: 'Data berhasil dihapus' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;
