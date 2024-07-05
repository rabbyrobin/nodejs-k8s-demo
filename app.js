const http = require('http');
const os = require('os');

const PORT = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end(`Hello, Kubernetes! From ${os.hostname()}\n`);
});

server.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}/`);
});
