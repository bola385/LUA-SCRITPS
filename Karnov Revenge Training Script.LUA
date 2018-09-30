local rb, rbs, rw, rws, rd = memory.readbyte, memory.readbytesigned, memory.readword, memory.readwordsigned, memory.readdword
local wb, ww, wd = memory.writebyte, memory.writeword, memory.writedword
auto = 1

function main()
  timercheat(0x103A70)
--0x100400
  
  health(0x1037B7,16,30,0xFF)  -- 1p vida
  health2(0x1039B7,253,30,0xFF) --2p vida

 

-- wb(0x100412,0x0F) -- P1 CP
-- wb (0xFF3003,0x01) -- P1 controle(1nd char)
-- wb (0xFF3803,0x01) -- P1 controle(2nd char)
-- wb (0xFF3403,0x01) -- P2 conrole (1nd char)
-- wb (0xFF3C03,0x01) -- P2 conrole (2nd char)
-- wb (0x100512,0x0F) -- P2 CP
-- wb nomusic (0xF026,0x00) -- no music1
-- wb nomusic (0xF027,0x00) -- no music2
-- wb (0xFF32C6,0x09) -- striker p1
-- wb (0xFF36C6,0x09) -- striker p2

--playermem(0x100400,16,28)

end

function playermem(adr,x,y)
--Size 0x100
--local PNT = rd(adr)
--[[
0x00 some pointer
0x04 Always 0x0500
0x06 
0x08 
0x0A 
0x0C Pointer that changes if an attack lands
0x12 Cpu flag = 0x0F
0x13 Controller
0x14
0x16

0x58 Flip bit(0x80)

0x6A Frame table pointer only points to idle animations
0x6E Counter

0x9A Projectile Pointer

0xFE

0x
]]

  local px = rw(adr + 0x20) --+ (rw(adr + 0x22)/0x10000)
  local py = rw(adr + 0x28) --+ (rw(adr + 0x2A)/0x10000)

  local walkspds = rws(adr + 0x34) + (rw(adr + 0x36)/0xFFFA)
--local walkfwd = rws(adr + 0x40) + (rw(adr + 0x42)/65530)

  gui.text(x,y,px)
  gui.text(x,y+16,walkspds)
  

end

function health(adr,x,y,maxhealth)
  gui.text(x,y,"Life: " .. rb(adr),0xffff00ff)

 if rb(adr) <= 15 then
    wb(adr, maxhealth)


  end
end






function health2(adr,x,y,maxhealth)
  gui.text(x,y,"Life: " .. rb(adr),0x00FF00FF)

  if rb(adr) <= 15 then
    wb(adr, maxhealth)
  

end
  end
function timercheat(adr)
--Timer
wb(adr,0x99)

  end



    
   





gui.register(function()
    main()
  end)
