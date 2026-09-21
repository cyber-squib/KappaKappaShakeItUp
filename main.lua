function love.load()

  _frame=0
  
  love.math.setRandomSeed(os.time())

  _singleAction=false
  
  _playstationController=0

  _gfx={}
  
  _sfx={}
  
  _cfx={}
  
  _fnt={}

  --[[ 001 ]] table.insert(_gfx,love.graphics.newImage("resource/sliceAll_KappaDance.png"))
  --[[     ]]   
  --[[ 002 ]] table.insert(_gfx,love.graphics.newImage("resource/KappaRoutine.png"))
  --[[     ]]   
  --[[ 003 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveLeft.png"))
  --[[     ]] 
  --[[ 004 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveRight.png"))
  --[[     ]] 
  --[[ 005 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveUp.png"))
  --[[     ]] 
  --[[ 006 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveDown.png"))
  --[[     ]] 
  --[[     ]] if _singleAction then
  --[[     ]] 
  --[[ 007 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeBack.png"))
  --[[     ]] 
  --[[ 008 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeBack.png"))
  --[[     ]] 
  --[[     ]] else
  --[[     ]] 
  --[[ 007 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeLeft.png"))
  --[[     ]] 
  --[[ 008 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRight.png"))
  --[[     ]] 
  --[[     ]] end
  --[[     ]] 
  --[[ 009 ]] table.insert(_gfx,love.graphics.newImage("resource/Stage.png"))
  --[[     ]] 
  --[[ 010 ]] table.insert(_gfx,love.graphics.newImage("resource/v.png"))
  --[[     ]] 
  --[[ 011 ]] table.insert(_gfx,love.graphics.newImage("resource/x.png"))
  --[[     ]] 
  --[[ 012 ]] table.insert(_gfx,love.graphics.newImage("resource/Title.png"))
  --[[     ]] 
  --[[ 013 ]] table.insert(_gfx,love.graphics.newImage("resource/spicy.png"))
  --[[     ]] 
  --[[ 014 ]] table.insert(_gfx,love.graphics.newImage("resource/SoSpicy.png"))
  --[[     ]]   
  --[[ 015 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveLeftPlaystation.png"))
  --[[     ]] 
  --[[ 016 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveRightPlaystation.png"))
  --[[     ]] 
  --[[ 017 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveUpPlaystation.png"))
  --[[     ]] 
  --[[ 018 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveDownPlaystation.png"))
  --[[     ]] 
  --[[     ]] if _singleAction then
  --[[     ]] 
  --[[ 019 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystation.png"))
  --[[     ]] 
  --[[ 020 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystation.png"))
  --[[     ]] 
  --[[     ]] else
  --[[     ]] 
  --[[ 019 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeLeftPlaystation.png"))
  --[[     ]] 
  --[[ 020 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystation.png"))
  --[[     ]] 
  --[[     ]] end
  --[[     ]] 
  --[[ 021 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveLeftMotionBlur.png"))
  --[[     ]] 
  --[[ 022 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveRightMotionBlur.png"))
  --[[     ]] 
  --[[ 023 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveUpMotionBlur.png"))
  --[[     ]] 
  --[[ 024 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveDownMotionBlur.png"))
  --[[     ]] 
  --[[     ]] if _singleAction then
  --[[     ]] 
  --[[ 025 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeBackMotionBlur.png"))
  --[[     ]] 
  --[[ 026 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeBackMotionBlur.png"))
  --[[     ]] 
  --[[     ]] else
  --[[     ]] 
  --[[ 025 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeLeftMotionBlur.png"))
  --[[     ]] 
  --[[ 026 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRightMotionBlur.png"))
  --[[     ]] 
  --[[     ]] end
  --[[     ]] 
  --[[ 027 ]] table.insert(_gfx,love.graphics.newImage("resource/KappaSweat.png"))
  --[[     ]] 
  --[[ 028 ]] table.insert(_gfx,love.graphics.newImage("resource/timeline.png"))
  --[[     ]] 
  --[[ 029 ]] table.insert(_gfx,love.graphics.newImage("resource/blank.png"))
  --[[     ]] 
  --[[ 030 ]] table.insert(_gfx,love.graphics.newImage("resource/KappaCrying.png"))
  --[[     ]] 
  --[[ 031 ]] table.insert(_gfx,love.graphics.newImage("resource/KappaYoinks.png"))
  --[[     ]] 
  --[[ 032 ]] table.insert(_gfx,love.graphics.newImage("resource/blank.png"))
  --[[     ]] 
  --[[ 033 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveLeftPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[ 034 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveRightPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[ 035 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveUpPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[ 036 ]] table.insert(_gfx,love.graphics.newImage("resource/MoveDownPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[     ]] if _singleAction then
  --[[     ]] 
  --[[ 037 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[ 038 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[     ]] else
  --[[     ]] 
  --[[ 037 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeLeftPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[ 038 ]]   table.insert(_gfx,love.graphics.newImage("resource/ShakeRightPlaystationMotionBlur.png"))
  --[[     ]] 
  --[[     ]] end
  --[[     ]]
  --[[ 039 ]] table.insert(_gfx,love.graphics.newImage("resource/StepLeft.png"))
  --[[     ]]
  --[[ 040 ]] table.insert(_gfx,love.graphics.newImage("resource/StepRight.png"))
  --[[     ]]
  --[[ 041 ]] table.insert(_gfx,love.graphics.newImage("resource/StepLeftPlaystation.png"))
  --[[     ]]
  --[[ 042 ]] table.insert(_gfx,love.graphics.newImage("resource/StepRightPlaystation.png"))
  --[[     ]]
  --[[ 043 ]] table.insert(_gfx,love.graphics.newImage("resource/StepLeftMotionBlur.png"))
  --[[     ]]
  --[[ 044 ]] table.insert(_gfx,love.graphics.newImage("resource/StepRightMotionBlur.png"))
  --[[     ]]
  --[[ 045 ]] table.insert(_gfx,love.graphics.newImage("resource/StepLeftPlaystationMotionBlur.png"))
  --[[     ]]
  --[[ 046 ]] table.insert(_gfx,love.graphics.newImage("resource/StepRightPlaystationMotionBlur.png"))
  --[[     ]]
  --[[ 001 ]] table.insert(_sfx,love.audio.newSource("resource/Routines/02KappaKappaShakeItUp/Tune.wav","static"))
  --[[     ]] 
  --[[ 001 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager0Dance Bounced.wav"))
  --[[     ]] 
  --[[ 002 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager1MoveLeft Bounced.wav"))
  --[[     ]] 
  --[[ 003 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager3MoveUp Bounced.wav"))
  --[[     ]] 
  --[[ 004 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager5ShakeLeft Bounced.wav"))
  --[[     ]] 
  --[[ 005 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager2MoveRight Bounced.wav"))
  --[[     ]] 
  --[[ 006 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager4MoveDown Bounced.wav"))
  --[[     ]] 
  --[[ 007 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager6ShakeRight Bounced.wav"))
  --[[     ]] 
  --[[ 008 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager7StepLeft Bounced.wav"))
  --[[     ]] 
  --[[ 009 ]] table.insert(_cfx,love.sound.newSoundData("resource/Routines/02KappaKappaShakeItUp/Micromanager8StepRight Bounced.wav"))
  --[[     ]]
  --[[ 001 ]] table.insert(_fnt,love.graphics.newImageFont("resource/KappaFont.png","abcdefghijklmnopqrstuvwxyz "))

  _controlMap={
  
  --[[ 001 ]] nil,

  --[[ 002 ]] 002, -- horizontal

  --[[ 000 ]] 003, -- vertical

  --[[ 000 ]] 004, -- shake

  --[[ 000 ]] 008, -- step

  --[[ 000 ]] 005, -- horizontal

  --[[ 000 ]] 006, -- vertical

  --[[ 000 ]] 007, -- shake

  --[[ 009 ]] 009, -- step
  
  }
  
  _controlOrder={{},{},{},{},{},{},{},{},{}}

  --[[ 01 ]] _controlOrder[2][1]={2,1} --  move 1 left  

  --[[ 02 ]] _controlOrder[2][2]={5,1} --  move 2 left  

  --[[ 03 ]] _controlOrder[5][1]={2,2} --  move 1 right 

  --[[ 04 ]] _controlOrder[5][2]={5,2} --  move 2 right 

  --[[ 05 ]] _controlOrder[3][1]={3,1} --  move 1 up    

  --[[ 06 ]] _controlOrder[3][2]={6,1} --  move 2 up    

  --[[ 07 ]] _controlOrder[6][1]={3,2} --  move 1 down  

  --[[ 08 ]] _controlOrder[6][2]={6,2} --  move 2 down  

  --[[ 09 ]] _controlOrder[4][1]={4,1} -- shake 1 left  

  --[[ 10 ]] _controlOrder[4][2]={7,1} -- shake 2 left  

  --[[ 11 ]] _controlOrder[7][1]={4,2} -- shake 1 right 

  --[[ 12 ]] _controlOrder[7][2]={7,2} -- shake 2 right 

  --[[ 13 ]] _controlOrder[8][1]={8,1} --  step 1 left  

  --[[ 14 ]] _controlOrder[8][2]={9,1} --  step 2 left  

  --[[ 15 ]] _controlOrder[9][1]={8,2} --  step 1 right 

  --[[ 16 ]] _controlOrder[9][2]={9,2} --  step 2 right 

  _moveMap={
  
  --[[ 001 ]] nil,
  --[[     ]]
  --[[ 002 ]] nil,
  --[[     ]]
  --[[ 003 ]] 003, -- keyboard
  --[[     ]]
  --[[ 004 ]] 004, -- keyboard
  --[[     ]]
  --[[ 005 ]] 005, -- keyboard
  --[[     ]]
  --[[ 006 ]] 006, -- keyboard
  --[[     ]]
  --[[ 007 ]] 007, -- keyboard
  --[[     ]]
  --[[ 008 ]] 008, -- keyboard
  --[[     ]]
  --[[ 009 ]] 039, -- keyboard
  --[[     ]]
  --[[ 010 ]] 040, -- keyboard
  --[[     ]]
  --[[ 011 ]] nil,
  --[[     ]]
  --[[ 012 ]] nil,
  --[[     ]]
  --[[ 013 ]] nil,
  --[[     ]]
  --[[ 014 ]] nil,
  --[[     ]]
  --[[ 015 ]] 015, -- playstation
  --[[     ]]
  --[[ 016 ]] 016, -- playstation
  --[[     ]]
  --[[ 017 ]] 017, -- playstation
  --[[     ]]
  --[[ 018 ]] 018, -- playstation
  --[[     ]]
  --[[ 019 ]] 019, -- playstation
  --[[     ]]
  --[[ 020 ]] 020, -- playstation
  --[[     ]]
  --[[ 021 ]] 041, -- playstation
  --[[     ]]
  --[[ 022 ]] 042, -- playstation
  --[[     ]]
  --[[ 023 ]] 021, -- keyboard blur
  --[[     ]]
  --[[ 024 ]] 022, -- keyboard blur
  --[[     ]]
  --[[ 025 ]] 023, -- keyboard blur
  --[[     ]]
  --[[ 026 ]] 024, -- keyboard blur
  --[[     ]]
  --[[ 027 ]] 025, -- keyboard blur
  --[[     ]]
  --[[ 028 ]] 026, -- keyboard blur
  --[[     ]]
  --[[ 029 ]] 043, -- keyboard blur
  --[[     ]]
  --[[ 030 ]] 044, -- keyboard blur
  --[[     ]]
  --[[ 031 ]] nil,
  --[[     ]]
  --[[ 032 ]] nil,
  --[[     ]]
  --[[ 033 ]] nil,
  --[[     ]]
  --[[ 034 ]] nil,
  --[[     ]]
  --[[ 035 ]] 033, -- playstation blur
  --[[     ]]
  --[[ 036 ]] 034, -- playstation blur
  --[[     ]]
  --[[ 037 ]] 035, -- playstation blur
  --[[     ]]
  --[[ 038 ]] 036, -- playstation blur
  --[[     ]]
  --[[ 039 ]] 037, -- playstation blur
  --[[     ]]
  --[[ 040 ]] 038, -- playstation blur
  --[[     ]]
  --[[ 041 ]] 045, -- playstation blur
  --[[     ]]
  --[[ 042 ]] 046, -- playstation blur
  --[[     ]]
  --[[ 043 ]] nil,
  --[[     ]]
  --[[ 044 ]] nil,
  --[[     ]]
  --[[ 045 ]] nil,
  --[[     ]]
  --[[ 046 ]] nil,
  --[[     ]]
  --[[ 047 ]] nil,
  --[[     ]]
  --[[ 048 ]] nil,
  --[[     ]]
  --[[ 049 ]] nil,
  --[[     ]]
  --[[ 050 ]] nil,
  
  }

  love.window.setMode(960,720)
  
  _blossom=setmetatable({},Blossom):init()
  
  _routine=setmetatable({},Routine):init()
  
  _feedback=setmetatable({},Feedback):init()
  
  _pauseMenu=setmetatable({},PauseMenu):init()
  
  _state=0
  
  _lastControlPosition={}
  
  _lastControlPositionUpdate={}
  
  _playbackSpeed=0
  
  _defaultPlaybackSpeed=.9
  
  _down=75

end

function _controlRemap(p,s)

  return _controlOrder[p][s][1],_controlOrder[p][s][2]

end

function love.draw()

  if _state==1 then

    love.graphics.clear(.5,.5,.5,1)
    
    love.graphics.draw(_gfx[9],0,0)
    
    _blossom:draw()
    
    _routine:draw()
    
    _feedback:draw()
    
    _pauseMenu:draw()
    
  else
  
    love.graphics.draw(_gfx[12],0,0)
  
  end

  _frame=_frame+1

end

function love.mousepressed(x,y,b,t)
  
  if _pauseMenu.active then
    
    _pauseMenu:mousePressed(x,y,b,t)
    
    return
  
  end

  if _playbackSpeed==0 then

    _playstationController=0
    
    if _state==1 then
    
      _blossom:mousePressed(x,y,b,t)
      
      _routine:mousePressed(x,y,b,t)
    
      _pauseMenu:mousePressed(x,y,b,t)
      
      if _routine:finished() then
      
        love.event.quit"restart"
      
      end
    
    else
    
      _start()
    
    end
      
  elseif _playbackSpeed<0 and _playbackSpeed==-(_down-1) then
    
    love.event.quit"restart"

  end

end

function love.keypressed(k,s,r)
  
  if _pauseMenu.active then
      
    _pauseMenu:keyPressed(k,s,r)
    
    return
  
  end

  if _playbackSpeed==0 then

    _playstationController=0
    
    if _state==1 then
    
      _blossom:keyPressed(k,s,r)
    
      _routine:keyPressed(k,s,r)
      
      _pauseMenu:keyPressed(k,s,r)
    
    end

  end

end

function love.gamepadpressed(j,b)
  
  if _pauseMenu.active then
  
    _pauseMenu:gamepadPressed(j,b)
    
    return
  
  end

  if _playbackSpeed==0 then

    _playstationController=12
    
    if _state==1 then
    
      _blossom:gamepadPressed(j,b)
    
      _routine:gamepadPressed(j,b)
      
      _pauseMenu:gamepadPressed(j,b)
      
      if _routine:finished() then
      
        love.event.quit"restart"
      
      end
    
    else
    
      _start()
    
    end
      
  elseif _playbackSpeed<0 and _playbackSpeed==-(_down-1) then
    
    love.event.quit"restart"
  
  end

end

function love.update(t)
  
  --if _pauseMenu.active then
  --
  --  return
  --  
  --else
  --    
  --  _pauseMenu:update(t)
  --  
  --  return
  --
  --end

  if _state==1 then


    
    --assert(_sfx[1]:isPlaying())
      
    _pauseMenu:update(t)

    if _playbackSpeed==0 then _routine:update(t) end
    
    local down=_down
    
    if _playbackSpeed<0 and _playbackSpeed>-(down-1) then
    
      _playbackSpeed=_playbackSpeed-1
      
      _sfx[1]:setPitch(_defaultPlaybackSpeed+_playbackSpeed/down*_defaultPlaybackSpeed)
      
    end
    
  end
    
end

function _start()

  _state=1
  
  _sfx[1]:play()
  
  _sfx[1]:setPitch(_defaultPlaybackSpeed)
  
  ---[[debug]]_fail()
  
  ---[[debug]]_routine:setProgress(44/100)

end

function _fail()

  _playbackSpeed=-1

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
  
  self.slip=0
  
  self.spriteYoinksOffset=30
  
  self.spriteYoinksEnable=0
  
  self.yoinks=0
  
  self.invincible=false

  return self

end

function Blossom:yoinksThat()

  self.yoinks=100

end

function Blossom:spriteYoinksEnabled()

  if self.yoinks>0 then return 1
  
  else return 0
  
  end

end

function Blossom:draw()

  if self.yoinks>0 then self.yoinks=self.yoinks-1 end
  
  local height=-math.sin(math.pi*(self.height/15))*64

  if _playbackSpeed<0 then
  
    local f=math.floor(_frame/7)%2
    
    local g=(math.abs(math.floor(_frame/3)%4-2))
    
    --local g=math.floor(_frame/5)%2
  
    local quad=love.graphics.newQuad(200*f,0,200,200,400,200)
  
    love.graphics.draw(_gfx[30],quad,g+self.x-self.flip*100,self.y+height,0,self.flip,1)
  
    return
  
  end
  
  local distance
  
  local speed=8

  if self.hopping then
  
    self.height=self.height+1
      
    
    
    if self.here then
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      love.graphics.draw(_gfx[self:spriteYoinksEnabled()*self.spriteYoinksOffset+1],quad,self.x-self.flip*100,self.y+height,0,self.flip,1)
      
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
      
      love.graphics.draw(_gfx[self:spriteYoinksEnabled()*self.spriteYoinksOffset+1],quad,self.x-self.flip*100,self.y+height,0,self.flip,1)
      
    else
    
    
      
      self.y=self.y+self.approach*speed
      
      local f=0
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      love.graphics.draw(_gfx[self:spriteYoinksEnabled()*self.spriteYoinksOffset+1],quad,self.x-self.flip*100,self.y+height,0,self.flip,1)
    
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
      
      local pChannel,sChannel = 1,1
      
      a=_cfx[pChannel]:getSample(si,sChannel)
      
      a=(a+1)/2
      
      local f=math.floor(a*6)%6
      
      local offset=4
      
      f=f+offset
      
      if f>=6 then f=f-6 end
      
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      local flip=self.flip
      
      love.graphics.draw(_gfx[self:spriteYoinksEnabled()*self.spriteYoinksOffset+1],quad,self.x-self.flip*100,self.y,0,flip,1)
      
    else
    
      local f=0
    
      local quad=love.graphics.newQuad(200*f,0,200,200,1200,200)
      
      local flip=self.flip
      
      love.graphics.draw(_gfx[self:spriteYoinksEnabled()*self.spriteYoinksOffset+1],quad,self.x-self.flip*100,self.y,0,flip,1)
    
    end
  
  end

  if self.slip>0 and self.slip<4 then
  
    for i=1,self.slip do
    
      if i>3 then break end

      love.graphics.draw(_gfx[27],-144+self.x+i*32,self.y+height)
  
    end
  
  end

end

function Blossom:mousePressed(x,y,b,t)

  if _singleAction and (b==1 or b==2) then
  
    self:shakeBack()
    
    return
  
  end

  if b==1 or b==4 then
  
    self:shakeLeft()
  
  elseif b==2 or b==5 then
  
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

function Blossom:oops()

  if not self.invincible then
  
    self:yoinksThat()
    
    self.slip=self.slip+1
    
    if _playbackSpeed==0 and self.slip>3 then
    
      _fail()
    
    end
  
  end

end

function Blossom:recover()

  if self.slip>0 then
  
    self.slip=self.slip-1
    
  end

end

Routine={}

Routine.__index=Routine

function Routine:init()

  self.score=0
  
  self.max=154
  
  self.lock=0
  
  self.cool=16
  
  self.snapToBeat=true
  
  self.stepPass=false
  
  self.range=7
  
  self.rangeOffset=0

  return self

end

function Routine:checkMoveLeft()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  local pChannel,sChannel=_controlMap[2],1
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  a=_cfx[pChannel]:getSample(si,sChannel)
  
  a=math.abs(a*100+self.rangeOffset)
  
  b=0
  
  local pChannel,sChannel=_controlMap[2+4],1
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  b=_cfx[pChannel]:getSample(si,sChannel)
  
  b=math.abs(b*100+self.rangeOffset)
  
  if a<self.range or b<self.range then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkMoveRight()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  local pChannel,sChannel=_controlMap[2],2
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  a=_cfx[pChannel]:getSample(si,sChannel)
  
  a=math.abs(a*100+self.rangeOffset)
  
  b=0
  
  local pChannel,sChannel=_controlMap[2+4],2
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  b=_cfx[pChannel]:getSample(si,sChannel)
  
  b=math.abs(b*100+self.rangeOffset)
  
  if a<self.range or b<self.range then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkMoveUp()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  local pChannel,sChannel=_controlMap[3],1
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  a=_cfx[pChannel]:getSample(si,sChannel)
  
  a=math.abs(a*100+self.rangeOffset)
  
  b=0
  
  local pChannel,sChannel=_controlMap[3+4],1
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  b=_cfx[pChannel]:getSample(si,sChannel)
  
  b=math.abs(b*100+self.rangeOffset)
  
  if a<self.range or b<self.range then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkMoveDown()

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  local pChannel,sChannel=_controlMap[3],2
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  a=_cfx[pChannel]:getSample(si,sChannel)
  
  a=math.abs(a*100+self.rangeOffset)
  
  b=0
  
  local pChannel,sChannel=_controlMap[3+4],2
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  b=_cfx[pChannel]:getSample(si,sChannel)
  
  b=math.abs(b*100+self.rangeOffset)
  
  if a<self.range or b<self.range then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkShake(channel,augment)

  if not augment then augment=0 end

  local a,b,si
  
  si=_sfx[1]:tell("samples")
  
  a=0
  
  local pChannel,sChannel=_controlMap[augment+4],channel
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  a=_cfx[pChannel]:getSample(si,sChannel)
  
  a=math.abs(a*100+self.rangeOffset)
  
  b=0
  
  local pChannel,sChannel=_controlMap[augment+4+4],channel
  
  pChannel,sChannel=_controlRemap(pChannel,sChannel)
  
  b=_cfx[pChannel]:getSample(si,sChannel)
  
  b=math.abs(b*100+self.rangeOffset)
  
  if a<self.range or b<self.range then
  
    return true
    
  else
  
    return false
  
  end

end

function Routine:checkShakeLeft()
  
  if self:checkShake(1) then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkShakeRight()
  
  if self:checkShake(2) then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkStepLeft()
  
  if self:checkShake(1,1) then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkStepRight()
  
  if self:checkShake(2,1) then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
  end

end

function Routine:checkShakeBack()
  
  if self:checkShake(1) or self:checkShake(2) then
  
    self.score=self.score+1
    
    self.stepPass=true
    
    _feedback:pass()
    
  else
  
    if not self.stepPass then _feedback:fail() end
    
    self.stepPass=true
  
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
                *tanh(          3.5*sin(16*pi*(x-.21875)     )  )
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
  
  local pChannel,sChannel = 1,1
  
  aB=_cfx[pChannel]:getSample(siB,sChannel)
  
  aB=(aB+1)/2
  
  aB=math.sin(math.pi*(aB+1))*22
  
  aBY=0
  
  local pChannel,sChannel = 1,1
  
  aBY=_cfx[pChannel]:getSample(siB,sChannel)
  
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
  
  
  
  self:drawMoves()
  
  self:drawTimeline()
  
  if self:finished() then
  
    local spicy=math.floor(percentage*4)+1
    
    if spicy>5 then spicy=5 end
    
    for i=1,spicy do
    
      love.graphics.draw(_gfx[13],-50+125*i,24)
    
    end
    
    love.graphics.draw(_gfx[14],160,382)
  
  end

end

function Routine:drawMoves()
  
  local limit=.5

  local bottomPosition=580-17
  
  local xOffset=20-1080
  
  local moveWidth=1080*2

  local a,si
  
  si=_sfx[1]:tell("samples")
  
  if _playbackSpeed==0 then
  
    local max=16
  
    for i=0,max-1 do
    
      ---[[debug]]if i>12 then break end
    
      local blur,blurOffset=0,0
    
      a=0
    
      local n=2+math.floor(i/2)
      
      local c=1
      
      if i%2~=0 then c=2 end
      
      local pChannel,sChannel=_controlMap[n],c
      
      pChannel,sChannel=_controlRemap(pChannel,sChannel)
    
      a=_cfx[pChannel]:getSample(si,sChannel)
      
      if self.snapToBeat then
      
        a=a*1.1
        
        a=a+.025
      
      end
      
      a=(a+1)/2
      
      if self.snapToBeat then
      
        a=self:waveShape(a)
      
      end
      
      xPosition=a*moveWidth+xOffset
      
      if self.snapToBeat and _lastControlPosition[max+1+i] and math.abs(xPosition-_lastControlPosition[i+1+max])>6 then
      
        blur,blurOffset=20,6
        
      end
      
      if _lastControlPosition[max+1+i] and (xPosition-_lastControlPosition[i+1+max])<limit then
    
        love.graphics.draw(_gfx[_moveMap[blur+_playstationController+3+(i%(max/2))]],xPosition,bottomPosition-blurOffset)
    
      end
    
      _lastControlPosition[i+1+max]=_lastControlPosition[i+1]
    
      _lastControlPosition[i+1]=xPosition
    
    end
  
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
    
  elseif b==4 then
  
    self:checkStepLeft()
    
  elseif b==5 then
  
    self:checkStepRight()
  
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

  if b=="a" then
  
    self:checkShakeLeft()
  
  elseif b=="x" then
  
    self:checkStepLeft()
  
  elseif b=="b" then
  
    self:checkShakeRight()
  
  elseif b=="y" then
  
    self:checkStepRight()
  
  end

end

function Routine:update(t)

  local a,si
  
  si=_sfx[1]:tell("samples")
  
  local max=16

  for i=0,max-1 do
  
    a=0
  
    local n=2+math.floor(i/2)
    
    local c=1
    
    if i%2~=0 then c=2 end
    
    local pChannel,sChannel=_controlMap[n],c
    
    pChannel,sChannel=_controlRemap(pChannel,sChannel)
    
    a=_cfx[pChannel]:getSample(si,sChannel)
    
    a=a*100+self.rangeOffset
    
    if _lastControlPositionUpdate[i+1] and _lastControlPositionUpdate[i+1]>-self.range and a<-self.range then
    
      if not self.stepPass then
      
        _feedback:fail()
      
      else
      
        self.stepPass=false
      
      end
    
    end
  
    _lastControlPositionUpdate[i+1+max]=_lastControlPositionUpdate[i+1]

    _lastControlPositionUpdate[i+1]=a
  
  end

end

function Routine:drawTimeline()

  local p=self:progress()
  
  if p==0 then p=1 end
  
  local x=p*896-70
  
  love.graphics.draw(_gfx[28],x,23)

end

function Routine:progress()

  local s=_sfx[1]
  
  return s:tell()/s:getDuration()

end

function Routine:setProgress(p)

  _sfx[1]:seek(_sfx[1]:getDuration()*p)

end

function Routine:finished()
  
  local p=self:progress()

  return (p==0 or p==1) and not _sfx[1]:isPlaying()

end

Feedback={}

Feedback.__index=Feedback

function Feedback:init()

  self.grade=0

  return self
  
end

function Feedback:pass()

  self.grade=30
  
  _blossom:recover()

end

function Feedback:fail()

  self.grade=-30
  
  _blossom:oops()

end

function Feedback:draw()

    if not _routine:finished() then

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

PauseMenu={}

PauseMenu.__index=PauseMenu

function PauseMenu:init()

  self.active=false
  
  self.debug=0

  return self

end

function PauseMenu:update(t)

end

function PauseMenu:draw()

  if self.active then
  
    love.graphics.setFont(_fnt[1])
    
    love.graphics.print("pause",280,320)
  
  end

end

function PauseMenu:mousePressed(x,y,b,t)

end

function PauseMenu:keyPressed(k,s,r)

  if k=="return" then
  
    --if _playbackSpeed==0 then
    --
    --  --print("_pauseMenu.debug=="..self.debug)
    --
    --  --_sfx[1]:pause()
    --
    --  if not self.active then _sfx[1]:pause() end
    --  
    --  if self.active then _sfx[1]:play() end
    --  
    --  self.active=not self.active
    --  
    --  self.debug=self.debug+1
    --
    --end
    
    self:flip()
    
  end

end

function PauseMenu:gamepadPressed(j,b)

  if b=="start" then
  
    self:flip()
    
  end

end

function PauseMenu:flip()
  
    if _playbackSpeed==0 then
    
      --print("_pauseMenu.debug=="..self.debug)
  
      --_sfx[1]:pause()
    
      if not self.active then _sfx[1]:pause() end
      
      if self.active then _sfx[1]:play() end
      
      self.active=not self.active
      
      self.debug=self.debug+1
    
    end



end

RoutineSelect={}

RoutineSelect.__index=RoutineSelect

function RoutineSelect:init()

  return self
  
end

function RoutineSelect:draw()

end

function RoutineSelect:mousePressed(x,y,b,t)

end

function RoutineSelect:keyPressed(k,s,r)

end

function RoutineSelect:gamepadPressed(j,b)

end