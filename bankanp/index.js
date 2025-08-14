const express = require('express');
const app = express();
const pengaduanRoute = require('./bankanp/routes/pengaduan'); // pastikan path benar

app.use(express.json());

// Daftarkan prefix route
app.use('/pengaduan', pengaduanRoute);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
