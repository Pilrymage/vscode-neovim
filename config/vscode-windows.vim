function! s:split(...) abort
    let direction = a:1
    let file = exists('a:2') ? a:2 : ''
    call VSCodeCall(direction ==# 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if !empty(file)
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, empty(file) ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorHeight(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewHeight' : 'workbench.action.decreaseViewHeight')
    endfor
endfunction

function! s:manageEditorWidth(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewWidth' : 'workbench.action.decreaseViewWidth')
    endfor
endfunction

command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> ==# '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

AlterCommand sp[lit] Split
AlterCommand vs[plit] Vsplit
AlterCommand new New
AlterCommand vne[w] Vnew
AlterCommand on[ly] Only

" buffer management
nnoremap <Space>N <Cmd>call <SID>splitNew('h', '__vscode_new__')<CR>
xnoremap <Space>N <Cmd>call <SID>splitNew('h', '__vscode_new__')<CR>

nnoremap <Space>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
xnoremap <Space>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <Space>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
xnoremap <Space>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <Space><C-c> <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
xnoremap <Space><C-c> <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" window/splits management 
nnoremap <Space>s <Cmd>call <SID>split('h')<CR>
xnoremap <Space>s <Cmd>call <SID>split('h')<CR>
nnoremap <Space><C-s> <Cmd>call <SID>split('h')<CR>
xnoremap <Space><C-s> <Cmd>call <SID>split('h')<CR>

nnoremap <Space>v <Cmd>call <SID>split('v')<CR>
xnoremap <Space>v <Cmd>call <SID>split('v')<CR>
nnoremap <Space><C-v> <Cmd>call <SID>split('v')<CR>
xnoremap <Space><C-v> <Cmd>call <SID>split('v')<CR>

nnoremap <Space>= <Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
xnoremap <Space>= <Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
nnoremap <Space>_ <Cmd>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>
xnoremap <Space>_ <Cmd>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <Space>+ <Cmd>call <SID>manageEditorHeight(v:count, 'increase')<CR>
xnoremap <Space>+ <Cmd>call <SID>manageEditorHeight(v:count, 'increase')<CR>
nnoremap <Space>- <Cmd>call <SID>manageEditorHeight(v:count, 'decrease')<CR>
xnoremap <Space>- <Cmd>call <SID>manageEditorHeight(v:count, 'decrease')<CR>
nnoremap <Space>> <Cmd>call <SID>manageEditorWidth(v:count,  'increase')<CR>
xnoremap <Space>> <Cmd>call <SID>manageEditorWidth(v:count,  'increase')<CR>
nnoremap <Space>< <Cmd>call <SID>manageEditorWidth(v:count,  'decrease')<CR>
xnoremap <Space>< <Cmd>call <SID>manageEditorWidth(v:count,  'decrease')<CR>

nnoremap <Space>o <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
xnoremap <Space>o <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
nnoremap <Space><C-o> <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
xnoremap <Space><C-o> <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>

" window navigation
nnoremap <Space>e <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
xnoremap <Space>e <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap <Space>u <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
xnoremap <Space>u <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap <Space>n <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
xnoremap <Space>n <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <Space>i <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
xnoremap <Space>i <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

nnoremap <Space><Down> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
xnoremap <Space><Down> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap <Space><Up> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
xnoremap <Space><Up> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap <Space><Left> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
xnoremap <Space><Left> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <Space><Right> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
xnoremap <Space><Right> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

nnoremap <Space><C-j> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
xnoremap <Space><C-j> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
nnoremap <Space><C-i> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
xnoremap <Space><C-i> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
nnoremap <Space><C-h> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
xnoremap <Space><C-h> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
nnoremap <Space><C-l> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
xnoremap <Space><C-l> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>

nnoremap <Space><C-Down> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
xnoremap <Space><C-Down> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
nnoremap <Space><C-Up> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
xnoremap <Space><C-Up> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
nnoremap <Space><C-Left> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
xnoremap <Space><C-Left> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
nnoremap <Space><C-Right> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
xnoremap <Space><C-Right> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>

nnoremap <Space><S-j> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<CR>
xnoremap <Space><S-j> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<CR>
nnoremap <Space><S-k> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<CR>
xnoremap <Space><S-k> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<CR>
nnoremap <Space><S-h> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<CR>
xnoremap <Space><S-h> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<CR>
nnoremap <Space><S-l> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<CR>
xnoremap <Space><S-l> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<CR>

nnoremap <Space><S-Down> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<CR>
xnoremap <Space><S-Down> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<CR>
nnoremap <Space><S-Up> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<CR>
xnoremap <Space><S-Up> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<CR>
nnoremap <Space><S-Left> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<CR>
xnoremap <Space><S-Left> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<CR>
nnoremap <Space><S-Right> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<CR>
xnoremap <Space><S-Right> <Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<CR>

nnoremap <Space>w <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
xnoremap <Space>w <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <Space><Space> <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
xnoremap <Space><Space> <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <Space>W <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
xnoremap <Space>W <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
nnoremap <Space>p <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
xnoremap <Space>p <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>

nnoremap <Space>f <Cmd>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
xnoremap <Space>f <Cmd>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
nnoremap <Space>b <Cmd>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>
xnoremap <Space>b <Cmd>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>