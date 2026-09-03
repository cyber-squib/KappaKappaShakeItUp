function love.load()

  _gfx={}

  table.insert(_gfx,love.graphics.newImage("resource/sliceAll_KappaDance.png"))

  love.window.setMode(960,720)

end

function love.draw()

  love.graphics.clear(.5,.5,.5,1)
  
    love.graphics.draw(_gfx[1],8,8)--,0,1.25,1.25)

end