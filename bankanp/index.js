const express = require("express");
const cors = require("cors");
require("dotenv").config();
const { poolPromise } = require("./db");

// kalau node <18
const fetch = require('node-fetch'); // ⬅️ tamb

// 🔍 Debug env
console.log('DB_USER:', process.env.DB_USER);
console.log('DB_PASSWORD:', process.env.DB_PASSWORD ? '***' : 'Not Set');
console.log('DB_SERVER:', process.env.DB_SERVER);
console.log('DB_DATABASE:', process.env.DB_DATABASE);
console.log('DB_PORT:', process.env.DB_PORT);
console.log('API_BASE_URL:', process.env.API_BASE_URL);

// 📦 Import route
const pengaduanRoute = require('./routes/pengaduan');

const app = express();

// ✅ Allowed origins
const allowedOrigins = [
  "https://bankanp.up.railway.app",
  "https://bankanp-nine.vercel.app",
  "https://bankanp.com",
  "https://www.bankanp.com",
  "https://api.bankanp.com",
  "http://localhost:3000",
  "http://127.0.0.1:50747",
  "http://localhost:1234",
  "http://localhost:5173",
  "http://localhost:4200",
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
  methods: ['GET', 'POST'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true
}));

app.use(express.json());

// 🔁 Redirect domain utama ke API
app.use((req, res, next) => {
  const host = req.headers.host;
  if (host === 'bankanp.com') {
     return res.redirect(301, `https://api.bankanp.com${req.url}`);
  }
  next();
});

// 📌 Pasang route
app.use('/pengaduan', pengaduanRoute);

app.get('/visitors', async (req, res) => {
  try {
    const resp = await fetch('https://api.countapi.xyz/hit/bankanp.com/visitors');
    const data = await resp.json();
    res.setHeader('Access-Control-Allow-Origin', '*'); // <—
    res.json(data);
  } catch (err) {
    console.error('Error fetch visitors:', err);
    res.status(500).json({ error: 'Gagal mengambil data pengunjung' });
  }
});

// 🚀 Listener
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
