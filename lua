--// PLS DONATE SCRIPT UI (FINAL UPDATED VERSION)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer

pcall(function()
	game.CoreGui:FindFirstChild("MM2_SMALL_UI"):Destroy()
end)

---------------------------------------------------
-- GUI
---------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "MM2_SMALL_UI"
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

---------------------------------------------------
-- MAIN FRAME
---------------------------------------------------

local main = Instance.new("Frame")
main.Parent = gui

main.Size = UDim2.new(0,230,0,370)
main.Position = UDim2.new(0.5,-115,0.5,-185)

main.BackgroundColor3 = Color3.fromRGB(8,8,8)
main.BackgroundTransparency = 0.08
main.BorderSizePixel = 0
main.Active = true

Instance.new("UICorner",main).CornerRadius = UDim.new(0,16)

local stroke = Instance.new("UIStroke")
stroke.Parent = main
stroke.Color = Color3.fromRGB(255,130,0)
stroke.Thickness = 2

---------------------------------------------------
-- DRAG SYSTEM
---------------------------------------------------

local dragging = false
local dragInput
local dragStart
local startPos

main.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1 then

		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()

			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end

		end)
	end
end)

main.InputChanged:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end

end)

UserInputService.InputChanged:Connect(function(input)

	if input == dragInput and dragging then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)

	end
end)

---------------------------------------------------
-- TITLE
---------------------------------------------------

local title = Instance.new("TextLabel")
title.Parent = main

title.Size = UDim2.new(1,0,0,42)
title.BackgroundTransparency = 1

title.Text = "🔥RIVALS SCRIPT🔥"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,140,0)

---------------------------------------------------
-- CLOSE BUTTON
---------------------------------------------------

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = main

closeBtn.Size = UDim2.new(0,28,0,28)
closeBtn.Position = UDim2.new(1,-35,0,7)

closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold

closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.BorderSizePixel = 0

Instance.new("UICorner",closeBtn).CornerRadius = UDim.new(1,0)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

---------------------------------------------------
-- LINE
---------------------------------------------------

local line = Instance.new("Frame")
line.Parent = main

line.Size = UDim2.new(0.78,0,0,2)
line.Position = UDim2.new(0.11,0,0,40)

line.BackgroundColor3 = Color3.fromRGB(255,140,0)
line.BorderSizePixel = 0

---------------------------------------------------
-- AVATAR
---------------------------------------------------

local avatar = Instance.new("ImageLabel")
avatar.Parent = main

avatar.Size = UDim2.new(0,82,0,82)
avatar.Position = UDim2.new(0.5,-41,0,55)

avatar.BackgroundTransparency = 0
avatar.BackgroundColor3 = Color3.fromRGB(255,255,255)

avatar.ClipsDescendants = true

local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420

local content = Players:GetUserThumbnailAsync(
	player.UserId,
	thumbType,
	thumbSize
)

avatar.Image = content

Instance.new("UICorner",avatar).CornerRadius = UDim.new(1,0)

local avstroke = Instance.new("UIStroke")
avstroke.Parent = avatar
avstroke.Color = Color3.fromRGB(255,140,0)
avstroke.Thickness = 2

---------------------------------------------------
-- USERNAME
---------------------------------------------------

local username = Instance.new("TextLabel")
username.Parent = main

username.Size = UDim2.new(1,-10,0,35)
username.Position = UDim2.new(0,5,0,145)

username.BackgroundTransparency = 1
username.Text = "@"..player.Name

username.TextScaled = true
username.Font = Enum.Font.GothamBold
username.TextColor3 = Color3.new(1,1,1)

---------------------------------------------------
-- CONTINUE BUTTON
---------------------------------------------------

local continueBtn = Instance.new("TextButton")
continueBtn.Parent = main

continueBtn.Size = UDim2.new(0.82,0,0,40)
continueBtn.Position = UDim2.new(0.09,0,0,190)

continueBtn.Text = "Continue to Script"

continueBtn.TextScaled = true
continueBtn.Font = Enum.Font.GothamBold

continueBtn.TextColor3 = Color3.new(1,1,1)
continueBtn.BackgroundColor3 = Color3.fromRGB(220,130,0)
continueBtn.BorderSizePixel = 0

Instance.new("UICorner",continueBtn).CornerRadius = UDim.new(0,12)

---------------------------------------------------
-- GROUP PANEL
---------------------------------------------------

local panel = Instance.new("Frame")
panel.Parent = main

panel.Size = UDim2.new(0.88,0,0,150)
panel.Position = UDim2.new(0.06,0,1,0)

panel.Visible = false
panel.BackgroundColor3 = Color3.fromRGB(5,5,5)
panel.BackgroundTransparency = 0.15
panel.BorderSizePixel = 0

Instance.new("UICorner",panel).CornerRadius = UDim.new(0,20)

local panelStroke = Instance.new("UIStroke")
panelStroke.Parent = panel
panelStroke.Color = Color3.fromRGB(255,140,0)
panelStroke.Thickness = 2

local text1 = Instance.new("TextLabel")
text1.Parent = panel

text1.Size = UDim2.new(1,-20,0,60)
text1.Position = UDim2.new(0,10,0,10)

text1.BackgroundTransparency = 1
text1.Text =
"JOIN OUR GROUP TO\nCONTINUE THE SCRIPT"

text1.TextScaled = true
text1.TextWrapped = true
text1.Font = Enum.Font.GothamBold
text1.TextColor3 = Color3.fromRGB(255,170,0)

local subText = Instance.new("TextLabel")
subText.Parent = panel

subText.Size = UDim2.new(1,-20,0,24)
subText.Position = UDim2.new(0,10,0,68)

subText.BackgroundTransparency = 1
subText.Text = "CLICK BUTTON BELOW"

subText.TextScaled = true
subText.Font = Enum.Font.Gotham
subText.TextColor3 = Color3.fromRGB(255,255,255)

---------------------------------------------------
-- GROUP BUTTON
---------------------------------------------------

local groupBtn = Instance.new("TextButton")
groupBtn.Parent = panel

groupBtn.Size = UDim2.new(0.72,0,0,42)
groupBtn.Position = UDim2.new(0.14,0,0,98)

groupBtn.Text = "GROUP"

groupBtn.TextScaled = true
groupBtn.Font = Enum.Font.GothamBold

groupBtn.TextColor3 = Color3.new(1,1,1)
groupBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
groupBtn.BorderSizePixel = 0

Instance.new("UICorner",groupBtn).CornerRadius = UDim.new(0,14)

---------------------------------------------------
-- COPIED TEXT
---------------------------------------------------

local copiedText = Instance.new("TextLabel")
copiedText.Parent = panel

copiedText.Size = UDim2.new(1,0,0,20)
copiedText.Position = UDim2.new(0,0,1,2)

copiedText.BackgroundTransparency = 1
copiedText.Text = "Copied!"
copiedText.TextScaled = true
copiedText.Font = Enum.Font.GothamBold
copiedText.TextColor3 = Color3.fromRGB(255,255,255)

copiedText.Visible = false

---------------------------------------------------
-- LEFT PROCEDURE PANEL
---------------------------------------------------

local centerPanel = Instance.new("Frame")
centerPanel.Parent = gui

centerPanel.Size = UDim2.new(0,170,0,210)
centerPanel.Position = UDim2.new(0.5,-500,0.5,-70)

centerPanel.BackgroundColor3 = Color3.fromRGB(10,10,10)
centerPanel.BackgroundTransparency = 0.1
centerPanel.BorderSizePixel = 0
centerPanel.Visible = false

Instance.new("UICorner",centerPanel).CornerRadius = UDim.new(0,16)

local leftStroke = Instance.new("UIStroke")
leftStroke.Parent = centerPanel
leftStroke.Color = Color3.fromRGB(255,140,0)
leftStroke.Thickness = 2

local leftTop = Instance.new("Frame")
leftTop.Parent = centerPanel

leftTop.Size = UDim2.new(1,0,0,28)
leftTop.BackgroundColor3 = Color3.fromRGB(255,140,0)
leftTop.BorderSizePixel = 0

Instance.new("UICorner",leftTop).CornerRadius = UDim.new(0,16)

local centerText = Instance.new("TextLabel")
centerText.Parent = centerPanel

centerText.Size = UDim2.new(1,-14,1,-45)
centerText.Position = UDim2.new(0,7,0,36)

centerText.BackgroundTransparency = 1
centerText.Text =
"HOW TO CONTINUE\n\n" ..
"1. CLICK THE GROUP BUTTON TO COPY THE GROUP LINK\n\n" ..
"2. GO TO ANY BROWSER\n\n" ..
"3. PASTE THE LINK\n\n" ..
"4. JOIN THE GROUP\n\n" ..
"5. RE-EXECUTE IT"

centerText.TextScaled = true
centerText.TextWrapped = true
centerText.Font = Enum.Font.GothamBold
centerText.TextColor3 = Color3.fromRGB(255,170,0)

---------------------------------------------------
-- RIGHT GUIDE PANEL
---------------------------------------------------

local rightGuide = Instance.new("Frame")
rightGuide.Parent = gui

rightGuide.Size = UDim2.new(0,120,0,220)
rightGuide.Position = UDim2.new(0.5,400,0.5,-80)

rightGuide.BackgroundColor3 = Color3.fromRGB(10,10,10)
rightGuide.BackgroundTransparency = 0.1
rightGuide.BorderSizePixel = 0

Instance.new("UICorner",rightGuide).CornerRadius = UDim.new(0,16)

local rightStroke = Instance.new("UIStroke")
rightStroke.Parent = rightGuide
rightStroke.Color = Color3.fromRGB(255,140,0)
rightStroke.Thickness = 2

local topBar = Instance.new("Frame")
topBar.Parent = rightGuide

topBar.Size = UDim2.new(1,0,0,28)
topBar.BackgroundColor3 = Color3.fromRGB(255,140,0)
topBar.BorderSizePixel = 0

Instance.new("UICorner",topBar).CornerRadius = UDim.new(0,16)

local guideText = Instance.new("TextLabel")
guideText.Parent = rightGuide

guideText.Size = UDim2.new(1,-10,1,-40)
guideText.Position = UDim2.new(0,5,0,35)

guideText.BackgroundTransparency = 1
guideText.Text =
"FOLLOW\nALL\nSTEPS TO\nCONTINUE\nTHE SCRIPT\n\nTHANK\nYOU!"

guideText.TextScaled = true
guideText.TextWrapped = true
guideText.Font = Enum.Font.GothamBold
guideText.TextColor3 = Color3.new(1,1,1)

---------------------------------------------------
-- CONTINUE BUTTON LOGIC
---------------------------------------------------

continueBtn.MouseButton1Click:Connect(function()

	continueBtn.Visible = false

	panel.Visible = true
	centerPanel.Visible = true
	rightGuide.Visible = true

	TweenService:Create(
		panel,
		TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{
			Position = UDim2.new(0.06,0,0.48,0)
		}
	):Play()

	TweenService:Create(
		centerPanel,
		TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{
			Position = UDim2.new(0.5,-320,0.5,-70)
		}
	):Play()

	TweenService:Create(
		rightGuide,
		TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{
			Position = UDim2.new(0.5,200,0.5,-80)
		}
	):Play()

end)

---------------------------------------------------
-- GROUP BUTTON CLICK
---------------------------------------------------

groupBtn.MouseButton1Click:Connect(function()

	local link = "https://linkurl.pk/tiwt-wjg"

	pcall(function()
		GuiService:OpenBrowserWindow(link)
	end)

	if setclipboard then
		pcall(function()
			setclipboard(link)
		end)
	end

	copiedText.Visible = true
	copiedText.Text = "Opening Link..."

	task.delay(2,function()

		copiedText.Visible = false
		copiedText.Text = "Copied!"

	end)

	pcall(function()

		StarterGui:SetCore("SendNotification", {
			Title = "Opening Browser",
			Text = "Redirecting to group link...",
			Duration = 3
		})

	end)

end)
