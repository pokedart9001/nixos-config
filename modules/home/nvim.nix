{
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };

      options = {
        mouse = "r";

        cursorline = true;
        cursorlineopt = "both";

        hlsearch = false;
        incsearch = true;

        shiftwidth = 2;
        tabstop = 2;

        showmode = false;
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>w";
          action = "<Cmd>wa<CR>";
          desc = "Write all buffers";
        }
      ];

      autocmds = [
        {
          enable = true;
          event = ["VimEnter"];
          callback = lib.mkLuaInline ''
            function()
              if vim.fn.argc() == 0 then
                vim.cmd("Telescope find_files")
              end
            end
          '';
        }
      ];

      languages = {
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        enableFormat = true;

        nix = {
          enable = true;
          lsp.enable = true;
        };

        lua = {
          enable = true;
          lsp.lazydev.enable = true;
        };

        bash = {
          enable = true;
          lsp.enable = true;
        };

        ts = {
          enable = true;
          lsp.enable = true;

          extensions.ts-error-translator.enable = true;
        };
      };

      lsp = {
        enable = true;
        inlayHints.enable = true;
      };

      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };

      git.gitsigns = {
        enable = true;
        codeActions.enable = true;
      };

      statusline.lualine = {
        enable = true;

        refresh = let
          rate = 100;
        in {
          statusline = rate;
          tabline = rate;
          winbar = rate;
        };

        activeSection.x = [
          ''
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has
            }
          ''
        ];
      };

      telescope.enable = true;
      extraPlugins = {
        telescope-ui-select = {
          package = pkgs.vimPlugins.telescope-ui-select-nvim;
          setup = ''
            require("telescope").setup({
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown({})
                }
              }
            })
            require("telescope").load_extension("ui-select")
          '';
          after = ["telescope"];
        };
      };

      terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };

      ui.borders.enable = true;

      ui.noice = {
        enable = true;
        setupOpts.presets = {
          bottom_search = false;
          lsp_doc_border = true;
        };
      };

      binds.whichKey = {
        enable = true;
        setupOpts.preset = "modern";
        setupOpts.spec = lib.mkLuaInline ''
          {
            { "<Tab>", proxy = "<C-w>", group = "windows" },
            { "gr", group = "lsp", icon = { icon = "", color = "orange" } },
            { "grf", vim.lsp.buf.format, desc = "vim.lsp.buf.format()" },
            { "grd", vim.lsp.buf.definition, desc = "vim.lsp.buf.definition()" }
          }
        '';
      };

      tabline.nvimBufferline.enable = true;
    };
  };
}
