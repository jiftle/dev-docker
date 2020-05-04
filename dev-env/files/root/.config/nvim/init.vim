" -------------------- tagbar ---------------
" 设置tagbar的窗口宽度
let g:tagbar_width=30
" 映射Tagbar的快捷键,自动打开
map <F3> :TagbarToggle<CR>
map <F4> :NERDTreeToggle<CR>
" 编译运行
map <F5> :call CompileRunGcc()<CR>
map <F6> :MRU<CR>

" ----------------- 编译 ---------------
" 编译
func! CompileRunGcc()
    exec "w"
"    exec "!clear"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'javascript'
		exec "!node %<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
    "    exec "!go build %<"
    "    exec "!time go run %"
         exec ":GoBuild"
         exec ":GoRun"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

" -------------------- 插件声明 ------------
call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes

" ================== vim默认配置 ===============
" vim的默认配置，宣称每个人都会同意的
" Plug 'tpope/vim-sensible'

" =================== 窗口管理 配置成IDE =======================
"  树状文件浏览器
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Buffer
Plug 'vim-scripts/bufexplorer.zip'
" 显示tag
Plug 'majutsushi/tagbar'
" 最近打开文件列表，q退出
Plug 'vim-scripts/mru.vim'
" 状态栏
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" ======================= 美化 ======================
" -------- 文件管理器-美化 ------------
" 文件浏览器显示好看的图标
Plug 'ryanoasis/vim-devicons'
" git状态显示
Plug 'Xuyuanp/nerdtree-git-plugin' 

" ------------ 主题配色 ----------------
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'


" ===================== 模糊搜索 ================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" 全局搜索某个单词，非常高效，神奇
Plug 'mileszs/ack.vim'

" ================ 不知道定位到底是什么？ 总之很强大，很多插件都依赖 ================
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" -------------- 通用开发插件 -------------
" 批量注释
Plug 'scrooloose/nerdcommenter'
" 自动输入配对符号
Plug 'jiangmiao/auto-pairs'

" ----------------- Python 支持 ----------------
" 给vim增加REPL
Plug 'sillybun/vim-repl'

" ----------------- 时间管理 ------------------
" 统计编码的时间
Plug 'wakatime/vim-wakatime'

" ---------------- 快捷输入 --------------
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" 自定义片段插件，解决键位YCM冲突
Plug 'jiftle/vim-snippets-jiftle'

" ----------------- Markdown TOC 支持 --------------------
Plug 'mzlogin/vim-markdown-toc'

" ------------- Emacs的Org-Mode，一种生活方式 -------------
Plug 'tpope/vim-speeddating' " vim-orgmode的依赖，<C-A>/<C-X>增加减少日期
Plug 'chrisbra/NrrwRgn' " 缩窄到可视区域
Plug 'jceb/vim-orgmode'

" -------------- 翻译工具 ----------------
"  有道翻译
Plug 'voldikss/vim-translator'

" ---------------- 测试区域 ---------------
Plug 'jiftle/vim-conf-default'

" Initialize plugin system
call plug#end()

" ---------------- 默认配色主题 -----------------
set bg=dark
" colorscheme space_vim_theme
colorscheme onedark
" colorscheme gruvbox
" set bg=light
" colorscheme NeoSolarized


" ------------------- 有道翻译插件，键盘映射 -------------
" <Leader>t 翻译光标下的文本，在命令行回显
nmap <silent> <Leader>t <Plug>Translate
vmap <silent> <Leader>t <Plug>TranslateV
" Leader>w 翻译光标下的文本，在窗口中显示
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
" Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV

