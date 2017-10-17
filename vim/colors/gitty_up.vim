" Name:         Gitty up?!
" Description:  An uncompromising and energetic light colour scheme
" Author:       Enrico Bothmann <enrico.bothmann@ed.ac.uk>
" Maintainer:   Enrico Bothmann <enrico.bothmann@ed.ac.uk>
" Website:      https://github.com/ebothmann/gitty-up
" License:      Vim License (see `:help license`)
" Last Updated: Di 17 Okt 23:04:40 2017

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
      \ && (!exists('&t_Co') || &t_Co < 256)
  echohl Error
  echomsg '[Gitty up?!] There are not enough colors.'
  echohl None
  finish
endif

set background=light

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'gitty_up'

if !has('gui_running') && get(g:, 'gitty_up_transp_bg', 0)
hi Normal ctermfg=59 ctermbg=NONE guifg=#4e443c guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Directory ctermfg=98 ctermbg=NONE guifg=#7766cc guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi NonText ctermfg=102 ctermbg=NONE guifg=#9a9994 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SpellBad ctermfg=167 ctermbg=NONE guifg=#ea4c33 guibg=NONE guisp=NONE cterm=NONE,undercurl gui=NONE,undercurl
hi Title ctermfg=95 ctermbg=NONE guifg=#885555 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Constant ctermfg=98 ctermbg=NONE guifg=#7766cc guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi PreProc ctermfg=41 ctermbg=NONE guifg=#28ca41 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Statement ctermfg=88 ctermbg=NONE guifg=#9a261e guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Type ctermfg=67 ctermbg=NONE guifg=#3988a6 guibg=NONE guisp=NONE cterm=NONE gui=NONE
else
hi Normal ctermfg=59 ctermbg=231 guifg=#4e443c guibg=#fcfcfa guisp=NONE cterm=NONE gui=NONE
hi Directory ctermfg=98 ctermbg=bg guifg=#7766cc guibg=bg guisp=NONE cterm=NONE,bold gui=NONE,bold
hi NonText ctermfg=102 ctermbg=bg guifg=#9a9994 guibg=bg guisp=NONE cterm=NONE gui=NONE
hi SpellBad ctermfg=167 ctermbg=bg guifg=#ea4c33 guibg=bg guisp=NONE cterm=NONE,undercurl gui=NONE,undercurl
hi Title ctermfg=95 ctermbg=bg guifg=#885555 guibg=bg guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Constant ctermfg=98 ctermbg=bg guifg=#7766cc guibg=bg guisp=NONE cterm=NONE,bold gui=NONE,bold
hi PreProc ctermfg=41 ctermbg=bg guifg=#28ca41 guibg=bg guisp=NONE cterm=NONE gui=NONE
hi Statement ctermfg=88 ctermbg=bg guifg=#9a261e guibg=bg guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Type ctermfg=67 ctermbg=bg guifg=#3988a6 guibg=bg guisp=NONE cterm=NONE gui=NONE
endif
hi ColorColumn ctermfg=fg ctermbg=231 guifg=fg guibg=#ffffff guisp=NONE cterm=NONE gui=NONE
hi CursorLine ctermfg=fg ctermbg=253 guifg=fg guibg=#e9e8e0 guisp=NONE cterm=NONE,none gui=NONE,none
hi DiffAdd ctermfg=fg ctermbg=194 guifg=fg guibg=#d5f9db guisp=NONE cterm=NONE gui=NONE
hi DiffChange ctermfg=fg ctermbg=229 guifg=fg guibg=#fefcdd guisp=NONE cterm=NONE gui=NONE
hi DiffDelete ctermfg=fg ctermbg=217 guifg=fg guibg=#f5bda4 guisp=NONE cterm=NONE gui=NONE
hi DiffText ctermfg=231 ctermbg=166 guifg=#ffffff guibg=#cd362c guisp=NONE cterm=NONE gui=NONE
hi! link FoldColumn LineNr
hi Folded ctermfg=98 ctermbg=231 guifg=#7766cc guibg=#ffffff guisp=NONE cterm=NONE,italic gui=NONE,italic
hi LineNr ctermfg=102 ctermbg=231 guifg=#9a9994 guibg=#ffffff guisp=NONE cterm=NONE gui=NONE
hi MatchParen ctermfg=166 ctermbg=231 guifg=#cd362c guibg=#ffffff guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Pmenu ctermfg=fg ctermbg=231 guifg=fg guibg=#ffffff guisp=NONE cterm=NONE gui=NONE
hi PmenuSbar ctermfg=fg ctermbg=255 guifg=fg guibg=#f0efe7 guisp=NONE cterm=NONE gui=NONE
hi! link PmenuSel MatchParen
hi PmenuThumb ctermfg=59 ctermbg=231 guifg=#4e443c guibg=#ffffff guisp=NONE cterm=NONE gui=NONE
hi Search ctermfg=fg ctermbg=226 guifg=fg guibg=#fffb00 guisp=NONE cterm=NONE gui=NONE
hi! link SpecialKey NonText
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare lighred
hi StatusLine ctermfg=59 ctermbg=255 guifg=#4e443c guibg=#f0efe7 guisp=NONE cterm=NONE,none gui=NONE,none
hi StatusLineNC ctermfg=102 ctermbg=255 guifg=#9a9994 guibg=#f0efe7 guisp=NONE cterm=NONE,none gui=NONE,none
hi TabLine ctermfg=59 ctermbg=253 guifg=#4e443c guibg=#e9e8e0 guisp=NONE cterm=NONE,none gui=NONE,none
hi TabLineFill ctermfg=fg ctermbg=253 guifg=fg guibg=#e9e8e0 guisp=NONE cterm=NONE,none gui=NONE,none
hi! link TabLineSel MatchParen
hi VertSplit ctermfg=255 ctermbg=231 guifg=#f0efe7 guibg=#fcfcfa guisp=NONE cterm=NONE gui=NONE
hi Visual ctermfg=59 ctermbg=153 guifg=#4e443c guibg=#b2d7fd guisp=NONE cterm=NONE gui=NONE
hi! link WildMenu MatchParen
hi Comment ctermfg=95 ctermbg=231 guifg=#885555 guibg=#ffffff guisp=NONE cterm=NONE,italic gui=NONE,italic
hi Todo ctermfg=NONE ctermbg=217 guifg=NONE guibg=#f5bda4 guisp=NONE cterm=NONE gui=NONE

" Color: black                #4e443c               59        Black
" Color: red                  #cd362c              166        DarkRed
" Color: green                #28ca41               41        DarkGreen
" Color: yellow               #fffb00              226        DarkYellow
" Color: brown                #885555               95        DarkBlue
" Color: darkred              #9a261e               88        DarkMagenta
" Color: purple               #7766cc               98        DarkCyan
" Color: mediumgrey           #e9e8e0              253        LightGrey
" Color: darkgrey             #9a9994              102        DarkGrey
" Color: verylightred         #f5bda4              217        LightRed
" Color: lightgreen           #d5f9db              194        LightGreen
" Color: lightyellow          #fefcdd              229        LightYellow
" Color: blue                 #b2d7fd              153        LightBlue
" Color: lightred             #ea4c33              167        LightMagenta
" Color: cyan                 #3988a6               67        LightCyan
" Color: silver               #fcfcfa              231        White
" Color: white                #ffffff              231        White
" Color: lightgrey            #f0efe7              255        LightGrey
" Background: light
" Normal               black             silver
" ColorColumn          fg                white
" CursorLine           fg                mediumgrey        none
" DiffAdd              fg                lightgreen
" DiffChange           fg                lightyellow
" DiffDelete           fg                verylightred
" DiffText             white             red
" Directory            purple            bg                bold
" FoldColumn       ->  LineNr
" Folded               purple            white             italic
" LineNr               darkgrey          white
" MatchParen           red               white             bold
" NonText              darkgrey          bg
" Pmenu                fg                white
" PmenuSbar            fg                lightgrey
" PmenuSel         ->  MatchParen
" PmenuThumb           black             white
" Search               fg                yellow
" SpecialKey       ->  NonText
" SpellBad             lightred          bg                undercurl
" SpellCap         ->  SpellBad
" SpellLocal       ->  SpellBad
" SpellRare        ->  lighred
" StatusLine           black             lightgrey         none
" StatusLineNC         darkgrey          lightgrey         none
" TabLine              black             mediumgrey        none
" TabLineFill          fg                mediumgrey        none
" TabLineSel        -> MatchParen
" Title                brown             bg                bold
" VertSplit            lightgrey         silver
" Visual               black             blue
" WildMenu          -> MatchParen
" Comment              brown             white             italic
" Constant             purple            bg                bold
" PreProc              green             bg
" Statement            darkred           bg                bold
" Todo                 none              verylightred
" Type                 cyan              bg
