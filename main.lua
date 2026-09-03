function love.load()

  _gfx={}
  
  _sfx={}
  
  _cfx={}

  table.insert(_gfx,love.graphics.newImage("resource/sliceAll_KappaDance.png"))

  table.insert(_sfx,love.audio.newSource("resource/KappaDanceTune.wav","static"))

  table.insert(_cfx,love.sound.newSoundData("resource/KappaDanceControl.wav"))

  love.window.setMode(960,720)
  
  _sfx[1]:play()
  
  _blossom=setmetatable({},Blossom):init()

end

function love.draw()

  love.graphics.clear(.5,.5,.5,1)
  
  _blossom:draw()

end

Blossom={}

Blossom.__index=Blossom

function Blossom:init()

  return self

end

function Blossom:update()

end

function Blossom:draw()

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
  
  local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
  
  local flip=1
  
  love.graphics.draw(_gfx[1],quad,512,512,0,flip,1)

end