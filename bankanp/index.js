const express = require('express');
const cors = require('cors');

const app = express();

// Aktifkan CORS
app.use(cors());

// Parse JSON body
app.use(express.json());

const pengaduanRoute = require('./routes/pengaduan');
app.use('/', pengaduanRoute);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
