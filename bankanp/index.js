const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Allowed origins
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

// Handle preflight
app.options('*', cors());

// Parse JSON
app.use(express.json());

// Import route
const pengaduanRoute = require('./routes/pengaduan');
app.use('/pengaduan', pengaduanRoute);

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
