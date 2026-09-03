function love.load()

  _frame=0

  _gfx={}

  table.insert(_gfx,love.graphics.newImage("resource/sliceAll_KappaDance.png"))

  love.window.setMode(960,720)

end

function love.draw()

  love.graphics.clear(.5,.5,.5,1)
  
  love.graphics.draw(_gfx[1],love.graphics.newQuad(200*(math.floor(_frame/6)%6),0,200,200,1200,200),8,8)--,0,1.25,1.25)
  
  _frame=_frame+1

end