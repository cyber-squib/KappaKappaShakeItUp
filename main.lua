function love.load()

  _frame=0

  _gfx={}
  
  _sfx={}
  
  _cfx={}

  table.insert(_gfx,love.graphics.newImage("resource/sliceAll_KappaDance.png"))

  table.insert(_sfx,love.audio.newSource("resource/KappaDanceTune.wav","static"))

  table.insert(_cfx,love.sound.newSoundData("resource/KappaDanceControl.wav"))

  love.window.setMode(960,720)
  
  _sfx[1]:play()

end

function love.draw()

  love.graphics.clear(.5,.5,.5,1)

  local a,si

  si=_sfx[1]:tell("samples")

  a=0

  a=_cfx[1]:getSample(si,1)

  a=(a+1)/2

  local f=math.floor(a*6)%6
  
  local offset=4
  
  f=f+offset
  
  if f>=6 then f=f-6 end

--  local f=math.floor(_frame/6)%6
  
  love.graphics.draw(_gfx[1],love.graphics.newQuad(200*f,0,200,200,1200,200),8,8)
  
  _frame=_frame+1

end