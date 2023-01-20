local packer = require('packer') -- 使用packer.nvim包
packer.init() -- 插件管理器初始化
local use = packer.use -- use函數簡寫

-- 使用一個table接受參數
local useTable = function(table) 
  for i,str in pairs(table) do
    use(str)
  end
end

-- nocode：不使用在vscode裏的插件
local usenc = function(str)
  if not vim.g.vscode then
    use(str)
  end
end

-- 使用一個table接受參數
local useTablenc = function(table)
  for i,str in pairs(table) do
    usenc(str)
  end
end
                            
packer.reset() -- 清空use列表

-- vscode的插件以文字編輯類爲主，不用自帶gui的
-- 插件重新下載麻煩，這裏的插件能留下就留下
useTable({ 
'wbthomason/packer.nvim', -- 本插件管理器

'tpope/vim-surround', -- 包括号或者html標籤

'tpope/vim-commentary', -- vim注释插件,類似於vscode的ctrl+/

-- 'tpope/vim-sensible', -- vim新手入門

'mattn/emmet-vim', -- 利用css選擇器語法快速添加html標籤

'asvetliakov/vim-easymotion', -- ?

})

useTablenc({

'junegunn/fzf',  -- 模糊搜索fzf,替代ctrl+P

'junegunn/fzf.vim',-- 同作者在vim上的配置 

'vim-airline/vim-airline', -- 帥氣的状態欄,可惜不能用在vscode

'ap/vim-css-color', -- css顏色直觀

'github/copilot.vim', -- AI寫代碼

'nvim-treesitter/nvim-treesitter', -- 
'nvim-treesitter/playground', -- 樹

'theniceboy/nvim-deus', --nvim美化


})
packer.clean() -- vscode 會提示你清除不用的插件
packer.install() -- neovim 裏下載回來
return plugins