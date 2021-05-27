const aedes = require('aedes')()

// tcp server
const server = require('net').createServer(aedes.handle)
const port = 1883

server.listen(port, function () {
  console.log('mqtt server started and listening on port ', port)
})


server.addListener("connection", (socket) => {
    console.log('mqtt tcp on connection ');
})


// websocket server
const wsport = 1882
const httpServer = require('http').createServer()
const wsStream = require('websocket-stream')

const wsServer = wsStream.createServer({ server: httpServer }, aedes.handle)

httpServer.listen(wsport, function () {
  console.log('websocket server listening on port ', wsport)
})

wsServer.on("connection", (socket) => {
    console.log('mqtt websocket on connection ');
})


// mqtt event
aedes.on("client", (client) => {
    console.log('on client event ');
})

aedes.on("clientReady", (client) => {
    console.log('on clientReady event ');
})


aedes.on("subscribe", (subscriptions, client) => {
    console.log('on subscribe event: ', subscriptions);
})

aedes.on("publish", (AedesPublishPacket, client) => {
    console.log('on publish event: ', AedesPublishPacket);
})
