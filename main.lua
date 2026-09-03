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

--function love.update()
--
--  _blossom:update()
--
--end

function love.mousepressed(x,y,b,t)

  _blossom:mousePressed(x,y,b,t)

end

Blossom={}

Blossom.__index=Blossom

function Blossom:init()

  self.shaking=false
  
  self.flip=1

  return self

end

--function Blossom:update()
--
--  
--
--end

function Blossom:draw()

  if self.shaking then
  
    local a,si
    
    si=_sfx[1]:tell("samples")
    
    a=0
    
    a=_cfx[1]:getSample(si,1)
    
    a=(a+1)/2
    
    local f=math.floor(a*6)%6
    
    local offset=4
    
    f=f+offset
    
    if f>=6 then f=f-6 end
    
    local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
    
    local flip=self.flip
    
    love.graphics.draw(_gfx[1],quad,512,512,0,flip,1)
    
  else
  
    local f=0
  
    local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
    
    local flip=self.flip
    
    love.graphics.draw(_gfx[1],quad,512,512,0,flip,1)
  
  end

end

function Blossom:mousePressed(x,y,b,t)

  if b==1 then
  
    self.flip=-1
  
    self.shaking=true
  
  elseif b==2 then
  
    self.flip=1
  
    self.shaking=true
  
  end

end