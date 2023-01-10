-- neovim 配置
-- 按个人习惯逐渐改进的配置方案，可视情况注释不需要的部分

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- 最基础的修改：光标的方向键
-- hjkl四个键得改掉后三个，索性全部换掉，因为hjkl的排布还是有点逆天
--             u
-- 现布局：   n e i
-- h：光标到下一个词的开头，等同于e
-- j：撤回，等同于u
-- k：下一个搜索结果，等同于n
-- l：插入，等同于i
map("n","u","k",opts)
map("n","n","h",opts)
map("n","e","j",opts)
map("n","i","l",opts)
map("n","h","e",opts)
map("n","j","u",opts)
map("n","k","n",opts)
map("n","l","i",opts)
map("v","u","k",opts)
map("v","n","h",opts)
map("v","e","j",opts)
map("v","h","l",opts)
map("v","i","e",opts)
map("v","j","u",opts)
map("v","k","n",opts)
map("v","l","i",opts)
-- 带shift的按键也有相应修改。
-- 方向键做了一点强化，不需要逆天的$和0了。
map("n","N","0",opts)
map("n","I","$",opts)
map("n","U","5k",opts)
map("n","E","5j",opts)
-- 方向键
-- 快捷键映射
-- 即使用caps lock顶替esc,对左手小拇指而言还是很恼火。
-- colemak中排的字母使用频率太高，退而求其次使用nk映射到esc.
map("i","nk","<Esc>",opts)