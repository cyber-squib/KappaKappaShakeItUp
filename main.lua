function love.load()

  _gfx={}
  
  _sfx={}
  
  _cfx={}

  table.insert(_gfx,love.graphics.newImage("resource/sliceAll_KappaDance.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/KappaRoutine.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/MoveLeft.png"))

  table.insert(_gfx,love.graphics.newImage("resource/MoveRight.png"))

  table.insert(_gfx,love.graphics.newImage("resource/MoveUp.png"))

  table.insert(_gfx,love.graphics.newImage("resource/MoveDown.png"))

  table.insert(_gfx,love.graphics.newImage("resource/ShakeLeft.png"))

  table.insert(_gfx,love.graphics.newImage("resource/ShakeRight.png"))

  table.insert(_sfx,love.audio.newSource("resource/KappaDanceTune.wav","static"))

  table.insert(_cfx,love.sound.newSoundData("resource/KappaDanceControl.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerHorizontal Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerVertical Bounced.wav"))

  love.window.setMode(960,720)
  
  _sfx[1]:play()
  
  _blossom=setmetatable({},Blossom):init()
  
  _routine=setmetatable({},Routine):init()

end

function love.draw()

  love.graphics.clear(.5,.5,.5,1)
  
  _blossom:draw()
  
  _routine:draw()

end

function love.mousepressed(x,y,b,t)

  _blossom:mousePressed(x,y,b,t)
  
  _routine:mousePressed(x,y,b,t)

end

function love.keypressed(k,s,r)

  _blossom:keyPressed(k,s,r)

  _routine:keyPressed(k,s,r)

end

Blossom={}

Blossom.__index=Blossom

function Blossom:init()

  self.shaking=false
  
  self.hopping=false
  
  self.approach=0
  
  self.flip=1
  
  self.x=480
  
  self.y=360
  
  self.stageX=2
  
  self.stageY=1
  
  self.stageXMin=0
  
  self.stageYMin=0
  
  self.stageXMax=4
  
  self.stageYMax=2

  return self

end

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
      
      if self.here then distance=0 end
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      local flip=self.flip
      
      
      
      if self.b and self.b>a then
      
        self.hopping=false
        
        self.here=false
        
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
  
    self:shakeLeft()
  
  elseif b==2 then
  
    self:shakeRight()
  
  end

end

function Blossom:shakeLeft()
  
  self.flip=-1
  
  self.shaking=true

end

function Blossom:shakeRight()
  
  self.flip=1
  
  self.shaking=true

end

function Blossom:hopLeft()

  self.flip=-1
  
  self.shaking=false
  
  self.hopping=true
  
  self.approach=0

end

function Blossom:hopRight()


  
  self.flip=1
  
  self.shaking=false
  
  self.hopping=true
  
  self.approach=0

end

function Blossom:hopUp()

  self.shaking=false
  
  self.hopping=true
  
  self.approach=-1

end

function Blossom:hopDown()
  
  self.shaking=false
  
  self.hopping=true
  
  self.approach=1

end

function Blossom:hopHere()

  self.shaking=false
  
  self.hopping=true
  
  self.approach=0
  
  self.here=true

end

function Blossom:keyPressed(k,s,r)

  if k=="left" or k=="a" then
  
    self.stageX=self.stageX-1
  
    if self.stageX>=self.stageXMin then
    
      self:hopLeft()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMin
    
    end
  
  elseif k=="right" or k=="d" then
  
    self.stageX=self.stageX+1
  
    if self.stageX<=self.stageXMax then
    
      self:hopRight()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMax
    
    end
  
  elseif k=="up" or k=="w" then
  
    self.stageY=self.stageY-1
  
    if self.stageY>=self.stageYMin then
    
      self:hopUp()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMin
    
    end
  
  elseif k=="down" or k=="s" then
  
    self.stageY=self.stageY+1
  
    if self.stageY<=self.stageYMax then
    
      self:hopDown()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMax
    
    end
    
  elseif k=="k" then
  
    self:shakeLeft()
  
  elseif k=="l" then
  
    self:shakeRight()
  
  end

end

Routine={}

Routine.__index=Routine

function Routine:init()

  --self.moveLeftIndex=3
  --
  --self.moveRightIndex=4
  --
  --self.moveUpIndex=5
  --
  --self.moveDownIndex=6
  --
  --self.shakeLeftIndex=7
  --
  --self.shakeRightIndex=8

  --self.moveLeftPosition=0
  --
  --self.moveRightPosition=0
  --
  --self.moveUpPosition=0
  --
  --self.moveDownPosition=0
  --
  --self.shakeLeftPosition=0
  --
  --self.shakeRightPosition=0

  return self

end

function Routine:draw()

  love.graphics.draw(_gfx[2],0,0)

  local bottomPosition=580
  
  local xOffset=-32

  local a,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[2]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*1080+xOffset

  love.graphics.draw(_gfx[3],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[2]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*1080+xOffset

  love.graphics.draw(_gfx[4],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[3]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*1080+xOffset

  love.graphics.draw(_gfx[5],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[3]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*1080+xOffset

  love.graphics.draw(_gfx[6],xPosition,bottomPosition)

  love.graphics.draw(_gfx[7],32,bottomPosition)

  love.graphics.draw(_gfx[8],32,bottomPosition)

end

function Routine:mousePressed(x,y,b,t)

end

function Routine:keyPressed(k,s,r)

end