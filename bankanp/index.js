const express = require('express');
const app = express();
const cors = require('cors'); 
require("dotenv").config();
const { poolPromise } = require("./db");

// 🔍 Log environment variable untuk debugging
console.log('DB_USER:', process.env.DB_USER);
console.log('DB_PASSWORD:', process.env.DB_PASSWORD ? '***' : 'Not Set');
console.log('DB_SERVER:', process.env.DB_SERVER);
console.log('DB_DATABASE:', process.env.DB_DATABASE);
console.log('DB_PORT:', process.env.DB_PORT);
console.log('API_BASE_URL:', process.env.API_BASE_URL);


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
  methods: ['GET','POST','OPTIONS'],
  allowedHeaders: ['Content-Type'],
  credentials: true
}));

// Middleware untuk parsing JSON
app.use(express.json());

// 🔁 Redirect vercel default domain ke custom domain (opsional)
app.use((req, res, next) => {
  const host = req.headers.host;
  if (host === 'bankanp.up.railway.app') {
     return res.redirect(301, `https://bankanp.up.railway.app${req.url}`);
  }
  next();
});


// 📦 Import semua route
const pengaduanRoute = require('./routes/pengaduan');

// Route utama
app.use('/pengaduan', pengaduanRoute);

// 🩺 Route root untuk cek server aktif
app.get('/', (req, res) => {
  res.send('API Bank ANP aktif 🚀');
});

// Listener Railway
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

