_ios=true

_iOSRes={

  iPhoneDuo      ={0,0};

  iPhone18ProMax ={2868,1320};

  iPhone18Pro    ={0,0};

  iPhoneAir      ={0,0};

  iPhone17ProMax ={0,0};

  iPhone17Pro    ={2622,1206};

  iPhone17       ={0,0};

}

function _round(n)

  if n-math.floor(n)<.5 then
  
    return math.floor(n)
  
  else
  
    return math.ceil(n)
  
  end

end

function love.conf(t)

  --t.console=true
  
  --t.vsync=2
    
  --t.window.width=960
  
  --t.window.height=720
  
  if not _ios then
    
    t.window.width =1920
  
    t.window.height=1080
  
  else
  
    local ios=_iOSRes.iPhone17Pro
    
    t.window.width =_round(ios[1]*(955/2868))
  
    t.window.height=_round(ios[2]*(440/1320))
  
  end
  
  t.window.borderless=true
  
  --t.window.usedpiscale=false
  
  t.window.fullscreen=false
  
  --t.window.fullscreentype="exclusive"
  
  --t.window.resizable=true
  
    t.window.highdpi=true
  
    t.window.usedpiscale=true

end