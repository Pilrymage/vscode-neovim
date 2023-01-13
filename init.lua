-- neovim 配置
-- 按个人习惯逐渐改进的配置方案，可视情况注释不需要的部分

local map = vim.api.nvim_set_keymap
vim.g.mapleader=' '
vim.opt.clipboard='unnamedplus'  --  需要xclip
-- local map = function (x,y,z) print(y,z) end
local opts = {noremap = true, silent = true}
local nvmap= function(from,to)
  map("n",from,to,opts)
  map("v",from,to,opts)
end
local imap = function(from,to)
  map("i",from,to,opts)
end
local nvlist=function(mylist)
  for i,pair in pairs(mylist) do
    nvmap(pair[1],pair[2])
  end
end
local ilist=function(mylist)
  for i,pair in pairs(mylist) do
    imap(pair[1],pair[2])
  end
end

  
-- 最基础的修改：光标的方向键
-- hjkl四个键得改掉后三个，索性全部换掉，因为hjkl的排布还是有点逆天
--             u
-- 现布局：   n e i
-- h：光标到下一个词的开头，等同于e
-- j：撤回，等同于u
-- k：下一个搜索结果，等同于n
-- l：插入，等同于i
nvlist({
  {'u','k'},
  {'n','h'},
  {'e','j'},
  {'i','l'},
  {'h','e'},
  {'j','u'},
  {'k','n'},
  {'l','i'},
  {'N','0'},
  {'dN','d0'},
  {'cN','c0'},
  {'I','$'},
  {'dI','d$'},
  {'cI','c$'},
  {'U','5k'},
  {'E','5j'},
  {'L','I'},
  {'H','E'},
  {'gh','ge'},
  -- {'<C-U>','<C-Y>'},
  {'<leader>o','o<Esc>'},
  {'<leader>O','O<Esc>'},
  })
-- 带shift的按键也有相应修改。
-- 方向键做了一点强化，不需要逆天的$和0了。
-- 方向键
-- 快捷键映射
-- 即使用caps lock顶替esc,对左手小拇指而言还是很恼火。
-- colemak中排的字母使用频率太高，退而求其次使用nk映射到esc.
ilist({
  {'nk','<Esc>'}
})

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'tpope/vim-surround' -- 插件：用于包括号或者html标签

Plug 'tpope/vim-repeat' -- 上面插件附送的，用于重复命令

vim.call('plug#end')
