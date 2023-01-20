require("plugins")
-- end
-- neovim 配置
-- 按个人習慣逐渐改進的配置方案，可視情况注释不需要的部分
-- vscode環境啓動判斷

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

local nvTable=function(myTable)
  for i,pair in pairs(myTable) do
    nvmap(pair[1],pair[2])
  end
end

local iTable=function(myTable)
  for i,pair in pairs(myTable) do
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

nvTable({
  {'Q',':q'}, -- 不常用按鍵更替爲:wq
  {'S',':w'},
  {'u','k'}, -- 四行，方向鍵
  {'n','h'},
  {'e','j'},
  {'i','l'},
  {'h','e'}, -- 四行，功能替補
  {'j','u'},
  {'k','n'},
  {'l','i'},
  {'N','0'}, -- 六行，句首/句尾相關操作
  {'dN','d0'},
  {'cN','c0'},
  {'I','$'},
  {'dI','d$'},
  {'cI','c$'},
  {'U','5k'}, -- 強化移動
  {'E','5j'},
  {'W','5w'},
  {'B','5b'},
  {'L','I'},
  {'H','E'},
  -- {'K','N'}, -- 考慮放給vscode
  {'gh','ge'},
  {'<leader>o','o<Esc>'}, -- 插入空行
  {'<leader>O','O<Esc>'},
  })