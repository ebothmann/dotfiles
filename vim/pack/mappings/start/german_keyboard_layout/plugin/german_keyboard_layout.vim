" configure vim for a german keyboard layout
"
" NOTE: CTRL-ä is ESC, CTRL-ö is CTRL-\, CTRL-ü is not available (and neither
" are CTRL-+ or CTRL-#)
"
" NOTE: it is not a good idea to use ü and + as replacements for [ and ],
" which would be the natural choice comparing the german and the english
" keyboard layouts, because + is not only a (redundant) command, but also the
" name for a register, therefore use ö and ä
"
" to make combinations like [[ work, we need to use langmap, langnoremap
" however is not needed because ö and ä are not being defined anywhere else
set langmap=ö[,ä],Ö{,Ä}
" to make mappings from plug-ins such as unimpaired work, we also need to map
" the keys (recursively)
nmap ö [
nmap ä ]
nmap Ö {
nmap Ä }
omap ö [
omap ä ]
omap Ö {
omap Ä }
xmap ö [
xmap ä ]
xmap Ö {
xmap Ä }
" we have not used ü so far, let's make that our replacement for CTRL-]
nnoremap ü <C-]>
