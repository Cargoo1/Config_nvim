require("nvim-treesitter").setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "html",
          "javascript",
          "json",
          "latex",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "php",
          "proto",
          "python",
          "query",
          "regex",
          "rust",
          "scss",
          "svelte",
          "swift",
          "terraform",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "vue",
          "yaml",
          "zig",
        },
        auto_install = true,
      })
      -- Enable treesitter-based highlighting and indentation
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
      vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
