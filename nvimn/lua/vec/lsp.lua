local vimlsp = require 'vim.lsp'
local log = require 'vim.lsp.log'
local util = require 'vim.lsp.util'
local vim = vim
local validate = vim.validate
local tbl_isempty = vim.tbl_isempty

local lsp = {}

--@private
--- Returns the buffer number for the given {bufnr}.
---
--@param bufnr (number) Buffer number to resolve. Defaults to the current
---buffer if not given.
--@returns bufnr (number) Number of requested buffer
local function resolve_bufnr(bufnr)
  validate { bufnr = { bufnr, 'n', true } }
  if bufnr == nil or bufnr == 0 then
    return vim.api.nvim_get_current_buf()
  end
  return bufnr
end

local function remove_unmatch_snippets(items, prefix)
  return vim.tbl_filter(function(item)
    return vim.startswith(item.word, prefix)
  end, items)
end

function lsp.omnifunc(findstart, base)

  local _ = log.debug() and log.debug("omnifunc.findstart", { findstart = findstart, base = base })
  if findstart == 1 then
    -- locate the start of the word
    local pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local line_to_cursor = line:sub(1, pos[2])
    local start = vim.fn.match(line_to_cursor, '\\k*$')
    return start
  else
    local bufnr = resolve_bufnr()
    local has_buffer_clients = not tbl_isempty(vimlsp.buf_get_clients(bufnr) or {})
    if not has_buffer_clients then
      return {}
    end

    -- Then, perform standard completion request
    local _ = log.info() and log.info("base ", base)

    local pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local line_to_cursor = line:sub(1, pos[2])

    local _ = log.trace() and log.trace("omnifunc.line", pos, line)

    local start = vim.fn.match(line_to_cursor, '\\k*$')

    local items = {}

    -- I preffer get snippets in separate action (see vsnip custom after vimscript)
    -- -- first we add vsnip items
    -- local vsnip_candidates = vim.call('vsnip#get_complete_items', bufnr)
    -- vim.list_extend(items, remove_unmatch_snippets(vsnip_candidates, base))

    -- now we request to lsp server
    local params = util.make_position_params()
    vimlsp.buf_request(bufnr, 'textDocument/completion', params, function(err, _, result)
    local _ = log.info() and log.info("result: ", result)
      if err or not result then return end
      local matches = util.text_document_completion_list_to_complete_items(result, base)
      -- TODO(ashkan): is this the best way to do this?
      vim.list_extend(items, matches)
      vim.fn.complete(start+1, items)
    end)
    -- Return -2 to signal that we should continue completion so that we can
    -- async complete.
    return -2
  end
end


return lsp
