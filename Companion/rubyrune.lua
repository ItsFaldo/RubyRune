-- Program: RRU-App
-- Author: Faldo
-- Description: RubyRune App

-- FUNCTIONS
function pbGet(id,file)
	local pb = http.get("http://pastebin.com/raw.php?i="..id)
	if pb then
		if fs.exists(file) then	fs.delete(file) end
		local pbf = fs.open(file,"w")
		pbf.write(pb.readAll())
		pbf.close() return true
	else return false end
end
function gitGet(url,file)
	local git = http.get("https://raw.githubusercontent.com/ItsFaldo/RubyRune/main/"..url)
	if git then
		if fs.exists(file) then fs.delete(file) end
		local gitf = fs.open(file,"w")
		gitf.write(git.readAll())
		gitf.close() return true
	else return false end
end

function drawUI(id)
	currentUI = id
	if state == 0 then
		if id == 0 then

		end
	end
end

-- DOWNLOAD REQUIRED FILES
if fs.exists("rubyrune/api/fal.lua") then else
	write("GET fal.lua") if pbGet("1gUjTCz6","rubyrune/api/fal.lua") then print(" [DONE]") else print(" [FAIL]") end end
if fs.exists("rubyrune/api/rru.lua") then else
	write("GET rru.lua") if gitGet("api/rru.lua","rubyrune/api/rru.lua") then print(" [DONE]") else print(" [FAIL]") end end
if fs.exists("rubyrune/data.tbl") then else
	write("GET data.tbl") if gitGet("Companion/DataTemplate.tbl","rubyrune/data.tbl") then print(" [DONE]") else print(" [FAIL]") end end

-- INIT & VARIBLES
os.loadAPI("rubyrune/api/fal.lua") os.loadAPI("rubyrune/api/rru.lua")
di=fal.devInfo() if di.type==0 and di.isWifi and di.isAdv then else
	print("An Advanced Wireless Pocket Computer is required!") error() end
data=fal.loadTbl("rubyrune/data.tbl")
rnet=rednet rnet.open(di.wifiSide) write("Fetching server list")
servIDs = rnet.lookup(data["settings"].defaultProt)
servID = nil servHost = nil servProt = nil
state = 0 currentUI = 0

-- START
term.setTextColor(colors.black)
term.setBackgroundColor(colors.green)
term.setCursorPos(1,1) term.clear()

-- MAIN LOOP
while true do
    event = {os.pullEvent()}
	if event[1] == "rednet_message" then
		
	elseif event[1] == "monitor_touch" then
		if state == 0 then
			if currentUI == 0 then

			end
		end
    end
end
