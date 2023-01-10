set mouse=a
set tabstop=2
set shiftwidth=0

set completeopt=menuone,noinsert,noselect
set shortmess+=c

colorscheme solarized

lua <<EOF
local lsp_status = require('lsp-status')

lsp_status.register_progress()
EOF

function! LspStatus() abort
	let status = luaeval('require("lsp-status").status()')
	return trim(status)
endfunction

call airline#parts#define_function('lsp_status', 'LspStatus')
call airline#parts#define_condition('lsp_status', 'luaeval("#vim.lsp.buf_get_clients() > 0")')

let g:airline#extensions#nvimlsp#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_warning = airline#section#create_right(['lsp_status'])
let g:airline_theme='solarized'

let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

lua <<EOF
local nvim_lsp = require 'lspconfig'

nvim_lsp.gopls.setup{
  cmd = { "gopls", "serve" }
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		})
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	},
})
EOF

lua <<EOF
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local servers = { 'gopls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

EOF

set updatetime=300
autocmd CursorHold * lua if vim.diagnostic then vim.diagnostic.open_float(nil, { focusable = false }) end

set signcolumn=yes

set number

nnoremap <silent> <c-W>s <cmd>vsplit<CR>

