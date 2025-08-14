const express = require('express');
const app = express();
const cors = require('cors'); 
require("dotenv").config();
const { poolPromise } = require("./db");

// ✅ Setup CORS
const allowedOrigins = [
  "https://bankanp.up.railway.app",
  "https://bankanp-nine.vercel.app",
  "http://localhost:3000",
  "http://127.0.0.1:50747",
  "http://localhost:1234",
  "http://localhost:5173",
  "http://localhost:4200",
  "http://localhost:8080"
];

app.use(cors({
  origin: function (origin, callback) {
    if (!origin || allowedOrigins.includes(origin) || !origin) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS: " + origin));
    }
  },
  methods: ['GET','POST','OPTIONS'],
  allowedHeaders: ['Content-Type'],
  credentials: true
}));

// Middleware parsing JSON
app.use(express.json());

// 📦 Import routes
const pengaduanRoute = require('./routes/pengaduan');

// Endpoint utama
app.use('/pengaduan', pengaduanRoute);

// Root untuk cek server aktif
app.get('/', (req, res) => {
  res.send('API Bank ANP aktif 🚀');
});

// Listener
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
