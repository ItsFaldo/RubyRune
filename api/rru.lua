-- Program: RRuAPI
-- Author: Faldo
-- Description: RubyRune API

function ackaIN(s)
    local dt = fal.split(s,"-")
    local ackaX = "" local ackaZ = ""    
    for i=1,#dt[2] do
        ackaZ=ackaZ..numack(tonumber(string.sub(dt[2],i,i)))
    end
    dt[1]=tostring(os.epoch("utc")-dt[1])
    for i=1,#dt[1] do
        ackaX=ackaX..numack(tonumber(string.sub(dt[1],i,i)))
    end
    return ackaX.."-"..ackaZ
end

function ackaOUT(s)
    local dt = fal.split(s,"-")
    local ackaX = "" local ackaZ = ""    
    for i=1,#dt[2] do
        ackaZ=ackaZ..acknum(string.sub(dt[2],i,i))
    end
    for i=1,#dt[1] do
        ackaX=ackaX..acknum(string.sub(dt[1],i,i))
    end
    ackaX=tostring(os.epoch("utc")-ackaX)
    return ackaX.."-"..ackaZ
end

function numack(s)
    if s==0 then return "^" end
    if s==1 then return "g" end
    if s==2 then return "L" end
    if s==3 then return "%" end
    if s==4 then return "~" end
    if s==5 then return "c" end
    if s==6 then return "Z" end
    if s==7 then return "t" end
    if s==8 then return "$" end    
    if s==9 then return "`" end
end

function acknum(s)
    if s=="^" then return 0 end
    if s=="g" then return 1 end
    if s=="L" then return 2 end
    if s=="%" then return 3 end
    if s=="~" then return 4 end
    if s=="c" then return 5 end
    if s=="Z" then return 6 end
    if s=="t" then return 7 end
    if s=="$" then return 8 end    
    if s=="`" then return 9 end
end

b64 = {"A","B","C","D","E","F","G","H","I","J","K","L","M",
       "N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
       "a","b","c","d","e","f","g","h","i","j","k","l","m",
       "n","o","p","q","r","s","t","u","v","w","x","y","z",
       "0","1","2","3","4","5","6","7","8","9","_","."}
