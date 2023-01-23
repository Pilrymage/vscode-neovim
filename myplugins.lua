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
if not vim.g.code then
 use 'easymotion/vim-easymotion'
end


-- vscode的插件以文字編輯類爲主，不用自帶gui的
-- 插件重新下載麻煩，這裏的插件能留下就留下
useTable({ 
'wbthomason/packer.nvim', -- 本插件管理器

'tpope/vim-surround', -- 包括号或者html標籤

'tpope/vim-commentary', -- vim注释插件,類似於vscode的ctrl+/

'asvetliakov/vim-easymotion', -- ?

'unblevable/quick-scope' -- 爲f/t鍵查一行的重

})

useTablenc({
 'itchyny/vim-cursorword',
 'nvim-treesitter/nvim-treesitter',
 'nvim-treesitter/playground',
 'theniceboy/nvim-deus',
 {'theniceboy/eleline.vim',  branch= 'no-scrollbar' },
 'NvChad/nvim-colorizer.lua',
 'RRethy/vim-illuminate',
 'ibhagwan/fzf-lua',
 {'junegunn/fzf'  },
 'junegunn/fzf.vim',
 'kevinhwang91/rnvimr',
 'airblade/vim-rooter',
 'pechorin/any-jump.vim',
 {'neoclide/coc.nvim', commit= '63dd239bfe02998810b39d039827e2510885b57b'},
 'wellle/tmux-complete.vim',
 'theniceboy/vim-snippets',
 'mbbill/undotree',
 {'theniceboy/vim-gitignore',  ft= {'gitignore', 'vim-plug'} },
 {'theniceboy/fzf-gitignore',  cmd= ':UpdateRemoteins' },
 'lewis6991/gitsigns.nvim',
 'cohama/agit.vim',
 'kdheepak/lazygit.nvim',
 'OmniSharp/omnisharp-vim',
 {'ctrlpvim/ctrlp.vim' ,  ft= {'cs', 'vim-plug'} } ,
 'elzr/vim-json',
 'neoclide/jsonc.vim',
 'othree/html5.vim',
 'alvan/vim-closetag',
 {'yuezk/vim-js',  ft= {'vim-plug', 'php', 'html', 'javascript', 'css', 'less'} },
 'HerringtonDarkholme/yats.vim',
 'MaxMEllon/vim-jsx-pretty',
 'pangloss/vim-javascript',
 'leafgarland/typescript-vim',
 'peitalin/vim-jsx-typescript',
 {'styled-components/vim-styled-components',  branch= 'main' },
 'pantharshit00/vim-prisma',
 {'fatih/vim-go' ,  ft= {'go', 'vim-plug'}  },
 {'Vimjas/vim-python-pep8-indent',  ft ={'python', 'vim-plug'} },
 {'numirias/semshi',  cmd= ':UpdateRemoteins', ft ={'python', 'vim-plug'} },
 {'tweekmonster/braceless.vim',  ft ={'python', 'vim-plug'} },
 {'dart-lang/dart-vim-plugin',  ft= {'dart', 'vim-plug'} },
 'keith/swift.vim',
 'arzg/vim-swift',
 {'suan/vim-instant-markdown', ft= 'markdown'},
 {'dhruvasagar/vim-table-mode',  on= 'TableModeToggle', ft= {'text', 'markdown', 'vim-plug'} },
 {'mzlogin/vim-markdown-toc',  ft= {'gitignore', 'markdown', 'vim-plug'} },
 'dkarter/bullets.vim',
 'wlangstroth/vim-racket',
 'hashivim/vim-terraform',
 'petertriho/nvim-scrollbar',
 'kevinhwang91/nvim-hlslens',
 'ggandor/lightspeed.nvim',
 'jiangmiao/auto-pairs',
 'mg979/vim-visual-multi',
 'theniceboy/tcomment_vim' ,
 'theniceboy/antovim' ,
 'gcmt/wildfire.vim' ,
 'junegunn/vim-after-object' ,
 'godlygeek/tabular' ,
 'tpope/vim-capslock'	,
 'svermeulen/vim-subversive',
 'theniceboy/argtextobj.vim',
 'rhysd/clever-f.vim',
 'AndrewRadev/splitjoin.vim',
 'theniceboy/pair-maker.vim',
 'theniceboy/vim-move',
 'Yggdroot/indentLine',
 'junegunn/goyo.vim',
 'reedes/vim-wordy',
 'nvim-lua/plenary.nvim' ,
 'nvim-pack/nvim-spectre',
 'skywind3000/asynctasks.vim',
 'skywind3000/asyncrun.vim',
 'itchyny/calendar.vim',
 'luochen1990/rainbow',
 'mg979/vim-xtabline',
 'ryanoasis/vim-devicons',
 'wincent/terminus',
 'kyazdani42/nvim-web-devicons',
 'lambdalisue/suda.vim' ,

'tpope/vim-fugitive',

'scrooloose/nerdtree',

'scrooloose/syntastic',

'mattn/emmet-vim', -- 利用css選擇器語法快速添加html標籤

-- 'junegunn/fzf',  -- 模糊搜索fzf,替代ctrl+P

-- 'junegunn/fzf.vim',-- 同作者在vim上的配置 

'vim-airline/vim-airline', -- 帥氣的状態欄,可惜不能用在vscode

'ap/vim-css-color', -- css顏色直觀

-- 'github/copilot.vim', -- AI寫代碼

-- 'nvim-treesitter/nvim-treesitter', -- 
-- 'nvim-treesitter/playground', -- 樹

-- 'theniceboy/nvim-deus', --nvim美化


})
packer.clean() -- vscode 會提示你清除不用的插件
-- packer.install() -- neovim 裏下載回來
-- require('hlslens').setup()
return plugins
