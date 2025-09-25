const axios = require("axios");

async function sendWhatsAppMessage(to, nama, bulan, jumlah, jatuhTempo) {
  const url = "https://graph.facebook.com/v19.0/82317739026/messages";
  const token = "YOUR_PERMANENT_ACCESS_TOKEN";

  const data = {
    messaging_product: "whatsapp",
    to: to, // nomor tujuan, pakai format internasional: 628xxxx
    type: "template",
    template: {
      name: "tagihan_angsuran",
      language: { code: "id" },
      components: [
        {
          type: "body",
          parameters: [
            { type: "text", text: nama },
            { type: "text", text: bulan },
            { type: "text", text: jumlah },
            { type: "text", text: jatuhTempo }
          ]
        }
      ]
    }
  };

  try {
    const res = await axios.post(url, data, {
      headers: {
        Authorization: `Bearer ${token}`,
        "Content-Type": "application/json"
      }
    });
    console.log("Pesan terkirim:", res.data);
  } catch (err) {
    console.error("Gagal kirim WA:", err.response?.data || err.message);
  }
}

module.exports = sendWhatsAppMessage;
