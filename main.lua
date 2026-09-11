function love.load()

  _singleAction=false
  
  _playstationController=0

  _gfx={}
  
  _sfx={}
  
  _cfx={}

  table.insert(_gfx,love.graphics.newImage("resource/sliceAll_KappaDance.png"))
    
  table.insert(_gfx,love.graphics.newImage("resource/KappaRoutine.png"))
    
  table.insert(_gfx,love.graphics.newImage("resource/MoveLeft.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/MoveRight.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/MoveUp.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/MoveDown.png"))
  
  if _singleAction then
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeBack.png"))
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeBack.png"))
  
  else
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeLeft.png"))
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeRight.png"))
  
  end
  
  table.insert(_gfx,love.graphics.newImage("resource/Stage.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/v.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/x.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/Title.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/spicy.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/SoSpicy.png"))
    
  table.insert(_gfx,love.graphics.newImage("resource/MoveLeftPlaystation.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/MoveRightPlaystation.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/MoveUpPlaystation.png"))
  
  table.insert(_gfx,love.graphics.newImage("resource/MoveDownPlaystation.png"))
  
  if _singleAction then
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystation.png"))
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystation.png"))
  
  else
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeLeftPlaystation.png"))
  
    table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystation.png"))
  
  end
  
  table.insert(_sfx,love.audio.newSource("resource/KappaShakeItUp.wav","static"))

  table.insert(_cfx,love.sound.newSoundData("resource/KappaDanceControl.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerHorizontal Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerVertical Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerShake Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerHorizontal copy Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerVertical copy Bounced.wav"))
  
  table.insert(_cfx,love.sound.newSoundData("resource/MicromanagerShake copy Bounced.wav"))

  love.window.setMode(960,720)
  
  --_sfx[1]:play()
  
  _blossom=setmetatable({},Blossom):init()
  
  _routine=setmetatable({},Routine):init()
  
  _feedback=setmetatable({},Feedback):init()
  
  _state=0
  
  _lastControlPosition={}

end

function love.draw()

  if _state==1 then

    love.graphics.clear(.5,.5,.5,1)
    
    love.graphics.draw(_gfx[9],0,0)
    
    _blossom:draw()
    
    _routine:draw()
    
    _feedback:draw()
    
  else
  
    love.graphics.draw(_gfx[12],0,0)
  
  end

end

function love.mousepressed(x,y,b,t)

  _playstationController=0

  if _state==1 then

    _blossom:mousePressed(x,y,b,t)
    
    _routine:mousePressed(x,y,b,t)
    
    if not _sfx[1]:isPlaying() then
    
      love.event.quit"restart"
    
    end
  
  else
  
    _state=1
    
    _sfx[1]:play()
  
  end

end

function love.keypressed(k,s,r)

  _playstationController=0

  if _state==1 then

    _blossom:keyPressed(k,s,r)

    _routine:keyPressed(k,s,r)
  
  end

end

function love.gamepadpressed(j,b)

  _playstationController=12

  if _state==1 then

    _blossom:gamepadPressed(j,b)

    _routine:gamepadPressed(j,b)
    
    if not _sfx[1]:isPlaying() then
    
      love.event.quit"restart"
    
    end
  
  else
  
    _state=1
    
    _sfx[1]:play()
  
  end

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
  
  self.xOriginal=self.x
  
  self.yOriginal=self.y
  
  self.stageX=2
  
  self.stageY=1
  
  self.stageXMin=0
  
  self.stageYMin=0
  
  self.stageXMax=4
  
  self.stageYMax=2
  
  self.height=0

  return self

end

function Blossom:draw()
  
  local distance
  
  local speed=8

  if self.hopping then
  
    self.height=self.height+1
      
    local height=-math.sin(math.pi*(self.height/15))*64
    
    if self.here then
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      love.graphics.draw(_gfx[1],quad,self.x-self.flip*100,self.y+height,0,self.flip,1)
      
      if self.height>12 then
    
        self.hopping=false
        
        self.here=false
        
        self.height=0
    
      end
      
      return
    
    end
  
    if self.approach==0 then
    
      

      if not self.here then self.x=self.x+self.flip*speed end
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      love.graphics.draw(_gfx[1],quad,self.x-self.flip*100,self.y+height,0,self.flip,1)
      
    else
    
    
      
      self.y=self.y+self.approach*speed
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      love.graphics.draw(_gfx[1],quad,self.x-self.flip*100,self.y+height,0,self.flip,1)
    
    end
    
    local grid=96
  
    if (self.y-self.yOriginal)%grid==0 and (self.x-self.xOriginal)%grid==0 then
    
        self.hopping=false
        
        self.here=false
        
        self.height=0
    
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

  if _singleAction and (b==1 or b==2) then
  
    self:shakeBack()
    
    return
  
  end

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

function Blossom:shakeBack()
  
  self.flip=-self.flip
  
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

  if self.hopping then return end

  if k=="left" then
  
    if not self.hopping then self.stageX=self.stageX-1 end
  
    if self.stageX>=self.stageXMin then
    
      self:hopLeft()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMin
    
    end
  
  elseif k=="right" then
  
    if not self.hopping then self.stageX=self.stageX+1 end
  
    if self.stageX<=self.stageXMax then
    
      self:hopRight()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMax
    
    end
  
  elseif k=="up" then
  
    if not self.hopping then self.stageY=self.stageY-1 end
  
    if self.stageY>=self.stageYMin then
    
      self:hopUp()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMin
    
    end
  
  elseif k=="down" then
  
    if not self.hopping then self.stageY=self.stageY+1 end
  
    if self.stageY<=self.stageYMax then
    
      self:hopDown()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMax
    
    end
  
  end

end

function Blossom:gamepadPressed(j,b)

  if self.hopping then return end

  if b=="dpleft" then
  
    if not self.hopping then self.stageX=self.stageX-1 end
  
    if self.stageX>=self.stageXMin then
    
      self:hopLeft()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMin
    
    end
  
  elseif b=="dpright" then
  
    if not self.hopping then self.stageX=self.stageX+1 end
  
    if self.stageX<=self.stageXMax then
    
      self:hopRight()
    
    else
    
      self:hopHere()
    
      self.stageX=self.stageXMax
    
    end
  
  elseif b=="dpup" then
  
    if not self.hopping then self.stageY=self.stageY-1 end
  
    if self.stageY>=self.stageYMin then
    
      self:hopUp()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMin
    
    end
  
  elseif b=="dpdown" then
  
    if not self.hopping then self.stageY=self.stageY+1 end
  
    if self.stageY<=self.stageYMax then
    
      self:hopDown()
    
    else
    
      self:hopHere()
    
      self.stageY=self.stageYMax
    
    end
  
  end

  if _singleAction and (b=="a" or b=="x" or b=="b" or b=="y") then
  
    self:shakeBack()
    
    return
  
  end

  if b=="a" or b=="x" then
  
    self:shakeLeft()
  
  elseif b=="b" or b=="y" then
  
    self:shakeRight()
  
  end

end

Routine={}

Routine.__index=Routine

function Routine:init()

  self.score=0
  
  self.max=154
  
  self.lock=0
  
  self.cool=16

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
  
  if a<5 or b<5 then
  
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
  
  if a<5 or b<5 then
  
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
  
  if a<5 or b<5 then
  
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
  
  if a<5 or b<5 then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkShake(channel)

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  a=_cfx[4]:getSample(si,channel)
  
  a=math.abs(a)*100
  
  b=0
  
  b=_cfx[4+3]:getSample(si,channel)
  
  b=math.abs(b)*100
  
  if a<5 or b<5 then
  
    return true
    
  else
  
    return false
  
  end

end

function Routine:checkShakeLeft()
  
  if self:checkShake(1) then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkShakeRight()
  
  if self:checkShake(2) then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:checkShakeBack()
  
  if self:checkShake(1) or self:checkShake(2) then
  
    self.score=self.score+1
    
    _feedback:pass()
    
  else
  
    _feedback:fail()
  
  end

end

function Routine:round(n)

  if n-math.floor(n)<.5 then
  
    return math.floor(n)
  
  else
  
    return math.ceil(n)
  
  end

end

function Routine:waveShape(x)

  local pow=math.pow
  local sin=math.sin
  local pi=math.pi
  local floor=math.floor
  local tanh=math.tanh
  
  return
      (
      self:round(tanh(  pow(2,64)*sin(16*pi*(x-.21875)-pi/2)  ))
                *tanh(          3*sin(16*pi*(x-.21875)     )  )
      -2*floor((((x-.21875)*8)+0.25)*2)
      )/(-32)+0.21875

end

function Routine:debugDrawWaveShape()

  local xo,yo=64,64

  local r,g,b,a=love.graphics.getColor()

  love.graphics.setColor(1,0,0,1)

  for x=1,0,-.01 do
  
    --love.graphics.points(x,self:waveShape(x))
    
    local xa=128
    
    local ya=8
    
    local x=xo+(x)*xa
    
    local y=yo+(self:waveShape(x))*ya
    
    love.graphics.circle("fill",x,y,1)
  
  end
  
  love.graphics.setColor(r,g,b,a)

end

function Routine:draw()

  local aB,siB
  
  siB=_sfx[1]:tell("samples")
  
  aB=0
  
  aB=_cfx[1]:getSample(siB,1)
  
  aB=(aB+1)/2
  
  aB=math.sin(math.pi*(aB+1))*22
  
  aBY=0
  
  aBY=_cfx[1]:getSample(siB,1)
  
  aBY=(aBY+1)/2
  
  aBY=-math.sin(math.pi*(aBY))*11
  
  

  if self.lock>0 then self.lock=self.lock-1 end

  love.graphics.setLineWidth(64)

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
  
  
  
  

  
  
  

  love.graphics.draw(_gfx[2],0,0)
  
  
  
  local limit=.5

  local bottomPosition=580-17
  
  local xOffset=20-1080
  
  local moveWidth=1080*2

  local a,si
  
  si=_sfx[1]:tell("samples")
  
  
  
  for i=0,11 do
  
    a=0
  
    local n=2+math.floor(i/2)
    
    local c=1
    
    if i%2~=0 then c=2 end
  
    a=_cfx[n]:getSample(si,c)
    
    a=(a+1)/2
    
    a=self:waveShape(a)
    
    xPosition=a*moveWidth+xOffset
    
    if _lastControlPosition[12+1+i] and (xPosition-_lastControlPosition[i+1+12])<limit then

      love.graphics.draw(_gfx[_playstationController+3+i%6],xPosition,bottomPosition)
  
    end
  
    _lastControlPosition[i+1+12]=_lastControlPosition[i+1]

    _lastControlPosition[i+1]=xPosition
  
  end
  
  
  
  
  if not _sfx[1]:isPlaying() then
  
    local spicy=math.floor(percentage*4)+1
    
    if spicy>5 then spicy=5 end
    
    for i=1,spicy do
    
      love.graphics.draw(_gfx[13],-50+125*i,24)
    
    end
    
    love.graphics.draw(_gfx[14],160,382)
  
  end

end

function Routine:mousePressed(x,y,b,t)

  if self.lock>0 then return end

  self.lock=self.cool
  
  if _singleAction and (b==1 or b==2) then
  
    self:checkShakeBack()
    
    return
  
  end

  if b==1 then
  
    self:checkShakeLeft()
  
  elseif b==2 then
  
    self:checkShakeRight()
  
  end

end

function Routine:keyPressed(k,s,r)

  if self.lock>0 then return end

  self.lock=self.cool

  if k=="left" then
  
    self:checkMoveLeft()
  
  elseif k=="right" then
  
    self:checkMoveRight()

  elseif k=="up" then
  
    self:checkMoveUp()
  
  elseif k=="down" then
  
    self:checkMoveDown()
  
  end
  
end

function Routine:gamepadPressed(j,b)

  if self.lock>0 then return end

  self.lock=self.cool

  if b=="dpleft" then
  
    self:checkMoveLeft()
  
  elseif b=="dpright" then
  
    self:checkMoveRight()

  elseif b=="dpup" then
  
    self:checkMoveUp()
  
  elseif b=="dpdown" then
  
    self:checkMoveDown()
  
  end
  
  if _singleAction and (b=="a" or b=="x" or b=="b" or b=="y") then
  
    self:checkShakeBack()
    
    return
  
  end

  if b=="a" or b=="x" then
  
    self:checkShakeLeft()
  
  elseif b=="b" or b=="y" then
  
    self:checkShakeRight()
  
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

  if _sfx[1]:isPlaying() then

    if self.grade>0 then
    
      love.graphics.draw(_gfx[10],-16,350)
    
    elseif self.grade<0 then
    
      love.graphics.draw(_gfx[11],-32,350)
    
    end
  
  end
  
  if self.grade<0 then
  
    self.grade=self.grade+1
    
  elseif self.grade>0 then
  
    self.grade=self.grade-1
    
  end

end