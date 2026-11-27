-- Automatically switches the loaded layout based on screen resolution

local measureMain
local measureCombinedWidth
local measureCombinedHeight
local variablesPath
local isCombined
local layouts
local lastResolution

local function GetResolution()
	if isCombined then
		return measureCombinedWidth:GetValue() .. 'x' .. measureCombinedHeight:GetValue()
	end
	return (measureMain:GetStringValue():gsub('%s', ''))
end

function Initialize()
	measureMain = SKIN:GetMeasure('MeasureMain')
	measureCombinedWidth = SKIN:GetMeasure('MeasureCombinedWidth')
	measureCombinedHeight = SKIN:GetMeasure('MeasureCombinedHeight')
	variablesPath = SKIN:ReplaceVariables('#@#Variables.inc')
	isCombined = SKIN:GetVariable('Screen', ''):lower() == 'combined'
	layouts = {}
	for mapping in SKIN:GetVariable('Layouts', ''):gmatch('[^|]+') do
		local width, height, layout = mapping:match('^%s*(%d+)[xX](%d+)%s*:%s*(%S.-)%s*$')
		if width then
			layouts[width .. 'x' .. height] = layout
		end
	end
	lastResolution = SKIN:GetVariable('LastResolution')
end

function Update()
	local resolution = GetResolution()
	if resolution == lastResolution then
		return
	end
	lastResolution = resolution
	SKIN:Bang('!Log', 'AutoRez: ' .. resolution)
	local layout = layouts[resolution]
	if layout then
		SKIN:Bang('!WriteKeyValue', 'Variables', 'LastResolution', resolution, variablesPath)
		SKIN:Bang('!LoadLayout', layout)
	end
end
