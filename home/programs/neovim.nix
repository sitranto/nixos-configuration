{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      nvim-tree-lua
    ];

    extraPackages = with pkgs; [
      kotlin-language-server
      openjdk
      nil
      rust-analyzer
      haskell-language-server
      nodejs
      typescript
      typescript-language-server
      dotnet-sdk
      omnisharp-roslyn
      clang-tools
    ];

    extraConfig = ''
      lua << EOF

        -- === LSP: безопасная настройка ===
      local lspconfig = require('lspconfig')

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if status_ok then
      capabilities = cmp_nvim_lsp.default_capabilities()
      end

      local function setup_server(server_name, config)
      if config == nil then config = {} end
      config.capabilities = capabilities
      lspconfig[server_name].setup(config)
      end

      setup_server('tsserver', {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
      })
      setup_server('rust_analyzer')
      setup_server('clangd')
      setup_server('hls')
      setup_server('kotlin_language_server')
      setup_server('nil_ls')
      setup_server('omnisharp')

      -- === nvim-tree: настройка файлового проводника ===
      local tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
      if tree_status_ok then
      nvim_tree.setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = false, -- не закрывать дерево при открытии файла
        },
      },
      filters = {
        dotfiles = false, -- показывать .git, .env и т.д.
      },
      git = {
        ignore = false, -- отображать git-статус даже для ignored файлов
      },
     })

    -- Горячая клавиша для переключения дерева
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end

  EOF
'';
  };
}
