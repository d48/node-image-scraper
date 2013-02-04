# ####################################################
# get modules
# ####################################################
require 'coffee-script'
scraper = require 'scraper'
exec = require('child_process').exec


# ####################################################
# setup vars
# ####################################################
log = console.log

config =
  scrapeUrl: 'http://www.daviddownton.com/latest-news-2009.html'
  baseUrl: 'http://www.daviddownton.com/'
  imgSelector: '.inner-wrapper-content img'
  saveDir: './images-2009'


# ####################################################
# main
# ####################################################
scraper config.scrapeUrl, (err, $) ->
  if err
    throw err

  baseUrl = config.baseUrl

  $(config.imgSelector).each ->
    url = baseUrl + $(this).attr('src')
    log "getting #{url}"
    exec "( cd #{config.saveDir} && curl -O #{url} )" 

  exec "echo done; exit 1"
