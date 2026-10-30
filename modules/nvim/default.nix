{ pkgs, ... }:

{
  xdg.configFile."nvim/lua".source = ./lua;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    initLua = builtins.readFile ./init.lua;

    extraPackages = with pkgs; [
      ripgrep
      fd
      nil
      nixfmt
      pyright
      ruff
      typescript-language-server
      vscode-langservers-extracted
      lua-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      gitsigns-nvim
      telescope-fzf-native-nvim
      {
        plugin = kanagawa-nvim;
        config = "vim.cmd.colorscheme('kanagawa')";
      }
      {
        plugin = lualine-nvim;
        config = "require('lualine').setup()";
      }
      {
        plugin = telescope-nvim;
        config = ''
          local telescope = require("telescope")
          local builtin = require("telescope.builtin")

          telescope.load_extension('fzf')

          local map = vim.keymap.set
          map("n", "<leader>ff", builtin.find_files,  { desc = "Find files" })
          map("n", "<leader>fg", builtin.live_grep,   { desc = "Live grep" })
          map("n", "<leader>fb", builtin.buffers,     { desc = "Buffers" })
          map("n", "<leader>fh", builtin.help_tags,   { desc = "Help tags" })
          map("n", "<leader>fr", builtin.oldfiles,    { desc = "Recent files" })
          map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
        '';
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = ''
          vim.api.nvim_create_autocmd('FileType', {
            callback = function()
              ok = pcall(vim.treesitter.start)
              if not ok then
                return
              end

              vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
              vim.wo[0][0].foldmethod = 'expr'
              vim.wo[0][0].foldlevel = 99
              vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
          })
        '';
      }
      {
        plugin = nvim-autopairs;
        config = ''
          require("nvim-autopairs").setup {
            check_ts = true,
          }
        '';
      }
    ];
  };
}
