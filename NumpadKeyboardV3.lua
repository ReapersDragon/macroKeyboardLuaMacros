-- get luamacros HERE: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
-- plug in your 2nd keyboard, load this script into LUAmacros, and press the triangle PLAY button.
-- Then, press any key on that keyboard to assign logical name ('MACROS') to macro keyboard
clear() --clear the console from last run
local keyboardIdentifier = '1FB85C22'



--You need to get the identifier code for the keyboard with name "MACROS"
--This appears about halfway through the SystemID item and looks like 1BB382AF or some other alphanumeric combo. 
-- It's usually 7 or 8 characters long.
--Once you have this identifier, replace the value of keyboardIdentifier with it

--Don't ask for keyboard assignment help if the user has manually entered a keyboard identifier
if keyboardIdentifier == '0000AAA' then
	lmc_assign_keyboard('MACROS');
else lmc_device_set_name('MACROS', keyboardIdentifier);
end
--This lists connected keyboards
dev = lmc_get_devices()
for key,value in pairs(dev) do
  print(key..':')
  for key2,value2 in pairs(value) do print('  '..key2..' = '..value2) end
end   
print('You need to get the identifier code for the keyboard with name "MACROS"')
print('Then replace the first 0000AAA value in the code with it. This will prevent having to manually identify keyboard every time.')
-- Hide window to tray to keep taskbar tidy  
lmc.minimizeToTray = true
lmc_minimize()

--Start Script

local config = {
	--[45]  = "insert",
	--[36]  = "home",
	--[33]  = "pageup",
	--[46]  = "delete",
	--[35]  = "end",
	--[34]  = "pagedown",
	--[27]  = "escape",
	--[112] = "F1",
	--[113] = "F2",
	--[114] = "F3",
	--[115] = "F4",
	--[116] = "F5",
	--[117] = "F6",
	--[118] = "F7",
	--[119] = "F8",
	--[120] = "F9",
	--[121] = "F10",
	--[122] = "F11",
	--[123] = "F12",
	[8]   = "backspace",
	--[220] = "backslash",
	[13]  = "enter",
	--[16]  = "rShift",
	--[17]  = "rCtrl",
	--[38]  = "up",
	--[37]  = "left",
	--[40]  = "down",
	--[39]  = "right",
	--[32]  = "space",
	--[186] = "semicolon",
	--[222] = "singlequote",
	--[190] = "period",
	--[191] = "slash",
	--[188] = "comma",
	--[219] = "leftbracket",
	--[221] = "rightbracket",
	--[189] = "minus",
	--[187] = "equals",
	[96]  = "num0",
	[97]  = "num1",
	[98]  = "num2",
	[99]  = "num3",
	[100] = "num4",
	[101] = "num5",
	[102] = "num6",
	[103] = "num7",
	[104] = "num8",
	[105] = "num9",
    --
	[106] = "numMult",
    [107] = "numPlus",
    --[108] = "numEnter", --sometimes this is different, check your keyboard
	[109] = "numMinus",
    [110] = "numDelete",
	[111] = "numDiv",
    --[144] = "numLock", --probably it is best to avoid this key. I keep numlock ON, or it has unexpected effects
    --  
    --[192] = "`",  --this is the tilde key just before the number row
    --[9]   = "tab",
    --[20]  = "capslock",
    --[18]  = "alt",
    --
    --
	--[string.byte('Q')] = "q",
	--[string.byte('W')] = "w",
	--[string.byte('E')] = "e",
	--[string.byte('R')] = "r",
	--[string.byte('T')] = "t",
	--[string.byte('Y')] = "y",
	--[string.byte('U')] = "u",
	--[string.byte('I')] = "i",
	--[string.byte('O')] = "o",
	--[string.byte('P')] = "p",
	--[string.byte('A')] = "a",
	--[string.byte('S')] = "s",
	--[string.byte('D')] = "d",
	--[string.byte('F')] = "f",
	--[string.byte('G')] = "g",
	--[string.byte('H')] = "h",
	--[string.byte('J')] = "j",
	--[string.byte('K')] = "k",
	--[string.byte('L')] = "l",
	--[string.byte('Z')] = "z",
	--[string.byte('X')] = "x",
	--[string.byte('C')] = "c",
	--[string.byte('V')] = "v",
	--[string.byte('B')] = "b",
	--[string.byte('N')] = "n",
	--[string.byte('M')] = "m",
    --
    --[string.byte('0')] = "0",
	--[string.byte('1')] = "1",
	--[string.byte('2')] = "2",
	--[string.byte('3')] = "3",
	--[string.byte('4')] = "4",
	--[string.byte('5')] = "5",
    --[string.byte('6')] = "6",
    --[string.byte('7')] = "7",
    --[string.byte('8')] = "8",
    --[string.byte('9')] = "9",
    --
	----[255] = "printscreen" --these keys do not work
}

local macro = {
	--[45]  = '' --"insert",
	--[36]  = '' --"home",
	--[33]  = '' --"pageup",
	--[46]  = '' --"delete",
	--[35]  = '' --"end",
	--[34]  = '' --"pagedown",
	--[27]  = '' --"escape",
	--[112] = '' --"F1",
	--[113] = '' --"F2",
	--[114] = '' --"F3",
	--[115] = '' --"F4",
	--[116] = '' --"F5",
	--[117] = '' --"F6",
	--[118] = '' --"F7",
	--[119] = '' --"F8",
	--[120] = '' --"F9",
	--[121] = '' --"F10",
	--[122] = '' --"F11",
	--[123] = '' --"F12",
	--[8]   = '{F22}', --"backspace",
	--[220] = '' --"backslash",
	[13]  = '^v', --"enter",
	--[16]  = '' --"rShift",
	--[17]  = '' --"rCtrl",
	--[38]  = '' --"up",
	--[37]  = '' --"left",
	--[40]  = '' --"down",
	--[39]  = '' --"right",
	--[32]  = '' --"space",
	--[186] = '' --"semicolon",
	--[222] = '' --"singlequote",
	--[190] = '' --"period",
	--[191] = '' --"slash",
	--[188] = '' --"comma",
	--[219] = '' --"leftbracket",
	--[221] = '' --"rightbracket",
	--[189] = '' --"minus",
	--[187] = '' --"equals",
	[96]  = '^x', --"num0", cut
	[97]  = '^f', --"num1", find
	[98]  = '^F', --"num2", findall
	[99]  = '^k^f', --"num3",{F19} format
	[100] = '^k^c', --"num4", comment
	[101] = '^k^u', --"num5", uncomment
	[102] = '^k^o', --"num6",
	[103] = '#N', --"num7",
	[104] = '^z', --"num8",
	--[105] = '^{F16}', --"num9",
    --        '' --
	--[106] = '{F21}', --"numMult",
    [107] = '^s', --"numPlus", switch h cpp
    --[108] = '', --"numEnter", --sometimes this is different, check your keyboard
	[109] = '^%a', --"numMinus", autofill pw keypass
    [110] = '^c', --"numDelete",
	--[111] = '{F23}', --"numDiv",
    --[144] = '' --"numLock", --probably it is best to avoid this key. I keep numlock ON, or it has unexpected effects
    --  
    --[192] = '' --"`",  --this is the tilde key just before the number row
    --[9]   = '' --"tab",
    --[20]  = '' --"capslock",
    --[18]  = '' --"alt",
    --
    --
	--[string.byte('Q')] = "q",
	--[string.byte('W')] = "w",
	--[string.byte('E')] = "e",
	--[string.byte('R')] = "r",
	--[string.byte('T')] = "t",
	--[string.byte('Y')] = "y",
	--[string.byte('U')] = "u",
	--[string.byte('I')] = "i",
	--[string.byte('O')] = "o",
	--[string.byte('P')] = "p",
	--[string.byte('A')] = "a",
	--[string.byte('S')] = "s",
	--[string.byte('D')] = "d",
	--[string.byte('F')] = "f",
	--[string.byte('G')] = "g",
	--[string.byte('H')] = "h",
	--[string.byte('J')] = "j",
	--[string.byte('K')] = "k",
	--[string.byte('L')] = "l",
	--[string.byte('Z')] = "z",
	--[string.byte('X')] = "x",
	--[string.byte('C')] = "c",
	--[string.byte('V')] = "v",
	--[string.byte('B')] = "b",
	--[string.byte('N')] = "n",
	--[string.byte('M')] = "m",
    --
    --[string.byte('0')] = "0",
	--[string.byte('1')] = "1",
	--[string.byte('2')] = "2",
	--[string.byte('3')] = "3",
	--[string.byte('4')] = "4",
	--[string.byte('5')] = "5",
    --[string.byte('6')] = "6",
    --[string.byte('7')] = "7",
    --[string.byte('8')] = "8",
    --[string.byte('9')] = "9",

	--[255] = "printscreen" --these keys do not work
}

local macroSendInput = {
	--[45]  = '' --"insert",
	--[36]  = '' --"home",
	--[33]  = '' --"pageup",
	--[46]  = '' --"delete",
	--[35]  = '' --"end",
	--[34]  = '' --"pagedown",
	--[27]  = '' --"escape",
	--[112] = '' --"F1",
	--[113] = '' --"F2",
	--[114] = '' --"F3",
	--[115] = '' --"F4",
	--[116] = '' --"F5",
	--[117] = '' --"F6",
	--[118] = '' --"F7",
	--[119] = '' --"F8",
	--[120] = '' --"F9",
	--[121] = '' --"F10",
	--[122] = '' --"F11",
	--[123] = '' --"F12",
	[8]   = 0xB0, --"backspace", next song
	--[220] = '' --"backslash",
	--[13]  = '^v', --"enter",
	--[16]  = '' --"rShift",
	--[17]  = '' --"rCtrl",
	--[38]  = '' --"up",
	--[37]  = '' --"left",
	--[40]  = '' --"down",
	--[39]  = '' --"right",
	--[32]  = '' --"space",
	--[186] = '' --"semicolon",
	--[222] = '' --"singlequote",
	--[190] = '' --"period",
	--[191] = '' --"slash",
	--[188] = '' --"comma",
	--[219] = '' --"leftbracket",
	--[221] = '' --"rightbracket",
	--[189] = '' --"minus",
	--[187] = '' --"equals",
	--[96]  = '^x', --"num0", cut
	--[97]  = '^f', --"num1", find
	--[98]  = '^F', --"num2", findall
	--[99]  = '^k^f', --"num3",{F19} format
	--[100] = '^k^c', --"num4", comment
	--[101] = '^kû', --"num5", uncomment
	--[102] = 'std::cout <<  << std::endl;', --"num6",
	--[103] = '#N', --"num7",
	--[104] = '^{F15}', --"num8",
	--[105] = '^{F16}', --"num9",
    --        '' --
	[106] = 0xB3, --"numMult", play 0xB3
    --[107] = '^%{DOWN}', --"numPlus", show open file list
    --[108] = '', --"numEnter", --sometimes this is different, check your keyboard
	--[109] = '^%a', --"numMinus", autofill pw keypass
    --[110] = '^c', --"numDelete",
	[111] = 0xB1, --"numDiv",
    --[144] = '' --"numLock", --probably it is best to avoid this key. I keep numlock ON, or it has unexpected effects
    --  
    --[192] = '' --"`",  --this is the tilde key just before the number row
    --[9]   = '' --"tab",
    --[20]  = '' --"capslock",
    --[18]  = '' --"alt",
    --
    --
	--[string.byte('Q')] = "q",
	--[string.byte('W')] = "w",
	--[string.byte('E')] = "e",
	--[string.byte('R')] = "r",
	--[string.byte('T')] = "t",
	--[string.byte('Y')] = "y",
	--[string.byte('U')] = "u",
	--[string.byte('I')] = "i",
	--[string.byte('O')] = "o",
	--[string.byte('P')] = "p",
	--[string.byte('A')] = "a",
	--[string.byte('S')] = "s",
	--[string.byte('D')] = "d",
	--[string.byte('F')] = "f",
	--[string.byte('G')] = "g",
	--[string.byte('H')] = "h",
	--[string.byte('J')] = "j",
	--[string.byte('K')] = "k",
	--[string.byte('L')] = "l",
	--[string.byte('Z')] = "z",
	--[string.byte('X')] = "x",
	--[string.byte('C')] = "c",
	--[string.byte('V')] = "v",
	--[string.byte('B')] = "b",
	--[string.byte('N')] = "n",
	--[string.byte('M')] = "m",
    --
    --[string.byte('0')] = "0",
	--[string.byte('1')] = "1",
	--[string.byte('2')] = "2",
	--[string.byte('3')] = "3",
	--[string.byte('4')] = "4",
	--[string.byte('5')] = "5",
    --[string.byte('6')] = "6",
    --[string.byte('7')] = "7",
    --[string.byte('8')] = "8",
    --[string.byte('9')] = "9",

	--[255] = "printscreen" --these keys do not work
}

-- define callback for whole device
lmc_set_handler('MACROS', function(button, direction)
	--Ignoring upstrokes ensures keystrokes are not registered twice, but activates faster than ignoring downstrokes. It also allows press and hold behaviour
        if (direction == 0) then return end -- ignore key upstrokes. 
	if type(config[button]) == "string" then
                print(' ')
                print('Your key ID number is:   ' .. button)
				print('It was assigned string:    ' .. config[button])
				if type(macro[button]) == 'string' then
					print('button')
					print('assigned Macro:   ' .. macro[button])
					lmc_send_keys(macro[button])
				elseif button == 105 then
					print('calc')
					lmc_spawn("calc")
				--elseif button == 104 then
				--	print('SnippingTool')
				--	lmc_spawn("SnippingTool.exe")
				else
					print('button1')
					print('assigned Macro input:   ' .. macroSendInput[button])
					lmc_send_input( macroSendInput[button], 0, 0)
					lmc_send_input( macroSendInput[button], 0, 2)
				end
	else
                print(' ')
                print('Not yet assigned: ' .. button)
	end
end)
