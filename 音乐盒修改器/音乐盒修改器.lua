

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
local tab = gui.Tab(rb_ref, "sestain", ("音乐盒修改器"))
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
