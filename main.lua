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
  
  table.insert(_gfx,love.graphics.newImage("resource/Stage.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/v.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/x.png"))

  table.insert(_sfx,love.audio.newSource("resource/KappaDanceTune.wav","static"))

  table.insert(_cfx,love.sound.newSoundData("resource/KappaDanceControl.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerHorizontal Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerVertical Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerShake Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerHorizontal copy Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerVertical copy Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerShake copy Bounced.wav"))

  love.window.setMode(960,720)
  
  _sfx[1]:play()
  
  _blossom=setmetatable({},Blossom):init()
  
  _routine=setmetatable({},Routine):init()
  
  _feedback=setmetatable({},Feedback):init()

end

function love.draw()

  love.graphics.clear(.5,.5,.5,1)
  
  love.graphics.draw(_gfx[9],0,0)
  
  _blossom:draw()
  
  _routine:draw()
  
  _feedback:draw()

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
  
  self.y=225
  
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
      
      local height=-math.sin(math.pi*(a))*bounce
      
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
      
      local height=-math.sin(math.pi*(a))*bounce
      
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

  if k=="left" then --or k=="a" then
  
    self.stageX=self.stageX-1
  
    if self.stageX>=self.stageXMin then
    
      self:hopLeft()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMin
    
    end
  
  elseif k=="right" then --or k=="d" then
  
    self.stageX=self.stageX+1
  
    if self.stageX<=self.stageXMax then
    
      self:hopRight()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMax
    
    end
  
  elseif k=="up" then --or k=="w" then
  
    self.stageY=self.stageY-1
  
    if self.stageY>=self.stageYMin then
    
      self:hopUp()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMin
    
    end
  
  elseif k=="down" then --or k=="s" then
  
    self.stageY=self.stageY+1
  
    if self.stageY<=self.stageYMax then
    
      self:hopDown()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMax
    
    end
    
  --elseif k=="k" then
  --
  --  self:shakeLeft()
  --
  --elseif k=="l" then
  --
  --  self:shakeRight()
  
  end

end

Routine={}

Routine.__index=Routine

function Routine:init()

  self.score=0
  
  self.max=40

  return self

end

function Routine:checkMoveLeft()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[2]:getSample(si,1)
  
  a=math.abs(a)*100
  
  b=0
  
  b=_cfx[2+3]:getSample(si,1)
  
  b=math.abs(b)*100
  
  if a<10 or b<10 then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkMoveRight()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[2]:getSample(si,2)
  
  a=math.abs(a)*100
  
  b=0
  
  b=_cfx[2+3]:getSample(si,2)
  
  b=math.abs(b)*100
  
  --assert(false,"a=="..a)
  
  if a<10 or b<10 then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkMoveUp()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[3]:getSample(si,1)
  
  a=math.abs(a)*100
  
  b=0
  
  b=_cfx[3+3]:getSample(si,1)
  
  b=math.abs(b)*100
  
  if a<10 or b<10 then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkMoveDown()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[3]:getSample(si,2)
  
  a=math.abs(a)*100
  
  b=0
  
  b=_cfx[3+3]:getSample(si,2)
  
  b=math.abs(b)*100
  
  if a<10 or b<10 then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkShakeLeft()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[4]:getSample(si,1)
  
  a=math.abs(a)*100
  
  b=0
  
  b=_cfx[4+3]:getSample(si,1)
  
  b=math.abs(b)*100
  
  if a<10 or b<10 then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkShakeRight()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[4]:getSample(si,2)
  
  a=math.abs(a)*100
  
  b=0
  
  b=_cfx[4+3]:getSample(si,2)
  
  b=math.abs(b)*100
  
  if a<10 or b<10 then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:draw()

  love.graphics.setLineWidth(64)
  
  --love.graphics.setLineStyle"smooth"

  love.graphics.setColor(0x6a/0xff,0x37/0xff,0x71/0xff,0xff/0xff)

  local y=64
  
  local x=32

  local percentage=self.score/self.max
  
  if percentage>1 then percentage=1 end

  local width=(960-x*2)*percentage

  love.graphics.line(x,y,x+(960-x*2),y)

  love.graphics.setColor(0xf9/0xff,0x92/0xff,0x52/0xff,0xff/0xff)
  
  love.graphics.line(x,y,x+width,y)
  
  love.graphics.setLineWidth(1)
  
  love.graphics.setColor(1,1,1,1)
  
  --love.graphics.setLineStyle"rough"

  love.graphics.draw(_gfx[2],0,0)
  
  
  
  
  
  --love.graphics.print("SCORE:"..self.score,64,56)

  local bottomPosition=580-17
  
  local xOffset=20-1080
  
  local moveWidth=1080*2

  local a,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[2]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[3],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[2]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[4],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[3]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[5],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[3]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[6],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[4]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[7],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[4]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[8],xPosition,bottomPosition)
  
  --------------------------
  
  a=0
  
  a=_cfx[5]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[3],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[5]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[4],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[6]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[5],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[6]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[6],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[7]:getSample(si,1)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[7],xPosition,bottomPosition)
  
  a=0
  
  a=_cfx[7]:getSample(si,2)
  
  a=(a+1)/2
  
  xPosition=a*moveWidth+xOffset

  love.graphics.draw(_gfx[8],xPosition,bottomPosition)
  
  ------------------------------

end

function Routine:mousePressed(x,y,b,t)

  if b==1 then
  
    self:checkShakeLeft()
  
  elseif b==2 then
  
    self:checkShakeRight()
  
  end

end

function Routine:keyPressed(k,s,r)

  if k=="left" then --or k=="a" then
  
    self:checkMoveLeft()
  
  elseif k=="right" then --or k=="d" then
  
    self:checkMoveRight()

  elseif k=="up" then --or k=="w" then
  
    self:checkMoveUp()
  
  elseif k=="down" then --or k=="s" then
  
    self:checkMoveDown()
    
  --elseif k=="k" then
  --
  --  self:checkShakeLeft()
  --
  --elseif k=="l" then
  --
  --  self:checkShakeRight()
  
  end
  
end

Feedback={}

Feedback.__index=Feedback

function Feedback:init()

  self.grade=0

  return self
  
end

function Feedback:pass()

  self.grade=30

end

function Feedback:fail()

  self.grade=-30

end

function Feedback:draw()

  if self.grade>0 then

    love.graphics.draw(_gfx[10],-16,350)
  
  elseif self.grade<0 then
  
    love.graphics.draw(_gfx[11],-32,350)
  
  end
  
  if self.grade<0 then
  
    self.grade=self.grade+1
    
  elseif self.grade>0 then
  
    self.grade=self.grade-1
    
  end

end