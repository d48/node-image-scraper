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
  scrapeUrl: 'http://www.crispbranding.net/clientcomps/view/2ie6eH3eh2e1nnHetc2cN8ck6c3'
  imgSelector: '.pic-item img'
  saveDir: './images-xfx'


# ####################################################
# main
# ####################################################
scraper config.scrapeUrl, (err, $) ->
  if err
    throw err

  uBits = config.scrapeUrl
  uBits = uBits.split '/'
  baseUrl = uBits[0] + '//:' + uBits[2]

  $(config.imgSelector).each ->
    url = baseUrl + $(this).attr('src')
    log "getting #{url}"
    exec "( mkdir #{config.saveDir} && cd #{config.saveDir} && curl -O #{url} )" 

  exec "echo done; exit 1"
