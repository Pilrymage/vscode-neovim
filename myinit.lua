require("plugins")
-- end
-- neovim 配置
-- 按个人習慣逐渐改進的配置方案，可視情况注释不需要的部分
-- vscode環境啓動判斷

local map = vim.api.nvim_set_keymap
local confPath = vim.fn.stdpath('config')
vim.g.mapleader=' '
vim.opt.clipboard='unnamedplus'  --  需要xclip
vim.opt.listchars.tab='xx'
vim.opt.listchars.trail='▫'
local opts = {noremap = true, silent = true}
local code=vim.g.vscode

-- 簡單粗暴的追加編輯器行爲
local setTable=function(myTable)
  for i,str in pairs(myTable) do
     vim.cmd('set '..str)
  end
end

setTable({
'autochdir', -- 隨文件打開而修改工作目錄
'exrc', 
'secure', 
'number', -- 顯示行號
'relativenumber', -- 使用相對行號
'cursorline', -- 高亮
'noexpandtab', -- 不替換tab鍵
'tabstop=2', -- tab鍵替換爲2個空格
'shiftwidth=2', -- 縮進2空格
'softtabstop=2', -- “軟”tab爲2個空格
'autoindent', -- 換行自動縮進
'list', -- 顯示特殊字符
'scrolloff=4', -- 光標行保留上下空間：4行 
'ttimeoutlen=0', --等待按鍵時間
'notimeout', --  不許按鍵超時
'viewoptions=cursor,folds,slash,unix', -- 文件名的'\'換爲'/',使用unix的EOF
'wrap', -- 自動換行
'tw=0', -- 最大行寬度默認爲0
'indentexpr=',
'foldmethod=indent', -- 摺疊格式
'foldlevel=99',
'foldenable',
'formatoptions-=tc',
'splitright',
'splitbelow',
'noshowmode',
'ignorecase',
'smartcase', -- 智能搜索大小寫
'shortmess+=c',
'inccommand=split',
'completeopt=longest,noinsert,menuone,noselect,preview',
'lazyredraw',
'visualbell',
})
-- normal與visual映射，通用2個字符串參數
-- 第3個參數追加vscode命令的映射，配合vscode-neovim
local nvmap= function(from,to,vto)
  if vto and code then
    map("n",from,"<Cmd>call VSCode"..vto.."<CR>",opts)
    map("v",from,vto,opts)
  else
    map("n",from,to,opts)
    map("v",from,to,opts)
  end
end

local imap = function(from,to)
  map("i",from,to,opts)
end

-- 輸入一個table
local nvTable=function(myTable)
  for i,pair in pairs(myTable) do
    nvmap(pair[1],pair[2],pair[3])
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
  {';',':'}, -- 不要shift!
  {'Q',':q<CR>',
  'Notify("workbench.action.closeActiveEditor")'},   
  {'S',':w<CR>',
  'Notify("workbench.action.files.save")<CR>'}, 
  -- 不常用按鍵更替爲:w與:q,同時必須調用在vscode上自帶的命令爲第三個參數
  -- 在vscode-neovim裏，又稱ZZ/ZQ,也可以照這裏的
  {'<leader>rc',':e $HOME/.config/nvim/init.lua<CR>',
  'ExtensionNotify("open-file","'..confPath..'/init.lua",1)'},
  -- 檢查配置文件
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