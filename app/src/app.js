const express = require("express");
const healthRoute = require("./routes/health");

const app = express();

app.use(express.json());

app.get("/", (req, res) => {
  res.status(200).json({
    message: "Node.js ECS app is running - CI/CD verified"
  });
});

app.use("/health", healthRoute);

module.exports = app;