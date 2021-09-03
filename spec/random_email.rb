def random
  voc = 'abcdefghijklmnopqrstuvwxyz1234567890'
  alph = 'abcdefghijklmonpqrstuvwxyz'

  log = ''
  log += alph[rand(0..alph.length - 1)].capitalize!

  for el in 0..rand(1..19)
    log += voc[rand(0..voc.length - 1)]
  end

  return log
end