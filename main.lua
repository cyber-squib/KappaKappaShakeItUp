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

function love.keypressed(k,s,r)

  _blossom:keyPressed(k,s,r)

end

Blossom={}

Blossom.__index=Blossom

function Blossom:init()

  self.shaking=false
  
  self.hopping=false
  
  self.approach=0
  
  self.flip=1
  
  self.x=512
  
  self.y=512
  
  self.originalX=self.x
  
  self.originalY=self.y

  return self

end

--function Blossom:update()
--
--  
--
--end

function Blossom:draw()

  local distance

  if self.hopping then
  
    if self.approach==0 then
      
      local a,si
        
      si=_sfx[1]:tell("samples")
      
      a=0
      
      a=_cfx[1]:getSample(si,1)
      
      a=(a+1)/2
      
      local bounce=64
      
      local height=-math.sin(math.pi*a)*bounce
      
      local gridSize=96
      
      distance=a*self.flip*gridSize
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      local flip=self.flip
      
      
      
      if self.b and self.b>a then
      
        self.hopping=false
        
        self.x=self.x+self.distance
      
      end
      
      self.b=a
      
      self.distance=distance
      
      
      
      love.graphics.draw(_gfx[1],quad,self.x-self.flip*100+distance,self.y+height,0,flip,1)
      
    else
    
      local a,si
        
      si=_sfx[1]:tell("samples")
      
      a=0
      
      a=_cfx[1]:getSample(si,1)
      
      a=(a+1)/2
      
      local bounce=64
      
      local height=-math.sin(math.pi*a)*bounce
      
      local gridSize=64
      
      distance=a*self.approach*gridSize
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      local flip=self.flip
      
      
      
      if self.b and self.b>a then
      
        self.hopping=false
        
        self.y=self.y+self.distance
      
      end
      
      self.b=a
      
      self.distance=distance
      
      
      
      love.graphics.draw(_gfx[1],quad,self.x-self.flip*100,self.y+distance+height,0,flip,1)
    
    end
  
    
  
  else

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
      
      love.graphics.draw(_gfx[1],quad,self.x-self.flip*100,self.y,0,flip,1)
      
    else
    
      local f=0
    
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      local flip=self.flip
      
      love.graphics.draw(_gfx[1],quad,self.x-self.flip*100,self.y,0,flip,1)
    
    end
  
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

function Blossom:keyPressed(k,s,r)

  if k=="left" then
  
    self.flip=-1
  
    self.shaking=false
    
    self.hopping=true
    
    self.approach=0
  
  elseif k=="right" then
  
    self.flip=1
  
    self.shaking=false
    
    self.hopping=true
    
    self.approach=0
  
  elseif k=="up" then
  
    self.shaking=false
    
    self.hopping=true
    
    self.approach=-1
  
  elseif k=="down" then
  
    self.shaking=false
    
    self.hopping=true
    
    self.approach=1
  
  end

end