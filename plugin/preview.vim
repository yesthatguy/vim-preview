" ============================================================================
" File:        preview.vim
" Description: Vim global plugin to preview markup files(markdown,rdoc,textile)
" Author:      Sergey Potapov (aka Blake) <blake131313 AT gmail DOT com>
" Version:     0.5
" Homepage:    http://github.com/greyblake/vim-preview
" License:     GPLv2+ -- look it up.
" Copyright:   Copyright (C) 2010 Sergey Potapov (aka Blake)
"
"              This program is free software; you can redistribute it and/or
"              modify it under the terms of the GNU General Public License as
"              published by the Free Software Foundation; either version 2 of
"              the License, or (at your option) any later version.
"
"              This program is distributed in the hope that it will be useful,
"              but WITHOUT ANY WARRANTY; without even the implied warranty of
"              MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
"              General Public License for more details.
"
"              You should have received a copy of the GNU General Public License
"              along with this program; if not, write to the Free Software
"              Foundation, Inc., 59 Temple Place, Suite 330, Boston,
"              MA 02111-1307 USA
" ============================================================================


function s:PreviewVerifyRuby()
    if has('ruby')
        return 1
    else
        echo 'To use Preview plugin you should compile vim with --enable-rubyinterp option'
        return 0
    endif
endfunction

function! s:Preview()
    if(s:PreviewVerifyRuby())
        call preview#show()
    endif
endfunction

function! s:PreviewMarkdown()
    if(s:PreviewVerifyRuby())
        call preview#show_markdown()
    endif
endfunction

function! s:PreviewTextile()
    if(s:PreviewVerifyRuby())
        call preview#show_textile()
    endif
endfunction

function! s:PreviewRdoc()
    if(s:PreviewVerifyRuby())
        call preview#show_rdoc()
    endif
endfunction

function! s:PreviewHtml()
    if(s:PreviewVerifyRuby())
        call preview#show_html()
    endif
endfunction

function! s:PreviewRonn()
    if(s:PreviewVerifyRuby())
        call preview#show_ronn()
    endif
endfunction

" Commands
command! Preview         call s:Preview()
command! PreviewMarkdown call s:PreviewMarkdown()
command! PreviewTextile  call s:PreviewTextile()
command! PreviewRdoc     call s:PreviewRdoc()
command! PreviewHtml     call s:PreviewHtml()
command! PreviewRonn     call s:PreviewRonn()

" Default options
if(!exists('g:PreviewBrowsers'))
    let g:PreviewBrowsers    = 'open,firefox,safari,chromium-browser,epiphany,google-chrome,opera'
endif
if(!exists('g:PreviewCSSPath'))
    let g:PreviewCSSPath     = ''
endif
if(!exists('g:PreviewMarkdownExt'))
    let g:PreviewMarkdownExt = 'markdown,md,mkd,mkdn,mdown'
endif
if(!exists('g:PreviewTextileExt'))
    let g:PreviewTextileExt  = 'textile'
endif
if(!exists('g:PreviewRdocExt'))
    let g:PreviewRdocExt     = 'rdoc'
endif
if(!exists('g:PreviewHtmlExt'))
    let g:PreviewHtmlExt     = 'html,htm'
endif
if(!exists('g:PreviewRonnExt'))
    let g:PreviewRonnExt     = 'ronn'
endif

" Default mapping
:nmap <Leader>P :Preview<CR>
