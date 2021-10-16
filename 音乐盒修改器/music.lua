local SCRIPT_FILE_NAME = GetScriptName();
local SCRIPT_FILE_ADDR = "https://gitee.com/yiyule/Aimware-Luas/raw/main/%E9%9F%B3%E4%B9%90%E7%9B%92%E4%BF%AE%E6%94%B9%E5%99%A8/%E9%9F%B3%E4%B9%90%E7%9B%92%E4%BF%AE%E6%94%B9%E5%99%A8.lua";
local VERSION_FILE_ADDR = "https://gitee.com/yiyule/Aimware-Luas/raw/main/%E9%9F%B3%E4%B9%90%E7%9B%92%E4%BF%AE%E6%94%B9%E5%99%A8/version.txt";
local VERSION_NUMBER = "0.02";
local version_check_done = false;
local update_downloaded = false;
local update_available = false;
local up_to_date = false;
local updaterfont1 = draw.CreateFont("Bahnschrift", 18);
local updaterfont2 = draw.CreateFont("Bahnschrift", 14);
local updateframes = 0;
local fadeout = 0;
local spacing = 0;
local fadein = 0;

callbacks.Register( "Draw", "handleUpdates", function()
	if updateframes < 5.5 then
		if up_to_date or updateframes < 0.25 then
			updateframes = updateframes + globals.AbsoluteFrameTime();
			if updateframes > 5 then
				fadeout = ((updateframes - 5) * 510);
			end
			if updateframes > 0.1 and updateframes < 0.25 then
				fadein = (updateframes - 0.1) * 4500;
			end
			if fadein < 0 then fadein = 0 end
			if fadein > 650 then fadein = 650 end
			if fadeout < 0 then fadeout = 0 end
			if fadeout > 255 then fadeout = 255 end
		end
		if updateframes >= 0.25 then fadein = 650 end
		for i = 0, 600 do
			local alpha = 200-i/3 - fadeout;
			if alpha < 0 then alpha = 0 end
			draw.Color(15,15,15,alpha);
			draw.FilledRect(i - 650 + fadein, 0, i+1 - 650 + fadein, 30);
			draw.Color(255, 150, 75,alpha);
			draw.FilledRect(i - 650 + fadein, 30, i+1 - 650 + fadein, 31);
		end
		draw.SetFont(updaterfont1);
		draw.Color(255,150,75,255 - fadeout);
		draw.Text(7 - 650 + fadein, 7, "Yi's");
		draw.Color(225,225,225,255 - fadeout);
		draw.Text(7 + draw.GetTextSize("Yi's ") - 650 + fadein, 7, "Script");
		draw.Color(255,150,75,255 - fadeout);
		draw.Text(7 + draw.GetTextSize("Yi's Script  ") - 650 + fadein, 7, "\\");
		spacing = draw.GetTextSize("Yi's Script  \\  ");
		draw.SetFont(updaterfont2);
		draw.Color(225,225,225,255 - fadeout);
	end

    if (update_available and not update_downloaded) then
		draw.Text(7 + spacing - 650 + fadein, 9, "Downloading latest version.");
        local new_version_content = http.Get(SCRIPT_FILE_ADDR);
        local old_script = file.Open(SCRIPT_FILE_NAME, "w");
        old_script:Write(new_version_content);
        old_script:Close();
        update_available = false;
        update_downloaded = true;
	end
	
    if (update_downloaded) and updateframes < 5.5 then
		draw.Text(7 + spacing - 650 + fadein, 9, "Update available, please reload the script.");
    end

    if (not version_check_done) then
        version_check_done = true;
		local version = http.Get(VERSION_FILE_ADDR);
		version = string.gsub(version, "\n", "");
		if (version ~= VERSION_NUMBER) then
            update_available = true;
		else 
			up_to_date = true;
		end
	end
	
	if up_to_date and updateframes < 5.5 then
		draw.Text(7 + spacing - 650 + fadein, 9, "Successfully loaded latest version: v" .. VERSION_NUMBER);
	end
end)


local function mainrunQInEmax()
    client.Command("clear", true)
    client.Command("toggleconsole", true)
    client.Command("echo \" 加载中---" .. client.GetConVar('name') .. "--祝你游玩愉快~+-+\"", true)
end
mainrunQInEmax()--运行上面的控制台代码
local uid=cheat.GetUserID()
local text1, text2, text3 = string.find(http.Get("https://gitee.com/yiyule/aw/raw/master/userid.txt"),"(" .. cheat.GetUserID() .. ")")
    if text1==nil then
    print("目前不能使用这个LUA")
    client.Command("echo \" 目前不能使用这个LUA  \"", true)
    return;
    else
end
local MusicKitChanger = {}
local rb_ref = gui.Reference("Visuals")
local tab = gui.Tab(rb_ref, "yi", ("音乐盒修改器"))
local gb_main = gui.Groupbox(tab, "音乐盒", 15, 15, 250, 400)
MusicKitChanger.List = {"无", "本体音乐盒", "头号特训", "深红突击", "尖峰时刻", "叛乱", "A*D*8", "如日中天", "骷髅爆破", "沙漠之焰", "地球末夜", "金属", "圣诞之欲", "同型节奏", "无人之境", "迈阿密热线", "绝对统御", "塔罗斯的法则", " 万夫莫敌包", "莫洛托夫烈火", "超爆话筒", "有害物质环境", "II-爆头", "8 位音乐盒", "就是我", "永恒之钻", "大举入侵！", "雄狮之口", "海绵手指", "令人发指", "爪哇哈瓦那放克乐", "CSGO 精彩时刻", "咄咄逼人", "有为青年", "冲破藩篱", "人生何处不青山", "决心", "GLA", "III-竞技场", "EZ4ENCE", "《光环：士官长合集》", "疤王", "《半衰期：爱莉克斯》，反叛者", "巴克拉姆", "枪炮卷饼卡车", "巨龙之眼", "M.U.D.D. 军团", "新黑色电影", "大胆尝试", "漂泊者", "阿蒙·托宾·尘归尘", "黑帝斯音乐盒", "躺平青年", "电锯·追命", "咖啡拉花", "黄色魔法", "征服", "战火星空", "好好干，好好活", "蜂鸟", "MeDusA"}
MusicKitChanger.Gui = gui.Combobox(gb_main, "", "音乐盒修改器", unpack(MusicKitChanger.List))
MusicKitChanger.Gui:SetDescription("修改你的音乐盒")
MusicKitChanger.Fire = function()
    if entities.GetLocalPlayer() == nil then return end
    local kit = MusicKitChanger.Gui:GetValue()
    if kit == 0 then return end
    entities.GetPlayerResources():SetPropInt(kit, "m_nMusicID", client.GetLocalPlayerIndex())
end

local DescriptionGroupbox = gui.Groupbox(tab, "更新日志", 15, 145, 250, 400)
local Descriptionmaintext=gui.Text(DescriptionGroupbox,"添加了新的音乐盒MeDusA")

callbacks.Register("Draw", function()
    MusicKitChanger.Fire()
end)
