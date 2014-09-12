mongoose = require 'mongoose'

Subscription = new mongoose.Schema
  calendarId: String
  listeners: Array
  lastPost: String

module.exports = mongoose.model 'Subscription', Subscription
