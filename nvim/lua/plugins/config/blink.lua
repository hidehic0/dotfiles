local ripgrep_config = {
  module = "blink-ripgrep",
  name = "Ripgrep",
  -- the options below are optional, some default values are shown
  ---@module "blink-ripgrep"
  ---@type blink-ripgrep.Options
  opts = {
    prefix_min_len = 3,
    project_root_marker = { ".git", "package.json" },
    fallback_to_regex_highlighting = true,
    toggles = {
      -- The keymap to toggle the plugin on and off from blink
      -- completion results. Example: "<leader>tg" ("toggle grep")
      on_off = nil,
      -- The keymap to toggle debug mode on/off. Example: "<leader>td" ("toggle debug")
      debug = nil,
    },

    backend = {
      use = "ripgrep",

      customize_icon_highlight = true,

      ripgrep = {
        context_size = 5,
        max_filesize = "1M",
        project_root_fallback = true,
        search_casing = "--ignore-case",
        additional_rg_options = {},
        ignore_paths = {},
        additional_paths = {},
      },
    },
    debug = false,
  },
  transform_items = function(_, items)
    for _, item in ipairs(items) do
      item.labelDetails = {
        description = "(rg)",
      }
    end
    return items
  end,
  min_keyword_length = 3,
  max_items = 3,
  score_offset = -1,
  enabled = function()
    return not vim.fn["skkeleton#is_enabled"]()
  end,
}

require("blink.cmp").setup(
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  {
    signature = { enabled = true },
    keymap = {
      preset = "none",
      ["<C-e>"] = { "hide" },
      ["<C-y>"] = { "accept" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true },
      list = { selection = { preselect = false } },
      accept = { auto_brackets = { enabled = false } },
    },
    sources = {
      default = { "lsp", "ripgrep", "path", "snippets", "buffer" },
      providers = {
        ripgrep = ripgrep_config,
        cmdline = {
          min_keyword_length = 1,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = {
        "score", -- Primary sort: by fuzzy matching score
        "sort_text", -- Secondary sort: by sortText field if scores are equal
        "label", -- Tertiary sort: by label if still tied
      },
    },
    cmdline = {
      enabled = true,
      keymap = {
        preset = "none",
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "accept" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
      completion = { menu = { auto_show = true } },
      sources = { "cmdline", "path", "buffer" },
    },
  }
)
