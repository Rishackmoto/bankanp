const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// ROUTE PENGADUAN
app.post('/pengaduan', (req, res) => {
    const { nama, email, pesan } = req.body;

    if (!nama || !email || !pesan) {
        return res.status(400).json({
            status: 'error',
            message: 'Nama, email, dan pesan wajib diisi'
        });
    }

    console.log('Pengaduan baru:', { nama, email, pesan });

    res.json({
        status: 'success',
        message: 'Pengaduan berhasil dikirim'
    });
});

// PORT
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
