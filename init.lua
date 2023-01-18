-- neovim 配置
-- 按个人習慣逐渐改進的配置方案，可視情况注释不需要的部分
require('plugins') // 使用packer.nvim包
local map = vim.api.nvim_set_keymap
vim.g.mapleader=' '
vim.opt.clipboard='unnamedplus'  --  需要xclip
vim.cmd('set ic')
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

  
-- 最基礎的修改：光標的方向键
-- hjkl四个键得改掉三个，索性全部换掉，因爲hjkl的排布還是有点逆天
--             u
-- 現佈局：   n e i
-- h：光标到下一个詞的開頭，等同于e
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
  {'K','N'},
  {'gh','ge'},
  {'ml','mi'},
  {'mL','mL'},
  {'<leader>o','o<Esc>'},
  {'<leader>O','O<Esc>'},
  })
-- 帶shift的按键也有相應修改。
-- 方向鍵做了一点强化，不需要逆天的$和0了。
-- 方向鍵
-- 快捷键映射
-- 即使用caps lock頂替esc,對左手小拇指而言還是很惱火。
-- colemak中排的字母使用頻率太高，退而求其次使用nk映射到esc.
ilist({
  {'nk','<Esc>'}
})

-- 換成packer.nvim,這是一個使用lua安裝插件的管理器
-- local Plug = vim.fn['plug#']



-- Plug 'tpope/vim-surround' -- 插件：用于包括号或者html標籤

-- Plug 'tpope/vim-commentary' -- vim注释插件

-- Plug 'mattn/emmet-vim' -- web開發插件也

-- Plug 'vim-airline/vim-airline' -- 帥氣的状態欄,可惜不能用在vscode

-- Plug 'junegunn/fzf'  -- 模糊搜索fzf,替代ctrl+P

-- Plug 'junegunn/fzf.vim' -- 同作者在vim上的配置


-- vim.call('plug#end')
