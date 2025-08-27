import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddu-vim@~10.4.0/config";
import { type Params as FfParams } from "jsr:@shougo/ddu-ui-ff@~3.0.0";
import { type Params as FilerParams } from "jsr:@shougo/ddu-ui-filer@~3.0.0";

export class Config extends BaseConfig {
  override config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "ff",
      uiOptions: {
        _: {
          filterPrompt: "Search: ",
        },
      },
      uiParams: {
        ff: {
          // auto action
          startAutoAction: true,
          autoAction: { name: "preview", delay: 0 },
          // floating configs
          split: "floating",
          winCol: 2,
          winWidth: "&columns / 2 - 3",
          winHeight: 35,
          winRow: 6,
          // preview configs
          floatingBorder: "rounded",
          previewFloating: true,
          previewFloatingBorder: "rounded",
          previewFloatingTitle: "Preview",
          previewSplit: "vertical",
          previewWidth: "&columns / 2 - 3",
          previewCol: "&columns / 2",
          previewRow: 6,
          previewHeight: 35,
          previewFocusable: false,
          // prompt: "ddu.vim",
        } satisfies Partial<FfParams>,
      },

      sourceOptions: {
        _: {
          matchers: ["matcher_fzf"],
          sorters: ["sorter_fzf"],
          converters: ["converter_devicon"],
          ignoreCase: true,
          // columns: ["devicon_filename"],
          // smartCase: true,
        },
        git_branch: {
          columns: [
            "git_branch_head",
            "git_branch_name",
            "git_branch_author",
          ],
        },
        git_status: {
          converters: [
            // "converter_devicon",
            "converter_hl_dir",
          ],

          columns: ["devicon_filename"],
        },
      },
      sourceParams: {
        rg: {
          args: ["--column", "--no-heading", "--color", "never"],
        },
        help: {
          helplang: "ja",
        },
        file_rec: {
          ignoredDirectories: [
            ".git",
            "node_modules",
            ".venv",
            "__pycache__",
            ".ruff_cache",
          ],
        },
      },

      kindOptions: {
        _: {
          defaultAction: "open",
        },
        lsp_codeAction: {
          defaultAction: "apply",
        },
        action: {
          defaultAction: "do",
        },
        register: {
          defaultAction: "yank",
        },
        emoji: {
          defaultAction: "yank",
        },
        git_branch: { "defaultAction": "switch" },
        git_status: {
          defaultAction: "open",
        },
        patch_local: {
          defaultAction: "start",
        },
        word: {
          defaultAction: "yank",
        },
      },

      filterParams: {
        matcher_fzf: {
          highlightMatched: "Title",
        },
        matcher_kensaku: {
          highlightMatched: "Title",
        },
      },
    });

    // ファイラ
    args.contextBuilder.patchLocal("filer", {
      ui: "filer",
      sources: ["file"],
      sourceOptions: {
        file: {
          sorters: ["sorter_alpha"],
          converters: [
            "converter_devicon",
            "converter_hl_dir",
          ],
          columns: ["filename"],
        },
      },
      uiParams: {
        filer: {
          split: "vertical",
          winWidth: "&columns / 5 * 2",
          sortTreesFirst: true,
        } satisfies Partial<FilerParams>,
      },
      actionParams: {},
    });

    // 通常のファイル検索
    args.contextBuilder.patchLocal("file_rec", {
      sources: [
        {
          name: "file_rec",
        },
      ],
      uiParams: {
        ff: {
          floatingTitle: "File Rec :)",
        },
      },
    });

    // ripgrepを使用した、live grep検索
    args.contextBuilder.patchLocal("rg", {
      sources: [
        {
          name: "rg",
          options: {
            volatile: true,
          },
        },
      ],
      uiParams: {
        ff: {
          floatingTitle: "LIVE GREP :)",
        },
      },
    });

    // 行の内容で検索します
    args.contextBuilder.patchLocal("lines", {
      sources: [
        {
          name: "line",
        },
      ],
      uiParams: {
        ff: {
          floatingTitle: "Line Search :)",
        },
      },
    });

    // ヘルプ検索
    args.contextBuilder.patchLocal("help", {
      sources: [
        {
          name: "help",
        },
      ],
      uiParams: {
        ff: {
          floatingTitle: "󰋗 Help Search",
        },
      },
    });

    // バッファー検索
    // args.contextBuilder.patchLocal("buffer", {
    //   sources: [
    //     {
    //       name: "buffer",
    //     },
    //   ],
    //   uiParams: {
    //     ff: {
    //       floatingTitle: "Buffer Search :)",
    //     },
    //   },
    // });

    // レジスタ検索
    // args.contextBuilder.patchLocal("register", {
    //   sources: [
    //     {
    //       name: "register",
    //     },
    //   ],
    //   uiParams: {
    //     ff: {
    //       floatingTitle: "Register Search :)",
    //     },
    //   },
    // });

    // lazy.nvim
    // args.contextBuilder.patchLocal("lazy_nvim", {
    //   sources: [
    //     {
    //       name: "lazy_nvim",
    //     },
    //   ],
    //   kindOptions: {
    //     file: {
    //       defaultAction: "cd",
    //     },
    //   },
    // });

    // ブランチ移動
    args.contextBuilder.patchLocal("git_branch", {
      sources: [
        {
          name: "git_branch",
        },
      ],

      uiParams: {
        ff: {
          floatingTitle: "Branch Search :)",
        },
      },
    });

    // gitで変更があった部分
    args.contextBuilder.patchLocal("git_status", {
      sources: [
        {
          name: "git_status",
        },
      ],

      uiParams: {
        ff: {
          floatingTitle: "Git Status Search :)",
        },
      },
    });

    // git log
    // args.contextBuilder.patchLocal("git_log", {
    //   sources: [
    //     {
    //       name: "git_log",
    //     },
    //   ],
    //
    //   uiParams: {
    //     ff: {
    //       floatingTitle: "Git Log Search :)",
    //     },
    //   },
    // });

    // 絵文字検索
    args.contextBuilder.patchLocal("emoji", {
      sources: [
        { name: "emoji" },
      ],
    });

    // LSP
    // lsp_definition
    args.contextBuilder.patchLocal("lsp_definition", {
      sources: [
        { name: "lsp_definition" },
      ],
    });

    // lsp_codeAction
    args.contextBuilder.patchLocal("lsp_codeAction", {
      sources: [
        { name: "lsp_codeAction" },
      ],
    });

    // lsp_callHierarchy
    args.contextBuilder.patchLocal("lsp_callHierarchy", {
      sources: [
        { name: "lsp_callHierarchy" },
      ],
    });

    // lsp_documentSymbol
    args.contextBuilder.patchLocal("lsp_documentSymbol", {
      sources: [
        { name: "lsp_documentSymbol" },
      ],
      sourceOptions: {
        _: {
          converters: ["converter_lsp_symbol"],
        },
      },
    });

    // patch_localを検索してスタート
    args.contextBuilder.patchLocal("patch_local", {
      sources: [
        { name: "patch_local" },
      ],
      uiParams: {
        ff: {
          floatingTitle: "PatchLocal Search :)",
          winCol: 5,
          winWidth: "&columns - 10",
        },
      },
    });

    return Promise.resolve();
  }
}
