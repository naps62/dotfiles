#!/usr/bin/env node

var nodeSpotifyWebHelper = require('node-spotify-webhelper');
var spotify = new nodeSpotifyWebHelper.SpotifyWebHelper({port: '4371'});
// get the name of the song which is currently playing
spotify.getStatus(function (err, res) {
  if (err) {
    return console.error(err);
  }
  var song = res.track.artist_resource.name + ' - ' + res.track.track_resource.name;
  console.log(song);
});
