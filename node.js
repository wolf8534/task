const express = require('express');
const app = express();
const port = 3000;

// Route for echoing a message
app.get('/echo', (req, res) => {
  const message = req.query.message || 'No message provided';  // Get message from query parameter
  res.send(`Echo: ${message}`);
});

// Start the server
app.listen(port, () => {
  console.log(`App is running at http://localhost:${port}`);
});