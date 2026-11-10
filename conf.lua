_ios=true

_iOSRes={

  iPhoneDuoOut      ={2034,1398};

  iPhoneDuoIn       ={2670,1878};

  iPhone18ProMax    ={2868,1320};

  iPhone18Pro       ={2622,1206};

  iPhoneAir         ={2736,1260};

  iPhone17ProMax    ={2868,1320};

  iPhone17Pro       ={2622,1206};

  iPhone17e         ={2532,1170};

  iPhone17          ={2622,1206};

  iPhone16ProMax    ={2868,1320};

  iPhone16Pro       ={2622,1206};

  iPhone16Plus      ={2796,1290};

  iPhone16e         ={2532,1170};

  iPhone16          ={2556,1179};

  iPhone15ProMax    ={2796,1290};

  iPhone15Pro       ={2556,1179};

  iPhone15Plus      ={2796,1290};

  iPhone15          ={2556,1179};

  iPhone14ProMax    ={2796,1290};

  iPhone14Pro       ={2556,1179};

  iPhone14Plus      ={2778,1284};

  iPhone14          ={2532,1170};

  iPhoneSE          ={1334,0750};

  iPhone13ProMax    ={2778,1284};

  iPhone13Pro       ={2532,1170};

  iPhone13Mini      ={2340,1080};

  iPhone13          ={2532,1170};

  iPadMiniA20Pr     ={2316,1512};

  iPadAir13InM4     ={2732,2048};

  iPadAir11InM4     ={2360,1640};

  iPadPro13InM5     ={2752,2064};

  iPadPro11InM5     ={2420,1668};

  iPadAir13InM3     ={2732,2048};

  iPadAir11InM3     ={2360,1640};

  iPadA16           ={2360,1640};

  iPadPro13InM4     ={2752,2064};

  iPadPro11InM4     ={2420,1668};

  iPadAir13InM2     ={2732,2048};

  iPadAir11InM2     ={2360,1640};

  iPadMiniA17Pro    ={2266,1488};

  iPadPro12_9InGen6 ={2732,2048};

  iPadPro11InGen4   ={2388,1668};

  iPadAirGen5       ={2360,1640};

  iPadGen10         ={2360,1640};

  iPadPro12_9InGen5 ={2732,2048};

  iPadPro11InGen3   ={2388,1668};

  iPadMiniGen6      ={2266,1488};

  iPadGen9          ={2160,1620};

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
  
    --local ios=_iOSRes.iPadGen9
    
    local ios=_iOSRes.iPhone17ProMax
    
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