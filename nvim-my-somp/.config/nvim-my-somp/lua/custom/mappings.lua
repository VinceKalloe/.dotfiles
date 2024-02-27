---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- Don't like to semicolon
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- ["<leader>fr"] = {
    --   function()
    --     require("telescope.builtin").oldfiles {
    --       prompt_title = "Config Files",
    --       search_dirs = config_dir,
    --       cwd = cwd,
    --     }
    --   end,
    --   "Find Recent Files",
    --   opts = { silent = true },
    -- },

    -- Redefining new terminal windows creation ('h' is for Harpoon)
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },

  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!
M.harpoon = {
  plugin = true,
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon"):list():append()
        vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
      end,
      "Add Mark",
      opts = { silent = true },
    },
    ["<leader>hh"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      "Harpoon Menu",
      opts = { silent = true },
    },
    ["<leader>hn"] = {
      function()
        require("harpoon"):list():next()
      end,
      "Next",
      opts = { silent = true },
    },
    ["<leader>hp"] = {
      function()
        require("harpoon"):list():prev()
      end,
      "Previous",
      opts = { silent = true },
    },
  },
}

M.telescope = {
  plugin = true,
  n = {
    --
    -- Redefine some Telescope keys
    --
    -- find
    -- These havn't been changed
    -- ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    -- ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    -- ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    -- ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    -- ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    -- ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    -- ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    -- OLD default -- ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    -- OLD default -- ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    -- OLD default -- ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    -- OLD default -- ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
    ["<leader>fs"] = { "<cmd> Telescope themes <CR>", "List Nvchad skins(themes)" },

    -- telescope bookmarks
    -- OLD default -- ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "List bookmarks" },

    --
    -- Add some Telescope keys
    --
    ["<leader>fc"] = {
      function()
        local cwd = vim.fn.stdpath "config" .. "/"
        local config_dir = { cwd }
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = config_dir,
          cwd = cwd,
        }
      end,
      "Find Config Files",
      opts = { silent = true },
    },
  },
}

return M
