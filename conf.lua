_ios=true

function love.conf(t)

  --t.console=true
  
  --t.vsync=2
    
  --t.window.width=960
  
  --t.window.height=720
  
  if not _ios then
    
    t.window.width=1920
  
    t.window.height=1080
  
  else
    
    t.window.width=955
  
    t.window.height=440
  
  end
  
  t.window.borderless=true
  
  --t.window.usedpiscale=false
  
  --t.window.fullscreen=true
  
  --t.window.fullscreentype="exclusive"
  
  --t.window.resizable=true
  
    t.window.highdpi=true
  
    t.window.usedpiscale=true

end