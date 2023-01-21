# vscode-neovim（Colemak键位）

如名称所示，这个库用于保存vscode-neovim插件的配置。因为vscode与neovim和Colemak键盘互相有冲突，不可避免的要大改。

个人使用Lua编写脚本。如果是连一个nvim都装不了的电脑，我大概不会想用它来码代码。

## 文檔結構

其一，init.lua文件。這裏寫作myinit.lua。用於加載基本映射。

其一。plugins.lua文件。寫作myplugins.lua,用於加載插件。這裏的插件管理器是packer.nvim，強調用lua寫配置。

以上兩個文件大量參考ultimate colemak項目。

其一，configUpdate,自動載入個人配置文件環境，同時輔助測試。

其一，config文件夾，載入其他vim/lua配置。兩個文件從vscode-neovim 項目中抄過來，同時修改爲基於leader鍵的映射。