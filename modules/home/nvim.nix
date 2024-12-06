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
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>e";
          action = "<Cmd>e .<CR>";
          desc = "Open file explorer";
        }
        {
          mode = "n";
          key = "<leader>w";
          action = "<Cmd>wa<CR>";
          desc = "Write all buffers";
        }
      ];

      languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix = {
          enable = true;
          extraDiagnostics.enable = true;
          format.enable = true;
        };

        lua = {
          enable = true;
          extraDiagnostics.enable = true;
          format.enable = true;
        };
      };

      lsp = {
        inlayHints.enable = true;
        otter-nvim = {
          enable = true;
          setupOpts.handle_leading_whitespace = true;
        };
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
              function()
                local message = require("noice").api.statusline.mode.get()
                if message == nil or message:find("^recording") == nil then
                  return ""
                end
                return message
              end
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

        telescope-file-browser = {
          package = pkgs.vimPlugins.telescope-file-browser-nvim;
          setup = ''
            require("telescope").setup({
              extensions = {
                ["file_browser"] = {
                  hijack_netrw = true
                }
              }
            })
            require("telescope").load_extension("file_browser")
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
        setupOpts.spec = lib.generators.mkLuaInline ''
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
