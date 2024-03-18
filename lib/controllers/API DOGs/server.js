const express = require("express");
const fs = require("fs");
const path = require("path");

const app = express();
const PORT = 3000;

// Đọc và gửi dữ liệu JSON khi có request đến endpoint
app.get("/dogs", (req, res) => {
  const filePath = path.join(__dirname, "data", "dogs.json");
  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.status(500).send("Error reading dogs data");
      return;
    }
    res.setHeader("Content-Type", "application/json");
    res.send(data);
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
