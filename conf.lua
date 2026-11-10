_ios=true

_iOSRes={

  iPhoneDuoOut   ={2034,1398};
  iPhoneDuoIn    ={2670,1878};
  iPhone18ProMax ={2868,1320};
  iPhone18Pro    ={2622,1206};
  iPhoneAir      ={2736,1260};
  iPhone17ProMax ={2868,1320};
  iPhone17Pro    ={2622,1206};
  iPhone17e      ={2532,1170};
  iPhone17       ={2622,1206};
  iPhone16ProMax ={   0,   0};
  iPhone16Pro    ={   0,   0};
  iPhone16Plus   ={   0,   0};
  iPhone16e      ={   0,   0};
  iPhone16       ={   0,   0};
  iPhone15ProMax ={   0,   0};
  iPhone15Pro    ={   0,   0};
  iPhone15Plus   ={   0,   0};
  iPhone15       ={   0,   0};
  iPhone14ProMax ={   0,   0};
  iPhone14Pro    ={   0,   0};
  iPhone14Plus   ={   0,   0};
  iPhone14       ={   0,   0};
  iPhoneSE       ={   0,   0};
  iPhone13ProMax ={   0,   0};
  iPhone13Pro    ={   0,   0};
  iPhone13Mini   ={2340,1080};--2021
  iPhone13       ={2532,1170};--2021

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