const http = require('http');
const os = require('os');

const server = http.createServer((req, res) => {
  if (req.url === '/') {
    const hostname = os.hostname();
    const ip = getIPAddress();
    const uptime = getUptime();
    const totalMemory = os.totalmem() / (1024 * 1024);
    const freeMemory = os.freemem() / (1024 * 1024);
    const cpuCount = os.cpus().length;

    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(`
      <h1>Server Information</h1>
      <ul>
        <li>Hostname: ${hostname}</li>
        <li>IP Address: ${ip}</li>
        <li>Server Uptime: ${uptime}</li>
        <li>Total Memory (MB): ${totalMemory.toFixed(2)}</li>
        <li>Free Memory (MB): ${freeMemory.toFixed(2)}</li>
        <li>CPU Count: ${cpuCount}</li>
      </ul>
    `);
  } else {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Page not found');
  }
});

server.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});

function getIPAddress() {
  const ifaces = os.networkInterfaces();
  for (const iface of Object.values(ifaces)) {
    for (const details of iface) {
      if (details.family === 'IPv4' && !details.internal) {
        return details.address;
      }
    }
  }
  return 'N/A';
}

function getUptime() {
  const uptimeInSeconds = os.uptime();
  const days = Math.floor(uptimeInSeconds / (3600 * 24));
  const hours = Math.floor((uptimeInSeconds % (3600 * 24)) / 3600);
  const minutes = Math.floor((uptimeInSeconds % 3600) / 60);
  const seconds = Math.floor(uptimeInSeconds % 60);

  return `${days} days, ${hours} hours, ${minutes} minutes, ${seconds} seconds`;
}
