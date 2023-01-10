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
map("n","l","e",opts)
map("v","u","k",opts)
map("v","n","h",opts)
map("v","e","j",opts)
map("v","h","l",opts)
map("v","i","e",opts)
map("v","j","u",opts)
map("v","k","n",opts)
map("v","l","e",opts)
