-- Load plugins
require('plugins')

-- LSPs
local servers = {'tsserver', 'html', 'cssls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup()
end

lpsconfig.jsonls.setup {
  settings = {
    json = {
      schemas = {
        {
          fileMatch = {"package.json"}
          url = "https://json.schemastore.org/package.json"
        }
      }
    }	
  }
}

-- Treesitter 
require 'nvim-treesitter.configs'.setup {
  context_commentstring = {enable = true},
  highlight = {
    enable = true,
    additional_vim_regex_highlightning = false
  },
  indent = {enable = false}
}

local ft_str =
  table.concat(
  vim.tbl_map(
    function(ft)
      return configs[ft].filetype or ft
    end,
    parsers.available_parsers()
  ),
  ','
)
vim.cmd('autocmd Filetype ' .. ft_str .. ' setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()')
