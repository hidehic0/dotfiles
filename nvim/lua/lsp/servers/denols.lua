return {
  cmd = { "deno", "lsp" },
  cmd_env = { NO_COLOR = true },
  filetypes = { "typescript" },
  root_markers = { "deno.json", "deno.jsonc", ".git" },
  settings = {
    deno = {
      enable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://deno.land"] = true,
          },
        },
      },
    },
  },
}
