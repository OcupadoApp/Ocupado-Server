module.exports = (app) ->
  server = require('http').createServer(app).listen(1337)
  io = require('socket.io').listen(server)
  app.sockets = {} unless app.sockets?

  io.on 'connection', (socket) ->
    socket.emit 'handshake:request'
    socket.on 'handshake:response', (data) ->
      if data.id?
        app.sockets[data.id] = socket
