{lib, ...}: {
    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.nvf = {
        enable = true;

        settings.vim = {
            theme = {
                enable = true;
                name = "catppuccin";
                style = "mocha";
            };

            globals.snacks_animate = false;

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
                    key = "\\";
                    action = "<Cmd>bd<CR>";
                    desc = "Delete current buffer";
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

                rust = {
                    enable = true;
                    lsp.enable = true;

                    crates = {
                        enable = true;
                        codeActions = true;
                    };

                    dap.enable = true;
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

            debugger.nvim-dap = {
                enable = true;

                ui = {
                    enable = true;
                    autoStart = true;
                };
            };

            autocomplete.blink-cmp = {
                enable = true;
                friendly-snippets.enable = true;

                mappings = {
                    close = null;
                    complete = null;
                    confirm = null;
                    next = null;
                    previous = null;
                    scrollDocsDown = null;
                    scrollDocsUp = null;
                };
                setupOpts.keymap.preset = "default";
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

            utility.snacks-nvim = {
                enable = true;
                setupOpts = {
                    bigfile.enabled = true;
                    dashboard = {
                        enabled = true;
                        preset = {
                            header = ''
                                ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
                                ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
                                ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
                                ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
                                ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
                                ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                            '';
                            keys = [
                                {
                                    icon = " ";
                                    key = "f";
                                    desc = "Find File";
                                    action = ":lua Snacks.dashboard.pick('files')";
                                }
                                {
                                    icon = " ";
                                    key = "n";
                                    desc = "New File";
                                    action = ":ene | startinsert";
                                }
                                {
                                    icon = " ";
                                    key = "g";
                                    desc = "Find Text";
                                    action = ":lua Snacks.dashboard.pick('live_grep')";
                                }
                                {
                                    icon = " ";
                                    key = "r";
                                    desc = "Recent Files";
                                    action = ":lua Snacks.dashboard.pick('oldfiles')";
                                }
                                {
                                    icon = " ";
                                    key = "c";
                                    desc = "Config";
                                    action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fs.normalize('~/nixos-config/')})";
                                }
                                {
                                    icon = " ";
                                    key = "q";
                                    desc = "Quit";
                                    action = ":qa";
                                }
                            ];
                        };
                        sections = [
                            {section = "header";}
                            {
                                section = "keys";
                                gap = 1;
                                padding = 1;
                            }
                        ];
                    };
                    explorer.enabled = true;
                    indent = {
                        enabled = true;
                        indent.char = "▏";
                        scope.char = "▏";
                    };
                    input.enabled = true;
                    notifier = {
                        enabled = true;
                        timeout = 3000;
                    };
                    picker.enabled = true;
                    quickfile.enabled = true;
                    scope.enabled = true;
                    statuscolumn.enabled = true;
                    words.enabled = true;
                    styles.notification.wo.wrap = true;
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
