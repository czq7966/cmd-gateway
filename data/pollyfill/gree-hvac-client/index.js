const Gree = require("gree-hvac-client")

Gree.Client.prototype._sendRequest = function(message) {
  this._trace('OUT.MSG', message, this._encryptionService.getKey());
  this._socketSend({
      cid: 'app',
      i: 0,
      t: 'pack',
      uid: 0,
      tcid: this._cid,
      pack: this._encryptionService.encrypt(message)
  });
};

// Gree.Client.prototype._socketSend = function(request) {
//   console.log('222222222222222222');
//   this._trace('SOCKET.SEND', request);
//   const toSend = Buffer.from(JSON.stringify(request));
//   this._socket.send(toSend, 0, toSend.length, this._options.port, this._options.host);
// };
