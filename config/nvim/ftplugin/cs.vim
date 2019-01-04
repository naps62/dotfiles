augroup omnisharp_commands
  autocmd!

  " " Show type information automatically when the cursor stops moving
  " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  " " Update the highlighting whenever leaving insert mode
  " autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()

  " " Alternatively, use a mapping to refresh highlighting for the current buffer
  " nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>

  " " The following commands are contextual, based on the cursor position.
  " nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  " nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
  " nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  " nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

  " " Finds members in the current buffer
  " nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

  " nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
  " nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  " nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
  " nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
  " inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

  " " Navigate up and down by method/property/field
  " nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
  " nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END
