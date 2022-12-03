"googling stuff with brave
function! Google(url)
	let isBraveOpen = system('~/isInstanceOfBraveOpen.sh')
	if ( isBraveOpen == "true")
		silent execute ":!brave google.com/search?q=\"" . a:url . "\""
	else
		echo "Instanz bitte vorher manuell oeffnen"
	endif
endfunction	
nnoremap <leader>sg :!brave google.com<cr>
command! -nargs=+ Google call Google(<q-args>)
