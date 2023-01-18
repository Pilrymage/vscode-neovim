vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- 插件管理器

  use 'tpope/vim-surround' -- 插件：用于包括号或者html標籤

  use 'tpope/vim-commentary' -- vim注释插件

  use 'mattn/emmet-vim' -- web開發插件也

  use 'vim-airline/vim-airline' -- 帥氣的状態欄,可惜不能用在vscode

  use 'junegunn/fzf'  -- 模糊搜索fzf,替代ctrl+P

  use 'junegunn/fzf.vim' -- 同作者在vim上的配置
end)