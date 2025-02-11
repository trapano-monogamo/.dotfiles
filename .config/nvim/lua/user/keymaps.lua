local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }


vim.g.mapleader = " "


-- INSERT MODE --

keymap("i", ",.", "<ESC>", opts)


-- NORMAL MODE --

keymap("n", "<leader>n", ":bnext<CR>", opts)
keymap("n", "<leader>p", ":bprev<CR>", opts)
keymap("n", "<leader>N", ":tabnext<CR>", opts)
keymap("n", "<leader>P", ":tabprev<CR>", opts)

keymap("n", "<leader>e", ":Lex 20<CR>", opts)

keymap("n", "<leader>b", ":Buffers<CR>", opts)
keymap("n", "<leader>f", ":FZF<CR>", opts)

keymap("n", "<C-Up>", ":horizontal resize +1<CR>", opts)
keymap("n", "<C-Down>", ":horizontal resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- keymap("n", "<leader>t", ":split | resize 15 | term<CR>a", opts)
keymap("n", "<leader>t", ":call OpenOrCreateTerminal()<CR>", opts)


-- VISUAL MODE --

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- TERMINAL MODE --

keymap("t", "<ESC>", "<C-\\><C-n>", opts)
keymap("t", "<C-w>", "<C-\\><C-n><C-w>", opts)



-- Support functions --
vim.cmd([[

function! OpenOrCreateTerminal()
	" search for existing terminal buffer
	let l:term_bufnr=-1
	for buf in range(1, bufnr('$'))
		if bufexists(buf) && bufname(buf) =~ '^term:'
			let l:term_bufnr = buf
		endif
	endfor

	" create the split window at the bottom
	botright new
	resize 20

	" put the terminal in the created window
	if l:term_bufnr != -1
		execute 'buffer' l:term_bufnr
	else
		terminal
	endif

	startinsert
endfunction

]])
