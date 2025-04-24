" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Steven Vertigan <steven@vertigan.wattle.id.au>
" Last Change:	2006 Sep 23
" Revision #5: Switch main text from white to yellow for easier contrast,
" fixed some problems with terminal backgrounds.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "bblue"
hi Normal		guifg=yellow	guibg=black	ctermfg=yellow	ctermbg=black
hi NonText		guifg=magenta	ctermfg=lightMagenta
hi comment		guifg=gray		ctermfg=gray	ctermbg=black	gui=bold 
hi constant		guifg=cyan		ctermfg=cyan
hi identifier	guifg=gray		ctermfg=red
hi statement	guifg=white		ctermfg=white	ctermbg=black	gui=none
hi preproc		guifg=green		ctermfg=green
hi type			guifg=orange	ctermfg=lightRed	ctermbg=black
hi special		guifg=magenta	ctermfg=lightMagenta	ctermbg=black
hi Underlined	guifg=cyan		ctermfg=cyan	gui=underline	cterm=underline
hi label		guifg=yellow	ctermfg=yellow
hi operator		guifg=orange	gui=bold	ctermfg=lightRed	ctermbg=black

hi ErrorMsg		guifg=orange	guibg=black	ctermfg=lightRed
hi WarningMsg	guifg=cyan		guibg=black	ctermfg=cyan	gui=bold
hi ModeMsg		guifg=yellow	gui=NONE	ctermfg=yellow
hi MoreMsg		guifg=yellow	gui=NONE	ctermfg=yellow
hi Error		guifg=red		guibg=black	gui=underline	ctermfg=red

hi Todo			guifg=black		guibg=orange	ctermfg=black	ctermbg=darkYellow
hi Cursor		guifg=black		guibg=white		ctermfg=black	ctermbg=white
hi Search		guifg=black		guibg=orange	ctermfg=black	ctermbg=darkYellow
hi IncSearch	guifg=black		guibg=yellow	ctermfg=black	ctermbg=darkYellow
hi LineNr		guifg=cyan		ctermfg=cyan
hi title		guifg=white	gui=bold	cterm=bold

hi StatusLineNC	gui=NONE	guifg=black guibg=blue	ctermfg=black  ctermbg=blue
hi StatusLine	gui=bold	guifg=cyan	guibg=blue	ctermfg=cyan   ctermbg=blue
hi VertSplit	gui=none	guifg=blue	guibg=blue	ctermfg=blue	ctermbg=blue

hi Visual		term=reverse		ctermfg=black	ctermbg=darkCyan	guifg=black		guibg=darkCyan

hi DiffChange	guibg=darkGreen		guifg=black	ctermbg=darkGreen	ctermfg=black
hi DiffText		guibg=olivedrab		guifg=black		ctermbg=lightGreen	ctermfg=black
hi DiffAdd		guibg=slateblue		guifg=black		ctermbg=blue		ctermfg=black
hi DiffDelete   guibg=coral			guifg=black	ctermbg=cyan		ctermfg=black

hi Folded		guibg=orange		guifg=black		ctermbg=yellow		ctermfg=black
hi FoldColumn	guibg=gray30		guifg=black	ctermbg=gray		ctermfg=black
hi cIf0			guifg=gray			ctermfg=gray

