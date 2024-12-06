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
                mouse = "chr";

                cursorline = true;
                cursorlineopt = "both";

                wrap = false;

                hlsearch = false;
                incsearch = true;

                tabstop = 4;
                softtabstop = 4;
                shiftwidth = 4;

                showmode = false;
            };

            keymaps = [
                {
                    mode = "n";
                    key = "<leader>w";
                    action = "<Cmd>wa<CR>";
                    desc = "Write all buffers";
                }
                {
                    mode = "n";
                    key = "<C-d>";
                    action = "<C-d>zz";
                }
                {
                    mode = "n";
                    key = "<C-u>";
                    action = "<C-u>zz";
                }
                {
                    mode = "n";
                    key = "<leader>p";
                    action = "<Cmd>TypstPreview<CR>";
                    desc = "Open Typst Preview";
                }
                {
                    mode = "t";
                    key = "<Esc>";
                    action = "<C-\\><C-n>";
                    desc = "Terminal: Enter normal mode";
                }
                {
                    mode = "n";
                    key = "<leader>q";
                    action = ''
                        function()
                          if vim.fn.getqflist({winid = 0}).winid == 0 then
                            vim.cmd.copen()
                          else
                            vim.cmd.cclose()
                          end
                        end
                    '';
                    desc = "Toggle quickfix window";
                    lua = true;
                }
            ];

            autocmds = [
                {
                    enable = true;
                    event = ["UIEnter"];
                    callback = lib.mkLuaInline ''
                        function()
                          if vim.fn.argc() == 0 then
                            vim.cmd("Telescope find_files")
                          end
                        end
                    '';
                }
                {
                    enable = true;
                    event = ["TextYankPost"];
                    callback = lib.mkLuaInline ''
                        function()
                          vim.hl.on_yank({ timeout = 100 })
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
                    extraDiagnostics.enable = false;
                };

                lua = {
                    enable = true;
                    lsp.lazydev.enable = true;
                };

                bash = {
                    enable = true;
                    lsp.enable = true;
                };

                python = {
                    enable = true;
                    lsp.enable = true;
                };

                ts = {
                    enable = true;
                    lsp.enable = true;

                    extensions.ts-error-translator.enable = true;
                };

                typst = {
                    enable = true;
                    lsp.enable = true;

                    format.type = "typstyle";
                };
            };

            lsp = {
                enable = true;
                inlayHints.enable = true;
                lspconfig.enable = true;
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
                mappings.open = "<leader>tt";

                setupOpts = {
                    direction = "float";
                    winbar.enabled = false;
                };

                lazygit.enable = true;
            };

            ui = {
                borders.enable = true;

                noice = {
                    enable = true;
                    setupOpts.presets = {
                        bottom_search = false;
                        lsp_doc_border = true;
                    };
                };
            };

            visuals.indent-blankline = {
                enable = true;
                setupOpts = {
                    indent.char = "▏";
                    scope.enabled = false;
                };
            };

            binds.whichKey = {
                enable = true;

                setupOpts = {
                    preset = "modern";
                    spec = lib.mkLuaInline ''
                        {
                          { "<Tab>", proxy = "<C-w>", group = "windows" },
                          { "gr", group = "lsp", icon = { icon = "", color = "orange" } },
                          { "grf", vim.lsp.buf.format, desc = "vim.lsp.buf.format()" },
                          { "grd", vim.lsp.buf.definition, desc = "vim.lsp.buf.definition()" },
                          { "grn", vim.lsp.buf.rename, desc = "vim.lsp.buf.rename()" }
                        }
                    '';
                };
            };

            tabline.nvimBufferline = {
                enable = true;

                mappings = {
                    cycleNext = "]b";
                    cyclePrevious = "[b";
                };

                setupOpts.options.custom_filter = lib.mkLuaInline ''
                    function(buf, _)
                      local hidden_filetypes = { "qf" }
                      return not vim.tbl_contains(hidden_filetypes, vim.bo[buf].filetype)
                    end
                '';
            };
        };
    };
}
