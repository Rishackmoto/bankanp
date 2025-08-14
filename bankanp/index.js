const express = require('express');
const app = express();

// 📦 Import semua route
const pengaduanRoute = require('./routes/pengaduan');

// Middleware untuk parsing JSON
app.use(express.json());

// ✅ Setup CORS yang benar
const allowedOrigins = [
  "https://bankanp.up.railway.app",
  "https://bankanp-nine.vercel.app",
  "http://localhost:3000",
  "http://127.0.0.1:50747",
  "http://localhost:1234", // misal pakai Parcel
  "http://localhost:5173", // misal pakai Vite
  "http://localhost:4200", // misal pakai Angular
  "http://localhost:8080" 
  ];

app.use(cors({
  origin: function (origin, callback) {
    if (!origin || allowedOrigins.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS: " + origin));
    }
  },
  credentials: true
}));


// Route utama
app.use('/pengaduan', pengaduanRoute);

// Listener Railway
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
