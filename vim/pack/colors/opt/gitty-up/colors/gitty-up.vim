set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "gitty-up"

set termguicolors

" default highlighting groups
hi ColorColumn guibg=#ffffff
hi CursorLine cterm=NONE gui=NONE guibg=#E9E8E0
hi Directory cterm=bold gui=bold guifg=#7766CC
hi DiffAdd guibg=#D5F9DB
hi DiffChange guibg=#FEFCDD
hi DiffDelete guibg=#F5BDA4
hi DiffText guibg=#ffffff guifg=#CD362C
hi VertSplit guifg=#f0efe7 guibg=#fcfcfa
hi Folded cterm=italic guifg=#7766CC guibg=#ffffff
hi! link FoldColumn LineNr
hi LineNr guifg=#9a9994 guibg=#ffffff
hi MatchParen cterm=bold gui=bold guifg=#cd362c guibg=#ffffff
hi NonText guifg=#9a9994
hi Normal guifg=#4e443c
hi Pmenu guibg=#ffffff
hi! link PmenuSel MatchParen
hi PmenuSbar guibg=#f0efe7
hi PmenuThumb guibg=#cd362c
hi Search guibg=#fffb00
hi SpellBad cterm=undercurl gui=undercurl guifg=#ea4c33
hi! link SpellCap SpellBad
hi! link SpellCap SpellLocal
hi SpellRare guifg=#ea4c33
hi StatusLine cterm=NONE gui=NONE guifg=#4e443c guibg=#f0efe7
hi StatusLineNC cterm=NONE gui=NONE guifg=#9a9994 guibg=#f0efe7
hi TabLine cterm=NONE gui=NONE guifg=#4e443c guibg=#e9e8e0
hi TabLineFill cterm=NONE gui=NONE guibg=#e9e8e0
hi! link TabLineSel MatchParen
hi Title cterm=bold gui=bold guifg=#885555
hi Visual guifg=#4e443c guibg=#b2d7fd
hi! link WildMenu MatchParen

" syntax highlighting groups
hi Comment guifg=#885555 guibg=#ffffff
hi Constant cterm=bold gui=bold guifg=#7766CC
hi Statement cterm=bold gui=bold guifg=#9a261e
hi Type guifg=#3988A6
hi PreProc guifg=#28CA41
hi Todo guibg=#F5BDA4 guifg=NONE
hi! link Error Todo
