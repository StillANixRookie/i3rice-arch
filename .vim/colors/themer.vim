" Vim color file
" Converted from Textmate theme Brogrammer using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "themer"

" ━  CTERM
hi Normal           ctermfg=white    ctermbg=none
hi Title            ctermfg=white    ctermbg=none     cterm=bold
hi LineNr           ctermfg=blue     ctermbg=black    cterm=none
hi CursorLineNr     ctermfg=blue     ctermbg=DarkGray cterm=bold
hi SpecialKey       ctermfg=DarkGray ctermbg=none
hi ModeMsg          ctermfg=black    ctermbg=blue     cterm=bold
hi Cursor           ctermfg=black    ctermbg=red
hi ColorColumn                       ctermbg=DarkGray cterm=none
hi CursorLine                        ctermbg=DarkGray cterm=none
hi Visual           ctermfg=white    ctermbg=Gray
hi VisualNOS        ctermfg=white    ctermbg=Gray

hi Type             ctermfg=white    ctermbg=black    cterm=bold
hi Identifier       ctermfg=yellow   ctermbg=black    cterm=italic
hi Comment          ctermfg=Gray     ctermbg=black    cterm=italic
hi Folded           ctermfg=blue     ctermbg=black    cterm=italic
hi FoldColumn       ctermfg=black    ctermbg=black    cterm=italic
hi Constant         ctermfg=white    ctermbg=black    cterm=italic
hi Special          ctermfg=white    ctermbg=black    cterm=bold
hi Statement        ctermfg=white    ctermbg=black    cterm=bold
hi PreProc          ctermfg=blue     ctermbg=black    cterm=bold
hi MatchParen       ctermfg=yellow   ctermbg=black    cterm=bold
hi Search           ctermfg=black    ctermbg=yellow   cterm=none
hi Error            ctermfg=red      ctermbg=black    cterm=none
hi EndOfBuffer      ctermfg=black    ctermbg=black    cterm=none

hi SpellBad         ctermfg=red      ctermbg=none     cterm=undercurl,bold
hi SpellCap         ctermfg=blue     ctermbg=none     cterm=undercurl,bold
hi SpellRare        ctermfg=magenta  ctermbg=none     cterm=undercurl,bold
hi SpellLocal       ctermfg=cyan     ctermbg=none     cterm=undercurl,bold

hi StatusLine       ctermfg=black    ctermbg=blue
hi StatusLineNC     ctermfg=black    ctermbg=blue
hi StatusLineTerm   ctermfg=black    ctermbg=blue
hi StatusLineTermNC ctermfg=black    ctermbg=blue
hi ToolbarLine      ctermfg=black    ctermbg=blue
hi ToolbarButton    ctermfg=black    ctermbg=blue

hi Pmenu            ctermfg=blue     ctermbg=white    cterm=none
hi PmenuSel         ctermfg=black    ctermbg=blue     cterm=none
hi PmenuSbar        ctermfg=blue     ctermbg=black    cterm=none
hi PmenuThumb       ctermfg=green    ctermbg=green    cterm=none
hi TabLine          ctermfg=blue     ctermbg=Gray     cterm=none
hi TabLineSel       ctermfg=white    ctermbg=black    cterm=none
hi TabLineFill      ctermfg=blue     ctermbg=Gray     cterm=none

hi usrStatus        ctermfg=white    ctermbg=DarkGray
hi usrred           ctermfg=black    ctermbg=red      cterm=none
hi usrylw           ctermfg=black    ctermbg=yellow   cterm=none
hi usrgrn           ctermfg=black    ctermbg=green    cterm=none
hi usrgry           ctermfg=Gray     ctermbg=Darkgray cterm=none
hi usrblu           ctermfg=black    ctermbg=blue     cterm=none
hi usrgnt           ctermfg=black    ctermbg=magenta  cterm=none

" ━  GUI
hi Normal           guifg=#002b36 guibg=#fdf6e3
hi Title            guifg=#002b36 guibg=#fdf6e3 gui=bold
hi LineNr           guifg=#2aa198 guibg=#fdf6e3 gui=none
hi CursorLineNr     guifg=#2aa198 guibg=#e9e2cf gui=bold
hi SpecialKey       guifg=#e9e2cf guibg=#fdf6e3
hi ModeMsg          guifg=#fdf6e3 guibg=#2aa198 gui=bold
hi Cursor           guifg=#fdf6e3 guibg=#dc322f
hi ColorColumn                    guibg=#e9e2cf gui=none
hi CursorLine                     guibg=#e9e2cf gui=none
hi Visual           guifg=#002b36 guibg=#93cbbd
hi VisualNOS        guifg=#002b36 guibg=#93cbbd

hi Type             guifg=#002b36 guibg=#fdf6e3 gui=bold
hi Identifier       guifg=#b58900 guibg=#fdf6e3 gui=italic
hi Comment          guifg=#93cbbd guibg=#fdf6e3 gui=italic
hi Folded           guifg=#2aa198 guibg=#fdf6e3 gui=italic
hi FoldColumn       guifg=#fdf6e3 guibg=#fdf6e3 gui=italic
hi Constant         guifg=#002b36 guibg=#fdf6e3 gui=italic
hi Special          guifg=#002b36 guibg=#fdf6e3 gui=bold
hi Statement        guifg=#002b36 guibg=#fdf6e3 gui=bold
hi PreProc          guifg=#2aa198 guibg=#fdf6e3 gui=bold
hi MatchParen       guifg=#b58900 guibg=#fdf6e3 gui=bold
hi Search           guifg=#fdf6e3 guibg=#b58900 gui=none
hi Error            guifg=#dc322f guibg=#fdf6e3 gui=none
hi EndOfBuffer      guifg=#fdf6e3 guibg=#fdf6e3 gui=none

hi SpellBad         guifg=#dc322f guibg=#fdf6e3 gui=undercurl,bold
hi SpellCap         guifg=#2aa198 guibg=#fdf6e3 gui=undercurl,bold
hi SpellRare        guifg=#d33682 guibg=#fdf6e3 gui=undercurl,bold
hi SpellLocal       guifg=#268bd2 guibg=#fdf6e3 gui=undercurl,bold

hi StatusLine       guifg=#fdf6e3 guibg=#2aa198
hi StatusLineNC     guifg=#fdf6e3 guibg=#2aa198
hi StatusLineTerm   guifg=#fdf6e3 guibg=#2aa198
hi StatusLineTermNC guifg=#fdf6e3 guibg=#2aa198
hi ToolbarLine      guifg=#fdf6e3 guibg=#2aa198
hi ToolbarButton    guifg=#fdf6e3 guibg=#2aa198

hi Pmenu            guifg=#2aa198 guibg=#002b36 gui=none
hi PmenuSel         guifg=#fdf6e3 guibg=#2aa198 gui=none
hi PmenuSbar        guifg=#2aa198 guibg=#fdf6e3 gui=none
hi PmenuThumb       guifg=#859900 guibg=#859900 gui=none
hi TabLine          guifg=#2aa198 guibg=#fdf6e3 gui=none
hi TabLineSel       guifg=#fdf6e3 guibg=#2aa198 gui=none
hi TabLineFill      guifg=#2aa198 guibg=#fdf6e3 gui=none
hi TabLine          guifg=#2aa198 guibg=#93cbbd gui=none
hi TabLineSel       guifg=#002b36 guibg=#fdf6e3 gui=none
hi TabLineFill      guifg=#2aa198 guibg=#93cbbd gui=none

hi usrStatus        guifg=#002b36 guibg=#e9e2cf
hi usrgry           guifg=#93cbbd guibg=#e9e2cf gui=none
hi usrblu           guifg=#fdf6e3 guibg=#93cbbd gui=none
hi usrred           guifg=#fdf6e3 guibg=#ec9489 gui=none
hi usrylw           guifg=#fdf6e3 guibg=#d9bf71 gui=none
hi usrgrn           guifg=#fdf6e3 guibg=#c1c771 gui=none
hi usrgnt           guifg=#fdf6e3 guibg=#e896b2 gui=none
