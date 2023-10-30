return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    }

    config.handlers = {
      eslint_d = function ()
       require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
              condition = function(utils)
                return utils.root_has_file ".eslintrc.json"
                  or utils.root_has_file ".eslintrc.js"
              end, })
      end
    }
    
    return config -- return final config table
  end,
}
