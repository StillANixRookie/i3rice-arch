"  dBP dP  dBP dBBBBBBb dBBBBBb    dBBBP
"               '   dB'     dBP
" dB .BP dBP dB'dB'dB'  dBBBBK'  dBP
" BB.BP dBP dB'dB'dB'  dBP  BB  dBP
" BBBP dBP dB'dB'dB'  dBP  dB' dBBBBP

" >>>> SETTINGS
" //// GENERAL
filetype plugin on    " required
execute pathogen#infect()
syntax enable
set encoding=utf-8
set number
set relativenumber
set hls
set is
set wrap
set linebreak
set nolist  "disable linebreak
set textwidth=0
set wrapmargin=0
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set title titlestring=%f titlelen=70
autocmd FileType python call matchadd('ColorColumn', '\%81v', 100)
autocmd FileType vim call matchadd('ColorColumn', '\%81v', 100)
autocmd FileType conf call matchadd('ColorColumn', '\%81v', 100)
autocmd FileType perl call matchadd('ColorColumn', '\%81v', 100)
autocmd FileType sh call matchadd('ColorColumn', '\%81v', 100)
autocmd Filetype calendar set laststatus=0
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd CursorMoved,CursorMovedI * update
autocmd CursorHold,CursorHoldI * redraw!

map <Tab><Tab> <Esc>/>>>><Enter>

inoremap \ph <++>

" //// CHANGE HIGHLIGHT COLOURS
hi Normal ctermbg=none guibg=black
hi LineNr ctermbg=none ctermfg=grey
hi Folded cterm=italic ctermfg=blue ctermbg=none
hi ModeMsg cterm=bold ctermfg=white
hi lCursor ctermbg=white ctermfg=black
hi ColorColumn ctermbg=red

" //// RESIZING
map .rk :res<space>+5<Enter>
map .rj :res<space>-5<Enter>
map .rh :vertical<space>resize<space>-5<Enter>
map .rl :vertical<space>resize<space>+5<Enter>

" //// SPLIT OPEN AT BOTTOM & RIGHT
set splitbelow
set splitright

" //// BRACKETS
inoremap () ()<++><Esc>F)i
inoremap [] []<++><Esc>F]i
inoremap {} {}<++><Esc>F}i

" //// CALENDAR
let g:calendar_frame = 'default'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_modifiable = 1

" >>>> COMMENT/UNCOMMENT
vnoremap \# :'<,'>norm 0i#<Enter>
vnoremap \d# :'<,'>norm 0x<Enter>
vnoremap \% :'<,'>norm 0i%<Enter>
vnoremap \d% :'<,'>norm 0x<Enter>
vnoremap \! :'<,'>norm 0i!<Enter>
vnoremap \d! :'<,'>norm 0x<Enter>
vnoremap \" :'<,'>norm 0i"<Enter>
vnoremap \d" :'<,'>norm 0x<Enter>

" >>>> GOYO
map \gy :Goyo<bar>hi<space>Normal<space>ctermbg=none<space>guibg=black<bar>
	\hi<space>LineNr<space>ctermbg=none<space>ctermfg=grey<bar>
	\hi<space>Folded<space>ctermfg=grey<space>ctermbg=none<bar>
	\hi<space>ModeMsg<space>cterm=bold<space>ctermfg=white<bar>
	\hi<space>lCursor<space>ctermbg=white<space>ctermfg=black
	\<Enter><Enter>

" >>>> STATUSLINE
" //// FUNCTIONS
set laststatus=2

function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" //// ACTUAL
set statusline=
set statusline+=%#lCursor#
set statusline+=\ /%F
set statusline+=\ 
set statusline+=%#LineNr#
set statusline+=\ %-3(%{FileSize()}%)
set statusline+=\ %{ReadOnly()}\ %m\ %w\ 
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ 
set statusline+=%#lCursor#
set statusline+=\ %p%%
set statusline+=\ L:
set statusline+=%l/
set statusline+=%L
set statusline+=\ C:
set statusline+=%c
set statusline+=\ 


" >>>> LATEX
" //// LATEX-SUITE
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode -shell-escape $*'
let g:Tex_ViewRule_pdf = '/usr/bin/zathura'
let g:Tex_MultipleCompileFormats='pdf,dvi'
let g:Tex_BibtexFlavor = 'biber'

"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
"let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

filetype plugin on "invoke latex-suite when opening tex file
set grepprg=grep\ -nH\ $* "set grep to always generate filename
let g:tex_flavor='latex' "invoke tex, not plaintex, for empty tex file
set iskeyword+=: "press <C-n> to cycle through \label's

" //// COMPILING
" COMPLETE
autocmd Filetype tex map ;C :w<space>!bash<space>~/scripts/clatex<space><C-r>
	\%<Enter><Enter>

" PDFLATEX
autocmd Filetype tex map ;p :w<space>!pdflatex<space>-interaction=nonstopmode
	\<space>-shell-escape<space><C-r>%<Enter><Enter>

" XELATEX
autocmd Filetype tex map ;x :w<space>!xelatex<space>-interaction=nonstopmode
	\<space>-shell-escape<space><C-r>%<Enter><Enter>

" BIBER
autocmd Filetype tex map ;b :!biber<space><C-r>%<BS><BS><BS>bcf<Enter><Enter>

" MAKEINDEX
autocmd Filetype tex map ;n :!makeindex<space><C-r>%<BS><BS><BS>
	\nlo<space>-s<space>nomencl.ist<space>-o<space><C-r>%<BS><BS><BS>
	\nls<Enter><Enter>

" //// LUKE SMITH'S SNIPPETS
autocmd FileType tex inoremap $$ $$<++><Esc>F$i
autocmd FileType tex inoremap <Tab>( \left(\right)<++><Esc>T(i
autocmd FileType tex inoremap <Tab>{{ \left\{\right\}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>[ \left[\right]<++><Esc>T[i
autocmd FileType tex inoremap <Tab>bar \left\right<++><Esc>F\i

autocmd FileType tex inoremap <Tab>bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>bg \begin{DELRN}<Enter><++><Enter>\end{DELRN}
	\<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap <Tab>bm \begin{multicols}{2}<Enter><Enter><Enter>
	\<Enter>\end{multicols}<Enter><Enter><++><Esc>4k0fR

autocmd FileType tex inoremap <Tab>ci \cite{}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>ct \citet{}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>cp \citep{}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>ch \chapter{}<Enter><++><Esc>kf}i
                                     
autocmd FileType tex inoremap <Tab>en \begin{equation}<Enter><Enter>\end{equation}
	\<Enter><++><Esc>02ki            
autocmd FileType tex inoremap <Tab>eq $$<Enter><Enter>$$<Enter><++><Esc>03ki
                                     
autocmd FileType tex inoremap <Tab>it \textit{}<++><Esc>T{i
                                     
autocmd FileType tex inoremap <Tab>lf \label{fig:}<Esc>T:i
autocmd FileType tex inoremap <Tab>lt \label{tab:}<Esc>T:i
autocmd FileType tex inoremap <Tab>le \label{eq:}<Esc>T:i
autocmd FileType tex inoremap <Tab>ls \label{sec:}<Esc>T:i
                                   
autocmd FileType tex inoremap <Tab>nc \newcommand{}[<++>]<++>{<++>}<Esc>2F}i
                                   
autocmd FileType tex inoremap <Tab>pc \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>pt \item<space>
                                     
autocmd FileType tex inoremap <Tab>rf \figref{fig:}<++><Esc>T:i
autocmd FileType tex inoremap <Tab>rt \tabref{tab:}<++><Esc>T:i
autocmd FileType tex inoremap <Tab>re \eqnref{eq:}<++><Esc>T:i
autocmd FileType tex inoremap <Tab>rs \secref{sec:}<++><Esc>T:i
                                   
autocmd FileType tex inoremap <Tab>st {\setstretch{}<Enter><++><Enter>
	\<Enter>}<Enter><Enter><++><Esc>5k0f{a
autocmd FileType tex inoremap <Tab>sc \textsc{}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>s1 \section{}<Enter><++><Esc>kf}i
autocmd FileType tex inoremap <Tab>s2 \subsection{}<Enter><++><Esc>kf}i
autocmd FileType tex inoremap <Tab>s3 \subsubsection{}<Enter><++><Esc>kf}i
                                     
autocmd FileType tex inoremap <Tab>tt \texttt{}<++><Esc>T{i
autocmd FileType tex inoremap <Tab>tc \textcite{}<++><Esc>T{i
                                     
autocmd FileType tex inoremap <Tab>up \usepackage[]<++>{<++>}<Esc>T[i
autocmd FileType tex inoremap <Tab>ul \underline{}<++><Esc>T{i
                                     
autocmd FileType tex vnoremap <Tab>bf xi\textbf{<Esc>pa}<Esc>
autocmd FileType tex vnoremap <Tab>it xi\textit{<Esc>pa}<Esc>
autocmd FileType tex vnoremap <Tab>sc xi\textsc{<Esc>pa}<Esc>
autocmd FileType tex vnoremap <Tab>tt xi\texttt{<Esc>pa}<Esc>
autocmd FileType tex vnoremap <Tab>ul xi\underline{<Esc>pa}<Esc>
autocmd FileType tex vnoremap <Tab>st xi{\setstretch{1.0}<Enter><Esc>pa}<Esc>
autocmd FileType tex vnoremap <Tab>bm xi\begin{multicols}{2}<Enter><Esc>pa
	\<Enter>\end{multicols}<Esc>

" //// BIB SHORTCUTS
autocmd Filetype bib inoremap \a <Esc>A<Enter>@article{,<Enter>}<Esc>kf,i
autocmd Filetype bib inoremap \b <Esc>A<Enter>@book{,<Enter>}<Esc>kf,i
autocmd Filetype bib inoremap \i <Esc>A<Enter>@inproceedings{,<Enter>}<Esc>kf,i
autocmd Filetype bib inoremap \t <Esc>A<Enter>@phdthesis{,<Enter>}<Esc>kf,i
autocmd Filetype bib inoremap \o <Esc>A<Enter>@online{,<Enter>
	\<Tab>title<space>=<space>{<++>},<Enter>
	\<Tab>author<space>=<space>{<++>},<Enter>
	\<Tab>publisher<space>=<space>{<++>}<Enter>}<Enter><Enter><++><Esc>06kf,i

autocmd Filetype bib inoremap <Tab>tit <Esc>A<Enter>
    \<Tab>title<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>aut <Esc>A<Enter>
    \<Tab>author<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>yea <Esc>A<Enter>
    \<Tab>year<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>pub <Esc>A<Enter>
    \<Tab>publisher<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>jou <Esc>A<Enter>
    \<Tab>journal<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>vol <Esc>A<Enter>
    \<Tab>volume<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>pag <Esc>A<Enter>
    \<Tab>pages<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>sch <Esc>A<Enter>
    \<Tab>school<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>boo <Esc>A<Enter>
    \<Tab>booktitle<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>num <Esc>A<Enter>
    \<Tab>number<space>=<space>{},<Esc>hi
autocmd Filetype bib inoremap <Tab>org <Esc>A<Enter>
    \<Tab>organization<space>=<space>{},<Esc>hi

" >>>> GROFF
au BufNewFile,BufRead *.groff,*.ms set filetype=groff
autocmd FileType groff nnoremap \c :!bash<space>~/scripts/cgroff<space><C-r>%<Enter><Enter>

" //// SNIPPETS

autocmd FileType groff inoremap ;b <Esc>o.B<space>""<space><++><Enter><++><Esc>0kf"a
autocmd FileType groff inoremap ;c <Esc>o.[<Enter><Enter>.]<Enter><++><Esc>02ki
autocmd FileType groff inoremap ;d <Esc>o.IP<space><space>2<Enter><++><Esc>0kt2i
autocmd FileType groff inoremap ;e0 <Esc>o.nr<space>step<space>0<space>1<Enter>
    \.IP<space>\n+[step]<Enter>
autocmd FileType groff inoremap ;ei <Esc>o.IP<space>\n+[step]<Enter>
autocmd FileType groff inoremap ;i <Esc>o.I<space>""<space><++><Enter><++><Esc>0kf"a
autocmd FileType groff inoremap ;l <Esc>o.IP<space>\[bu]<space>2<Enter>
autocmd FileType groff inoremap ;n <Esc>o.RS<Enter><Enter>.RE<Enter><++><Esc>02ki
autocmd FileType groff inoremap ;s0 <Esc>o.SH<Enter><Enter>.PP<Enter><++><Esc>02ki
autocmd FileType groff inoremap ;s1 <Esc>o.NH<Enter><Enter>.PP<Enter><++><Esc>02ki
autocmd FileType groff inoremap ;s2 <Esc>o.NH<space>2<Enter><Enter>.PP<Enter><++><Esc>02ki
autocmd FileType groff inoremap ;s3 <Esc>o.NH<space>3<Enter><Enter>.PP<Enter><++><Esc>02ki
autocmd FileType groff inoremap ;s4 <Esc>o.NH<space>4<Enter><Enter>.PP<Enter><++><Esc>02ki
autocmd FileType groff inoremap ;u <Esc>o.UL<space>""<space><++><Enter><++><Esc>0kf"a
autocmd FileType groff inoremap ;x <Esc>o.BX<space>""<space><++><Enter><++><Esc>0kf"a
autocmd FileType groff inoremap <Tab><Enter> <Esc>o.PP<Enter>

" >>>> MARKDOWN
" //// MACROS
autocmd FileType markdown inoremap 1h <Esc>A<Enter><Enter>#<space>
autocmd FileType markdown inoremap 2h <Esc>A<Enter><Enter>##<space>
autocmd FileType markdown inoremap 3h <Esc>A<Enter><Enter>###<space>
autocmd FileType markdown inoremap 4h <Esc>A<Enter><Enter>####<space>
autocmd FileType markdown inoremap 5h <Esc>A<Enter><Enter>#####<space>
autocmd FileType markdown inoremap 6h <Esc>A<Enter><Enter>######<space>
autocmd FileType markdown inoremap 7h <Esc>A<Enter><Enter>#######<space>

autocmd FileType markdown inoremap 1p <Esc>A<Enter>+<space>
autocmd FileType markdown inoremap 2p <Esc>A<Enter><Tab>+<space>
autocmd FileType markdown inoremap 3p <Esc>A<Enter><Tab><Tab>+<space>
autocmd FileType markdown inoremap 4p <Esc>A<Enter><Tab><Tab><Tab>+<space>
autocmd FileType markdown inoremap 5p <Esc>A<Enter><Tab><Tab><Tab><Tab>+<space>
autocmd FileType markdown inoremap 6p <Esc>A<Enter><Tab><Tab><Tab><Tab><Tab>+<space>
autocmd FileType markdown inoremap 7p <Esc>A<Enter><Tab><Tab><Tab><Tab><Tab><Tab>+<space>

autocmd FileType markdown inoremap 1n <Esc>A<Enter>1.<space>
autocmd FileType markdown inoremap 2n <Esc>A<Enter><Tab>#.<space>
autocmd FileType markdown inoremap 3n <Esc>A<Enter><Tab><Tab>(#)<space>
autocmd FileType markdown inoremap 4n <Esc>A<Enter><Tab><Tab><Tab>(1)<space>
autocmd FileType markdown inoremap 5n <Esc>A<Enter><Tab><Tab><Tab><Tab>#.<space>
autocmd FileType markdown inoremap 6n <Esc>A<Enter><Tab><Tab><Tab><Tab><Tab>(#)<space>
autocmd FileType markdown inoremap 7n <Esc>A<Enter><Tab><Tab><Tab><Tab><Tab><Tab>1.<space>

autocmd FileType markdown inoremap <Tab>b ****<++><Esc>5hi
autocmd FileType markdown inoremap <Tab>i __<++><Esc>4hi
autocmd FileType markdown inoremap <Tab>s ~~~~<++><Esc>5hi

autocmd FileType markdown inoremap <Tab>pic <Esc>A<Enter><Enter>![](<++>){#fig:<++>}<Esc>F]i
autocmd FileType markdown inoremap <Tab>eq $$$$<space>{#eq:<++>}<++><Esc>F$hi
autocmd FileType markdown inoremap <Tab>lin <Esc>A<Enter><Enter>[](<++>)<Esc>F]i
autocmd FileType markdown inoremap <Tab>cod <Esc>A<Enter><Enter>```<Enter><++><Enter>```<Esc>2kA
autocmd FileType markdown inoremap <Tab>ytb <Esc>A<Enter><Enter>[![](http://img.youtube.com/vi/<++>
	\/0.jpg)](http://www.youtube.com/watch?v=<++>)<Esc>F[a

autocmd FileType markdown inoremap <Tab>ci [@]<Esc>i
autocmd FileType markdown inoremap <Tab>lt {#tbl:}<Esc>i
autocmd FileType markdown inoremap <Tab>ls {#sec:}<Esc>i
autocmd FileType markdown inoremap <Tab>rf [@fig:]<Esc>i
autocmd FileType markdown inoremap <Tab>rs [@sec:]<Esc>i
autocmd FileType markdown inoremap <Tab>re [@eq:]<Esc>i
autocmd FileType markdown inoremap <Tab>rt [@tbl:]<Esc>i

autocmd FileType markdown vnoremap \b xa**<Esc>pa**<Esc>
autocmd FileType markdown vnoremap \i xa_<Esc>pa_<Esc>
autocmd FileType markdown vnoremap \s xa~~<Esc>pa~~<Esc>
autocmd FileType markdown vnoremap \p :'<,'>norm 0i-<space><Esc>
autocmd FileType markdown vnoremap \n :'<,'>norm 0i1.<space><Esc>

autocmd FileType markdown vnoremap \1p :'<,'>norm 0dt+<Enter>
autocmd FileType markdown vnoremap \2p :'<,'>norm 0dt+i<Tab><Esc>
autocmd FileType markdown vnoremap \3p :'<,'>norm 0dt+i<Tab><Tab><Esc>
autocmd FileType markdown vnoremap \4p :'<,'>norm 0dt+i<Tab><Tab><Tab><Esc>
autocmd FileType markdown vnoremap \5p :'<,'>norm 0dt+i<Tab><Tab><Tab><Tab><Esc>
autocmd FileType markdown vnoremap \6p :'<,'>norm 0dt+i<Tab><Tab><Tab><Tab><Tab><Esc>
autocmd FileType markdown vnoremap \7p :'<,'>norm 0dt+i<Tab><Tab><Tab><Tab><Tab><Tab><Esc>

autocmd FileType markdown vnoremap \1n :'<,'>norm 0dt1.<Enter>
autocmd FileType markdown vnoremap \2n :'<,'>norm 0dt1.i<Tab><Esc>
autocmd FileType markdown vnoremap \3n :'<,'>norm 0dt1.i<Tab><Tab><Esc>
autocmd FileType markdown vnoremap \4n :'<,'>norm 0dt1.i<Tab><Tab><Tab><Esc>
autocmd FileType markdown vnoremap \5n :'<,'>norm 0dt1.i<Tab><Tab><Tab><Tab><Esc>
autocmd FileType markdown vnoremap \6n :'<,'>norm 0dt1.i<Tab><Tab><Tab><Tab><Tab><Esc>
autocmd FileType markdown vnoremap \7n :'<,'>norm 0dt1.i<Tab><Tab><Tab><Tab><Tab><Tab><Esc>

" //// COMPILER
autocmd Filetype markdown map \c :!bash<space>~/scripts/cmkd<space><C-r>%<Enter><Enter>

" >>>> R MARKDOWN
autocmd Filetype rmd map \c :!echo<space>"require(rmarkdown);<space>
	\render('<c-r>%')"<space>\|<space>R<space>--vanilla<Enter><Enter>

autocmd FileType rmd inoremap 1n A<Enter>1.<space>
autocmd FileType rmd inoremap 2n A<Enter><Tab>#.<space>
autocmd FileType rmd inoremap 3n A<Enter><Tab><Tab>(#)<space>
autocmd FileType rmd inoremap 4n A<Enter><Tab><Tab><Tab>(1)<space>
autocmd FileType rmd inoremap 5n A<Enter><Tab><Tab><Tab><Tab>#.<space>
autocmd FileType rmd inoremap 6n A<Enter><Tab><Tab><Tab><Tab><Tab>(#)<space>
autocmd FileType rmd inoremap 7n A<Enter><Tab><Tab><Tab><Tab><Tab><Tab>1.<space>

autocmd FileType rmd inoremap 1h <Esc>A<Enter><Enter>#<space>
autocmd FileType rmd inoremap 2h <Esc>A<Enter><Enter>##<space>
autocmd FileType rmd inoremap 3h <Esc>A<Enter><Enter>###<space>
autocmd FileType rmd inoremap 4h <Esc>A<Enter><Enter>####<space>
autocmd FileType rmd inoremap 5h <Esc>A<Enter><Enter>#####<space>
autocmd FileType rmd inoremap 6h <Esc>A<Enter><Enter>######<space>
autocmd FileType rmd inoremap 7h <Esc>A<Enter><Enter>#######<space>

autocmd FileType rmd inoremap 1p <Esc>A<Enter>+<space>
autocmd FileType rmd inoremap 2p <Esc>A<Enter><Tab>+<space>
autocmd FileType rmd inoremap 3p <Esc>A<Enter><Tab><Tab>+<space>
autocmd FileType rmd inoremap 4p <Esc>A<Enter><Tab><Tab><Tab>+<space>
autocmd FileType rmd inoremap 5p <Esc>A<Enter><Tab><Tab><Tab><Tab>+<space>
autocmd FileType rmd inoremap 6p <Esc>A<Enter><Tab><Tab><Tab><Tab><Tab>+<space>
autocmd FileType rmd inoremap 7p <Esc>A<Enter><Tab><Tab><Tab><Tab><Tab><Tab>+<space>

autocmd FileType rmd inoremap <Tab>b ****<++><Esc>5hi
autocmd FileType rmd inoremap <Tab>i __<++><Esc>4hi
autocmd FileType rmd inoremap <Tab>u ~~~~<++><Esc>5hi
autocmd FileType rmd inoremap <Tab>pic <Esc>A<Enter><Enter>![](<++>)<Esc>F]i
autocmd FileType rmd inoremap <Tab>lin <Esc>A<Enter><Enter>[](<++>)<Esc>F]i
autocmd FileType rmd inoremap <Tab>cod <Esc>A<Enter><Enter>```{}<Enter><++><Enter>```<Esc>02kf{a
autocmd FileType rmd inoremap <Tab>ytb <Esc>A<Enter><Enter>[![](http://img.youtube.com/vi/<++>
	\/0.jpg)](http://www.youtube.com/watch?v=<++>)<Esc>F[a

autocmd FileType rmd vnoremap \b xa**<Esc>pa**<Esc>
autocmd FileType rmd vnoremap \i xa_<Esc>pa_<Esc>
autocmd FileType rmd vnoremap \s xa~~<Esc>pa~~<Esc>
autocmd Filetype rmd inoremap \r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap \p ```{python}<CR>```<CR><CR><esc>2kO

" >>>> VIEW PDF
autocmd FileType tex,rmd map ;vp :silent<space>!zathura<space>
    \<C-r>%<BS><BS><BS>pdf<space>&<Enter>
autocmd FileType markdown,groff map ;vp :silent<space>!zathura<space>
    \<C-r>%<BS><BS>pdf<space>&<Enter>

" >>>> VIEW HTML
autocmd Filetype markdown map ;vh :!bash<space>~/scripts/openhtml<space><C-r>%<Enter><Enter>

" >>>> PYTHON FILES
autocmd Filetype python map \ll :w<space>!python<Enter>
" >>>> PDF WORDCOUNT
autocmd Filetype tex map ;wc :!bash<space>~/scripts/wcpdf<space><C-r>%
	\<BS><BS><BS><BS><Enter>
autocmd Filetype rmd map \wc :!bash<space>~/scripts/wcpdf<space><C-r>%
	\<BS><BS><BS><BS><Enter>
autocmd Filetype markdown map \wc :!bash<space>~/scripts/wcpdf<space><C-r>%
	\<BS><BS><BS><Enter>

