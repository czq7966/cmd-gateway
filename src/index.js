const aedes = require('aedes')()
const server = require('net').createServer(aedes.handle)
const port = 1883

server.listen(port, function () {
  console.log('mqtt server started and listening on port ', port)
})


server.addListener("connection", (socket) => {
    console.log('mqtt server on connection ');
})


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
