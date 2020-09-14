--[[

brackHub V5

Developed by: brack4712


Description:
brackHub is an opensource GUI ran entirely on the clientside!

[ NOTICE ]: I am not responsible for anything you do with this GUI!

--]]

_G.Settings = {
["MAINCOLOR"]     = {Color3.fromRGB(255, 0, 0)};
["BUTTONCOLOR"]   = {Color3.fromRGB(200, 0, 0)};
["ACCENTCOLOR"]   = {Color3.fromRGB(196, 40, 28)};
["HIDESHOWCOLOR"] = {Color3.fromRGB(255, 1, 5)};
}

--[[
	
	brackHub V5
	
	Developed by: brack4712
	
	
	Description:
	brackHub is an opensource GUI ran entirely on the clientside!
	
	[ NOTICE ]: I am not responsible for anything you do with this GUI!
	
--]]


local ASSETS = game:GetObjects('rbxassetid://693559156')[1]
ASSETS.Parent = game.CoreGui


local SCRIPTS = {
	{"Rocky's Admin", ASSETS.rockys.Source};
	{"DEX Explorer", game:GetObjects("rbxassetid://418957341")[1].Source};
	{"Happy Button", ASSETS.sethspam.Source};
	{"Old Explorer", ASSETS.explorer.Source};
	{"Audio Visualizer", ASSETS.audiovisualizer.Source};
	{"Audio Visualizer 2", ASSETS.audiovisualizer2.Source};
	{"Bloxxy", ASSETS.bloxxy.Source};
	{"C00l GUI", ASSETS.coolgui.Source};
	{"FilterMyAss", ASSETS.fma.Source};
	{"Genkadda", ASSETS.genkadda.Source};
	{"iBtools", ASSETS.ibtools.Source};
	{"Iris Soldier", ASSETS.iris.Source};
	{"Knife V2", ASSETS.knife.Source};
	{"Prison Life Commands", ASSETS.plcommands.Source};
	{"ProtoScripter", ASSETS.protoscripter.Source};
	{"RemoteSpy", ASSETS.remotespy.Source};
	{"RoXploit 6.0", ASSETS.roxploit.Source};
	{"TopKek V2", ASSETS.topkek.Source};
	{"Trash Can", ASSETS.trashcan.Source};
	{"Trump Titan", ASSETS.trumptitan.Source};
}

-- DATAMODEL --

wait(1)

local _WORKSPACE = game:GetService("Workspace")
local _PLAYERS = game:GetService("Players")
local _LIGHTING = game:GetService("Lighting")
local _REPSTORAGE = game:GetService("ReplicatedStorage")
local RS = game:GetService("RunService").RenderStepped


local PARENT = game.CoreGui

local MAINCOLOR = _G.Settings["MAINCOLOR"][1]
local BTNCOLOR = _G.Settings["BUTTONCOLOR"][1]
local ACCENTCOLOR = _G.Settings["ACCENTCOLOR"][1]
local HIDE_SHOW = _G.Settings["HIDESHOWCOLOR"][1]

local LASTY = 0
local FIRSTTAB = true
local SELECTEDTAB = nil
local HIDDNE = false


local MAIN = Instance.new("ScreenGui",PARENT)
MAIN.Name = math.random(10000, 99999).."_brackHubV5"
local CONTAINER = Instance.new("Frame", MAIN)
CONTAINER.ClipsDescendants = true
CONTAINER.Size = UDim2.new(0, 600, 0, 400)
CONTAINER.Position = UDim2.new(0.5, -300, 0.5, -200)
CONTAINER.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
CONTAINER.BackgroundTransparency = 1
CONTAINER.BorderSizePixel = 0
CONTAINER.Active = true
CONTAINER.Draggable = true
local LOAD = Instance.new("ImageLabel", CONTAINER)
LOAD.ClipsDescendants = true
LOAD.Size = UDim2.new(0, 0, 0, 0)
LOAD.Position = UDim2.new(0.5, 0, 0.5, 0)
LOAD.Image = "http://www.roblox.com/asset/?id=631172870"
LOAD.BackgroundTransparency = 1
LOAD:TweenSizeAndPosition(UDim2.new(0, 700, 0, 600), UDim2.new(0.5, -350, 0.5, -300), "Out", "Quad", 0.2, true)
wait(0.2)
CONTAINER.BackgroundTransparency = 0
LOAD:Destroy()
local SIDEPANEL = Instance.new("Frame", CONTAINER)
SIDEPANEL.Size = UDim2.new(0, 125, 1, 0)
SIDEPANEL.Position = UDim2.new(-1, 0, 0, 0)
SIDEPANEL.BorderSizePixel = 0
SIDEPANEL.BackgroundColor3 = MAINCOLOR
SIDEPANEL.ZIndex = 10
SIDEPANEL.ClipsDescendants = true
local INFORMATION = Instance.new("Frame", CONTAINER)
INFORMATION.BackgroundTransparency = 1
INFORMATION.Size = UDim2.new(0.8, 0, 1, 0)
INFORMATION.Position = UDim2.new(-1, 0, 0, 0)
INFORMATION.ZIndex = 9
local INFORMATION_TITLE = Instance.new("TextLabel", INFORMATION)
INFORMATION_TITLE.BackgroundTransparency = 1
INFORMATION_TITLE.Size = UDim2.new(1, 0, 0, 50)
INFORMATION_TITLE.Position = UDim2.new(0, 0, 0, 10)
INFORMATION_TITLE.TextColor3 = ACCENTCOLOR
INFORMATION_TITLE.Font = Enum.Font.SourceSansBold
INFORMATION_TITLE.FontSize = Enum.FontSize.Size32
INFORMATION_TITLE.TextWrapped = true
INFORMATION_TITLE.Text = "INFORMATION"
INFORMATION_TITLE.ZIndex = 9
local INFORMATION_BODY = Instance.new("TextLabel", INFORMATION)
INFORMATION_BODY.BackgroundTransparency = 1
INFORMATION_BODY.Size = UDim2.new(0.8, 0, 0.8, 0)
INFORMATION_BODY.Position = UDim2.new(0.1, 0, 0.1, 0)
INFORMATION_BODY.TextColor3 = BTNCOLOR
INFORMATION_BODY.Font = Enum.Font.SourceSans
INFORMATION_BODY.FontSize = Enum.FontSize.Size18
INFORMATION_BODY.TextWrapped = true
INFORMATION_BODY.Text = "brackHub V5\r\n\r\nbrackHub V5 is a GUI created by brack4712.\r\n\r\nbrackHub was designed with the user in mind, to provide simple and efficient access to the scripts and commands you want, when you want them."
INFORMATION_BODY.ZIndex = 9
function CREATETAB(name)
	local BTN_SAVED = nil
	if FIRSTTAB then
		BTN_SAVED = LASTY + 80
	else
		BTN_SAVED = LASTY + 40
	end
	local BTN = Instance.new("TextButton", SIDEPANEL)
	BTN.BorderSizePixel = 0
	BTN.BackgroundColor3 = BTNCOLOR
	BTN.Size = UDim2.new(0, 100, 0, 30)
	if FIRSTTAB then
		BTN.Position = UDim2.new(-1, 0, 0, LASTY + 80)
	else
		BTN.Position = UDim2.new(-1, 0, 0, LASTY + 40)
	end
	BTN.TextColor3 = Color3.new(255/255, 255/255, 255/255)
	BTN.Text = name
	BTN.Font = Enum.Font.SourceSansLight
	BTN.FontSize = Enum.FontSize.Size18
	BTN.TextWrapped = true
	BTN.ZIndex = 10
	BTN.AutoButtonColor = false
	local STYLEBAR = Instance.new("Frame", BTN)
	STYLEBAR.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
	STYLEBAR.BorderSizePixel = 0
	STYLEBAR.Size = UDim2.new(0.9, 0, 0, 2)
	STYLEBAR.Position = UDim2.new(0.05, 0, 0.92, 0)
	STYLEBAR.ZIndex = 10
	local FRAME = Instance.new("Frame", CONTAINER)
	FRAME.Name = name
	FRAME.BackgroundTransparency = 1
	FRAME.Size = UDim2.new(0.8, 0, 1, 0)
	FRAME.Position = UDim2.new(-1, 0, 0, 0)
	FRAME.ZIndex = 2
	if FIRSTTAB then
		BTN:TweenPosition(UDim2.new(0, 0, 0, LASTY + 80), "Out", "Quad", 0.2, true)
	else
		BTN:TweenPosition(UDim2.new(0, 0, 0, LASTY + 40), "Out", "Quad", 0.2, true)
	end
	BTN.MouseEnter:connect(function()
		STYLEBAR:TweenSizeAndPosition(UDim2.new(1, 0, 0, 2), UDim2.new(0, 0, 0.92, 0), "Out", "Quad", 0.2, true)
	end)
	BTN.MouseLeave:connect(function()
		STYLEBAR:TweenSizeAndPosition(UDim2.new(0.9, 0, 0, 2), UDim2.new(0.05, 0, 0.92, 0), "Out", "Quad", 0.2, true)
	end)
	BTN.MouseButton1Down:connect(function(x, y)
		for _,v in next, SIDEPANEL:GetChildren() do
			if v.ClassName == "TextButton" then
				if v.Name ~= "HIDE" then
					v:TweenSizeAndPosition(UDim2.new(0, 100, 0, 30), UDim2.new(0, 0, 0, v.Position.Y.Offset), "Out", "Quad", 0.2, true)
					v.Frame:TweenSizeAndPosition(UDim2.new(0.9, 0, 0, 2), UDim2.new(0.05, 0, 0.9, 0), "Out", "Quad", 0.2, true)
					v.BackgroundColor3 = BTNCOLOR
				end
			end
		end
		STYLEBAR:TweenSizeAndPosition(UDim2.new(1, 0, 0, 2), UDim2.new(0, 0, 0.92, 0), "Out", "Quad", 0.2, true)
		BTN:TweenSizeAndPosition(UDim2.new(0, 110, 0, 30), UDim2.new(0, 0, 0, BTN.Position.Y.Offset), "Out", "Quad", 0.2, true)
		BTN.BackgroundColor3 = ACCENTCOLOR
		if SELECTEDTAB == nil then
			INFORMATION:TweenPosition(UDim2.new(2, 0, 0, 0), "Out", "Quad", 0.2, true)
			if FRAME == CONTAINER.SCRIPTS then
				FRAME:TweenPosition(UDim2.new(0.2, 0, 0, 0), "Out", "Quad", 0.2, true)
				wait(0.2)
				for _,v in next, CONTAINER.SCRIPTS.ScrollingFrame:GetChildren() do
					if v.ClassName == "TextButton" then
						local LOAD_S = Instance.new("ImageLabel", v)
						LOAD_S.ClipsDescendants = true
						LOAD_S.Size = UDim2.new(0, 0, 0, 0)
						LOAD_S.Position = UDim2.new(0.5, 0, 0.5, 0)
						LOAD_S.Image = "http://www.roblox.com/asset/?id=631172870"
						LOAD_S.ImageColor3 = BTNCOLOR
						LOAD_S.BackgroundTransparency = 1
						LOAD_S:TweenSizeAndPosition(UDim2.new(0, 200, 0, 200), UDim2.new(0.5, -100, 0.5, -100), "Out", "Quad", 0.2, true)
						wait(0.02)
						v.BackgroundTransparency = 0
						v.TextTransparency = 0
						LOAD_S:Destroy()
					end
				end
			end
			SELECTEDTAB = FRAME
		elseif SELECTEDTAB == FRAME then
		elseif SELECTEDTAB == CONTAINER.SCRIPTS then
			for _,v in next, CONTAINER.SCRIPTS.ScrollingFrame:GetChildren() do
				if v.ClassName == "TextButton" then
					local LOAD_S = Instance.new("ImageLabel", v)
					LOAD_S.ClipsDescendants = true
					LOAD_S.Size = UDim2.new(0, 200, 0, 200)
					LOAD_S.Position = UDim2.new(0.5, -100, 0.5, -100)
					LOAD_S.Image = "http://www.roblox.com/asset/?id=631172870"
					LOAD_S.ImageColor3 = BTNCOLOR
					LOAD_S.BackgroundTransparency = 1
					v.BackgroundTransparency = 1
					v.TextTransparency = 1
					LOAD_S:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.2, true)
					wait(0.02)
					LOAD_S:Destroy()
				end
			end
			SELECTEDTAB:TweenPosition(UDim2.new(2, 0, 0, 0), "Out", "Quad", 0.2, true)
			FRAME:TweenPosition(UDim2.new(0.2, 0, 0, 0), "Out", "Quad", 0.2, true)
			wait(0.2)
			SELECTEDTAB.Position = UDim2.new(-1, 0, 0, 0)
			SELECTEDTAB = FRAME
		else
			if FRAME == CONTAINER.SCRIPTS then
				SELECTEDTAB:TweenPosition(UDim2.new(2, 0, 0, 0), "Out", "Quad", 0.2, true)
				FRAME:TweenPosition(UDim2.new(0.2, 0, 0, 0), "Out", "Quad", 0.2, true)
				wait(0.2)
				SELECTEDTAB.Position = UDim2.new(-1, 0, 0, 0)
				SELECTEDTAB = FRAME
				for _,v in next, CONTAINER.SCRIPTS.ScrollingFrame:GetChildren() do
					if v.ClassName == "TextButton" then
						local LOAD_S = Instance.new("ImageLabel", v)
						LOAD_S.ClipsDescendants = true
						LOAD_S.Size = UDim2.new(0, 0, 0, 0)
						LOAD_S.Position = UDim2.new(0.5, 0, 0.5, 0)
						LOAD_S.Image = "http://www.roblox.com/asset/?id=631172870"
						LOAD_S.ImageColor3 = BTNCOLOR
						LOAD_S.BackgroundTransparency = 1
						LOAD_S:TweenSizeAndPosition(UDim2.new(0, 200, 0, 200), UDim2.new(0.5, -100, 0.5, -100), "Out", "Quad", 0.2, true)
						wait(0.02)
						v.BackgroundTransparency = 0
						v.TextTransparency = 0
						LOAD_S:Destroy()
					end
				end
			else
				SELECTEDTAB:TweenPosition(UDim2.new(2, 0, 0, 0), "Out", "Quad", 0.2, true)
				FRAME:TweenPosition(UDim2.new(0.2, 0, 0, 0), "Out", "Quad", 0.2, true)
				wait(0.2)
				SELECTEDTAB.Position = UDim2.new(-1, 0, 0, 0)
				SELECTEDTAB = FRAME
			end
		end
	end)
	LASTY = LASTY + 40
	wait(0.2)
	return FRAME
end
function CREATETITLE(parent, text)
	if parent == CONTAINER.SCRIPTS then
		local TITLE = Instance.new("TextLabel", parent)
		TITLE.BackgroundTransparency = 0
		TITLE.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
		TITLE.BorderSizePixel = 0
		TITLE.Size = UDim2.new(1, 0, 0, 60)
		TITLE.Position = UDim2.new(0, 0, 0, 0)
		TITLE.TextColor3 = ACCENTCOLOR
		TITLE.Font = Enum.Font.SourceSansBold
		TITLE.FontSize = Enum.FontSize.Size32
		TITLE.TextWrapped = true
		TITLE.Text = text
		TITLE.ZIndex = 9
	else
		local TITLE = Instance.new("TextLabel", parent)
		TITLE.BackgroundTransparency = 1
		TITLE.Size = UDim2.new(1, 0, 0, 50)
		TITLE.Position = UDim2.new(0, 0, 0, 10)
		TITLE.TextColor3 = ACCENTCOLOR
		TITLE.Font = Enum.Font.SourceSansBold
		TITLE.FontSize = Enum.FontSize.Size32
		TITLE.TextWrapped = true
		TITLE.Text = text
		TITLE.ZIndex = 9
	end
end
local TITLE = Instance.new("TextLabel", SIDEPANEL)
TITLE.Size = UDim2.new(1, 0, 0, 50)
TITLE.Position = UDim2.new(0, 0, 0, 0)
TITLE.BackgroundTransparency = 1
TITLE.TextColor3 = Color3.new(255/255, 255/255, 255/255)
TITLE.Text = "brackHub V5"
TITLE.Font = Enum.Font.SourceSansLight
TITLE.FontSize = Enum.FontSize.Size24
TITLE.TextWrapped = true
TITLE.ZIndex = 10
local CREDITS = Instance.new("TextLabel", SIDEPANEL)
CREDITS.Size = UDim2.new(1, 0, 0, 50)
CREDITS.Position = UDim2.new(0, 0, 0, 20)
CREDITS.BackgroundTransparency = 1
CREDITS.TextColor3 = Color3.new(255/255, 255/255, 255/255)
CREDITS.Text = "by: brack4712"
CREDITS.Font = Enum.Font.SourceSansItalic
CREDITS.FontSize = Enum.FontSize.Size12
CREDITS.TextWrapped = true
CREDITS.ZIndex = 10
SIDEPANEL:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.2, true)
wait(0.2)
INFORMATION:TweenPosition(UDim2.new(0.2, 0, 0, 0), "Out", "Quad", 0.2, true)
local SCRIPTSTAB = CREATETAB("SCRIPTS")
local SCRIPTS_TITLE = CREATETITLE(SCRIPTSTAB, "SCRIPTS")
local SCRIPTS_CONTAINER = Instance.new("ScrollingFrame", SCRIPTSTAB)
SCRIPTS_CONTAINER.BackgroundTransparency = 1
SCRIPTS_CONTAINER.ZIndex = 8
SCRIPTS_CONTAINER.BorderSizePixel = 0
SCRIPTS_CONTAINER.Size = UDim2.new(1, 0, 1, 0)
local COMMANDSTAB = CREATETAB("COMMANDS")
local COMMANDS_TITLE = CREATETITLE(COMMANDSTAB, "COMMANDS")
local COMMANDS_BODY = Instance.new("TextLabel", COMMANDSTAB)
COMMANDS_BODY.BackgroundTransparency = 1
COMMANDS_BODY.Size = UDim2.new(0.8, 0, 0.8, 0)
COMMANDS_BODY.Position = UDim2.new(0.1, 0, 0.1, 0)
COMMANDS_BODY.TextColor3 = BTNCOLOR
COMMANDS_BODY.Font = Enum.Font.SourceSans
COMMANDS_BODY.FontSize = Enum.FontSize.Size18
COMMANDS_BODY.TextWrapped = true
COMMANDS_BODY.Text = "brackHub V5 Commands\r\n\r\nCommands are coming in a future update.\r\n\r\nI am too lazy to make this page right now."
COMMANDS_BODY.ZIndex = 9
local CREDITSTAB = CREATETAB("CREDITS")
local CREDITS_TITLE = CREATETITLE(CREDITSTAB, "CREDITS")
local CREDITS_BODY = Instance.new("TextLabel", CREDITSTAB)
CREDITS_BODY.BackgroundTransparency = 1
CREDITS_BODY.Size = UDim2.new(0.8, 0, 0.8, 0)
CREDITS_BODY.Position = UDim2.new(0.1, 0, 0.1, 0)
CREDITS_BODY.TextColor3 = BTNCOLOR
CREDITS_BODY.Font = Enum.Font.SourceSans
CREDITS_BODY.FontSize = Enum.FontSize.Size18
CREDITS_BODY.TextWrapped = true
CREDITS_BODY.Text = "brackHub V5 Credits\r\n\r\nbrack4712 - Developing brackHub\r\n3dsboy08 - Great friend\r\nAll of Raindrop Community\r\n\r\nALL SCRIPTS BELONG TO THEIR RIGHTFUL OWERNS!\r\n\r\nScript additions/removals: brack4712#1370.\r\n\r\nFixing a couple of things: Reselim#7054\r\n\r\nHave fun!"
CREDITS_BODY.ZIndex = 9
local LASTY_S = 40
local LASTX_S = 30
local SCRIPT_NUM = 0
local SCRIPT_NUM_VALS = {5, 10, 15, 20}
local MOVEDOWN1 = false
local MOVEDOWN2 = false
local MOVEDOWN3 = false
local MOVEDOWN3 = false
local MOVEDOWN4 = false
function CREATESCRIPTS()
	for _,v in next, SCRIPTS do
		local NEWSCRIPT = Instance.new("TextButton", SCRIPTS_CONTAINER)
		NEWSCRIPT.BackgroundTransparency = 1
		NEWSCRIPT.TextTransparency = 1
		NEWSCRIPT.ClipsDescendants = true
		NEWSCRIPT.Name = v[1]
		NEWSCRIPT.BorderSizePixel = 0
		NEWSCRIPT.BackgroundColor3 = BTNCOLOR
		NEWSCRIPT.Size = UDim2.new(0, 100, 0, 30)
		local XP,YP = SCRIPT_NUM%4,math.floor(SCRIPT_NUM/4)
		NEWSCRIPT.Position = UDim2.new(0, (XP * 110) + 25, 0, (YP * 40) + 70)
		SCRIPT_NUM = SCRIPT_NUM + 1
		NEWSCRIPT.TextColor3 = Color3.new(255/255, 255/255, 255/255)
		NEWSCRIPT.Text = v[1]
		NEWSCRIPT.Font = Enum.Font.SourceSansLight
		NEWSCRIPT.FontSize = Enum.FontSize.Size18
		NEWSCRIPT.TextWrapped = true
		NEWSCRIPT.ZIndex = 8
		NEWSCRIPT.AutoButtonColor = false
		LASTX_S = LASTX_S + 110
		local STYLEBAR_SCR = Instance.new("Frame", NEWSCRIPT)
		STYLEBAR_SCR.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
		STYLEBAR_SCR.BorderSizePixel = 0
		STYLEBAR_SCR.Size = UDim2.new(0.9, 0, 0, 2)
		STYLEBAR_SCR.Position = UDim2.new(0.05, 0, 0.92, 0)
		STYLEBAR_SCR.ZIndex = 8
		NEWSCRIPT.MouseEnter:connect(function()
			STYLEBAR_SCR:TweenSizeAndPosition(UDim2.new(1, 0, 0, 2), UDim2.new(0, 0, 0.92, 0), "Out", "Quad", 0.2, true)
		end)
		NEWSCRIPT.MouseLeave:connect(function()
			STYLEBAR_SCR:TweenSizeAndPosition(UDim2.new(0.9, 0, 0, 2), UDim2.new(0.05, 0, 0.92, 0), "Out", "Quad", 0.2, true)
		end)
		NEWSCRIPT.MouseButton1Down:connect(function(x, y)
			loadstring(v[2])()
			local FX = Instance.new("ImageLabel",NEWSCRIPT)
			FX.Size = UDim2.new(0, 0, 0, 0);
			FX.Position = UDim2.new(0, x - 0, 0, y - 35) - UDim2.new(0, NEWSCRIPT.AbsolutePosition.X, 0, NEWSCRIPT.AbsolutePosition.Y);
			FX.Image = "http://www.roblox.com/asset/?id=200182847";
			FX.BackgroundTransparency = 1;
			FX.ImageColor3 = ACCENTCOLOR
			FX.ZIndex =	NEWSCRIPT.ZIndex;
			FX.Name = "brackHub_click_fx";
			FX:TweenSizeAndPosition(UDim2.new(0, 200, 0, 200), FX.Position - UDim2.new(0, 100, 0, 100), 'Out', 'Quart', 0.2, true)
			for i=0, 1, .05 do
				FX.ImageTransparency = i
				RS:wait()
			end
			FX:Destroy()
		end)
	end
end

CREATESCRIPTS()

-- LAST BUTTON --
local HIDE = Instance.new("TextButton", SIDEPANEL)
HIDE.Name = "HIDE"
HIDE.BorderSizePixel = 0
HIDE.BackgroundColor3 = HIDE_SHOW
HIDE.Size = UDim2.new(0, 100, 0, 30)
HIDE.Position = UDim2.new(-1, 0, 0.9, 0)
HIDE.TextColor3 = Color3.new(255/255, 255/255, 255/255)
HIDE.Text = "HIDE"
HIDE.Font = Enum.Font.SourceSansLight
HIDE.FontSize = Enum.FontSize.Size18
HIDE.TextWrapped = true
HIDE.ZIndex = 10
HIDE.AutoButtonColor = false
HIDE:TweenPosition(UDim2.new(0, 0, 0.9, 0), "Out", "Quad", 0.2, true)
local STYLEBAR_H = Instance.new("Frame", HIDE)
STYLEBAR_H.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
STYLEBAR_H.BorderSizePixel = 0
STYLEBAR_H.Size = UDim2.new(0.9, 0, 0, 2)
STYLEBAR_H.Position = UDim2.new(0.05, 0, 0.92, 0)
STYLEBAR_H.ZIndex = 10
HIDE.MouseEnter:connect(function()
	STYLEBAR_H:TweenSizeAndPosition(UDim2.new(1, 0, 0, 2), UDim2.new(0, 0, 0.92, 0), "Out", "Quad", 0.2, true)
end)
HIDE.MouseLeave:connect(function()
	STYLEBAR_H:TweenSizeAndPosition(UDim2.new(0.9, 0, 0, 2), UDim2.new(0.05, 0, 0.92, 0), "Out", "Quad", 0.2, true)
end)
HIDE.MouseButton1Down:connect(function(x,y)
	SIDEPANEL:TweenPosition(UDim2.new(-1, 0, 0, 0), "Out", "Quad", 0.2, true)
	if SELECTEDTAB ~= nil then
		SELECTEDTAB:TweenPosition(UDim2.new(2, 0, 0, 0), "Out", "Quad", 0.2, true)
		wait(0.2)
		SELECTEDTAB.Position = UDim2.new(-1, 0, 0, 0)
	else
		INFORMATION:TweenPosition(UDim2.new(2, 0, 0, 0), "Out", "Quad", 0.2, true)
		wait(0.2)
		INFORMATION.Position = UDim2.new(-1, 0, 0, 0)
	end
	local LOAD2 = Instance.new("ImageLabel", CONTAINER)
	LOAD2.ClipsDescendants = true
	LOAD2.Size = UDim2.new(0, 700, 0, 600)
	LOAD2.Position = UDim2.new(0.5, -350, 0.5, -300)
	LOAD2.Image = "http://www.roblox.com/asset/?id=631172870"
	LOAD2.BackgroundTransparency = 1
	CONTAINER.BackgroundTransparency = 1
	LOAD2:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.2, true)
	wait(0.2)
	CONTAINER.Size = UDim2.new(0, 100, 0, 30)
	CONTAINER.Position = UDim2.new(0.5, -50, 0.5, -15)
	for _,v in next, CONTAINER:GetChildren() do
		v.Visible = false
	end
	wait(0.2)
	local SHOW = Instance.new("TextButton", CONTAINER)
	SHOW.Visible = false
	SHOW.Name = "SHOW"
	SHOW.ClipsDescendants = true
	SHOW.BorderSizePixel = 0
	SHOW.BackgroundColor3 = HIDE_SHOW
	SHOW.Size = UDim2.new(0, 100, 0, 30)
	SHOW.Position = UDim2.new(0, 0, 0, 0)
	SHOW.TextColor3 = Color3.new(255/255, 255/255, 255/255)
	SHOW.Text = "SHOW"
	SHOW.Font = Enum.Font.SourceSansLight
	SHOW.FontSize = Enum.FontSize.Size18
	SHOW.TextWrapped = true
	SHOW.ZIndex = 10
	SHOW.AutoButtonColor = false
	local STYLEBAR_S = Instance.new("Frame", SHOW)
	STYLEBAR_S.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
	STYLEBAR_S.BorderSizePixel = 0
	STYLEBAR_S.Size = UDim2.new(0.9, 0, 0, 2)
	STYLEBAR_S.Position = UDim2.new(0.05, 0, 0.92, 0)
	STYLEBAR_S.ZIndex = 10
	SHOW.MouseEnter:connect(function()
		STYLEBAR_S:TweenSizeAndPosition(UDim2.new(1, 0, 0, 2), UDim2.new(0, 0, 0.92, 0), "Out", "Quad", 0.2, true)
	end)
	SHOW.MouseLeave:connect(function()
		STYLEBAR_S:TweenSizeAndPosition(UDim2.new(0.9, 0, 0, 2), UDim2.new(0.05, 0, 0.92, 0), "Out", "Quad", 0.2, true)
	end)
	SHOW.MouseButton1Down:connect(function(x, y)
		CONTAINER:TweenPosition(UDim2.new(0.5, -50, 0.5, -15), "Out", "Quad", 0.2, true)
		wait(0.2)
		local LOAD4 = Instance.new("ImageLabel", CONTAINER)
		LOAD4.ClipsDescendants = true
		LOAD4.Size = UDim2.new(0, 200, 0, 60)
		LOAD4.Position = UDim2.new(0.5, -100, 0.5, -30)
		LOAD4.Image = "http://www.roblox.com/asset/?id=631172870"
		LOAD4.ImageColor3 = HIDE_SHOW
		LOAD4.BackgroundTransparency = 1
		SHOW.Visible = false
		LOAD4:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "Out", "Quad", 0.2, true)
		wait(0.2)
		CONTAINER.Size = UDim2.new(0, 600, 0, 400)
		CONTAINER.Position = UDim2.new(0.5, -300, 0.5, -200)
		for _,v in next, CONTAINER:GetChildren() do
			if v.Name ~= "SHOW" then
				v.Visible = true
			end
		end
		local LOAD = Instance.new("ImageLabel", CONTAINER)
		LOAD.ClipsDescendants = true
		LOAD.Size = UDim2.new(0, 0, 0, 0)
		LOAD.Position = UDim2.new(0.5, 0, 0.5, 0)
		LOAD.Image = "http://www.roblox.com/asset/?id=631172870"
		LOAD.BackgroundTransparency = 1
		LOAD:TweenSizeAndPosition(UDim2.new(0, 700, 0, 600), UDim2.new(0.5, -350, 0.5, -300), "Out", "Quad", 0.2, true)
		wait(0.2)
		CONTAINER.BackgroundTransparency = 0
		LOAD:Destroy()
		SIDEPANEL:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.2, true)
		wait(0.2)
		if SELECTEDTAB ~= nil then
			SELECTEDTAB:TweenPosition(UDim2.new(0.2, 0, 0, 0), "Out", "Quad", 0.2, true)
		else
			INFORMATION:TweenPosition(UDim2.new(0.2, 0, 0, 0), "Out", "Quad", 0.2, true)
		end
	end)
	local LOAD3 = Instance.new("ImageLabel", CONTAINER)
	LOAD3.ClipsDescendants = true
	LOAD3.Size = UDim2.new(0, 0, 0, 0)
	LOAD3.Position = UDim2.new(0.5, 0, 0.5, 0)
	LOAD3.Image = "http://www.roblox.com/asset/?id=631172870"
	LOAD3.ImageColor3 = HIDE_SHOW
	LOAD3.BackgroundTransparency = 1
	LOAD3:TweenSizeAndPosition(UDim2.new(0, 200, 0, 60), UDim2.new(0.5, -100, 0.5, -30), "Out", "Quad", 0.2, true)
	wait(0.2)
	SHOW.Visible = true
	LOAD3:Destroy()
	CONTAINER:TweenPosition(UDim2.new(0, 0, 0.8, 0), "Out", "Quad", 0.2, true)
end)