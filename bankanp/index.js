const express = require('express');
const app = express();
const pengaduanRoute = require('./routes/pengaduan');

// Middleware untuk parsing JSON
app.use(express.json());

// Route utama
app.use('/routes/pengaduan', pengaduanRoute);

// Listener Railway
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
