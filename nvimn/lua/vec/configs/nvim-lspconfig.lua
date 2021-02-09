-- vim: set sw=2 ts=2 sts=2 foldmethod=marker:

-- global vec_lsp_omnifunc
vec_lsp_omnifunc = require'vec.lsp'.omnifunc

-- custom on_attach function {{{
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>cgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>cD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>cgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>ce', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>csl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  if client.resolved_capabilities.document_highlight then
    if vim.g.lsp_auto_document_highlight ~= nil then
      vim.api.nvim_exec(string.format([[
      augroup lsp_document_highlight_%s
      autocmd!
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
        ]], vim.fn.bufnr()),
        false)
    else
      buf_set_keymap("n", "<leader>cv", "<cmd>lua vim.lsp.buf.document_highlight()<CR>", opts)
      buf_set_keymap("n", "<leader>c<leader>/", "<cmd>lua vim.lsp.buf.clear_references()<CR>", opts)
    end
  end
  -- Use LSP as the handler for omnifunc.
  buf_set_option("omnifunc", "v:lua.vec_lsp_omnifunc")
  buf_set_keymap('i', '<c-space>', '<c-x><c-o>', opts)
  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach(client)
end
-- }}}

local nvim_lsp = require('lspconfig')

-- vimls {{{
if vim.g.lsp_vimls ~= nil then
  nvim_lsp.vimls.setup{
    init_options = {
      diagnostic = {
        enable = true
      },
      indexes = {
        count = 3,
        gap = 100,
        projectRootPatterns = { ".git", "autoload", "plugin" },
        runtimepath = false
      },
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
        fromRuntimepath = false,
        fromVimruntime = false
      },
      vimruntime = ""
    },
    on_attach = on_attach
  }
end

-- }}}

-- tsserver {{{
if vim.g.lsp_tsserver ~= nil then
  nvim_lsp.tsserver.setup{ 
    on_attach = on_attach
  }
end
-- }}}
