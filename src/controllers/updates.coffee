module.exports =

  reload_calendar: (req, res, next, app) ->
    deviceId = req.get('X-Goog-Channel-Token')
    if deviceId? && app.sockets[deviceId]?
      app.sockets[deviceId].forEach (socket) ->
        socket.emit 'sync'
      res.send ''
    else
      res.send ''
      res.statusCode = 404
