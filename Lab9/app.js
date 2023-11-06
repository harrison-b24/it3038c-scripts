const express = require('express');

const app = express();
const PORT = 3000;

const path = require('path')
let info = [{"name":"widget1","color":"blue"},{"name":"widget2","color":"green"},{"name":"widget3","color":"black"},{"name":"widgetX","color":"blue"}]
app.get('/info', (req, res) => {
  res.send(info);
});
app.listen(PORT, (error) => {
  if (!error)
    console.log("Server is Successfully Running, and App is listening on port " + PORT)
  else
    console.log("Error occurred, server can't start", error);
}
);
