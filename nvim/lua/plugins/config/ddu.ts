import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddu-vim@~9.5.0/config";
import {
  type ActionArguments,
  ActionFlags,
  type DduOptions,
} from "jsr:@shougo/ddu-vim@~9.5.0/types";
import { type Params as FfParams } from "jsr:@shougo/ddu-ui-ff@~1.6.0";
import { type Params as FilerParams } from "jsr:@shougo/ddu-ui-filer@~1.5.0";

export class Config extends BaseConfig {
  override config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "ff",
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
          prompt: "ddu.vim",
        },
      },

      sourceOptions: {
        _: {
          matchers: ["matcher_fzf"],
          sorters: ["sorter_fzf"],
          converters: ["converter_devicon"],
          ignoreCase: true,
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
            "converter_devicon",
            "converter_hl_dir",
          ],
        },
      },
      sourceParams: {
        rg: {
          args: ["--column", "--no-heading", "--color", "never"],
        },
        help: {
          helplang: "ja",
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
          quit: true,
        },
        register: {
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
          highlightMatched: "Search",
        },
      },
    });

    // ファイラ
    args.contextBuilder.patchLocal("filer", {
      sources: [
        {
          name: "file",
        },
      ],
      sourceOptions: {
        file: {
          converters: [
            "converter_devicon",
            "converter_hl_dir",
          ],
        },
      },
      uiParams: {
        ff: {
          floatingTitle: "File Rec :)",
        },
      },
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
    args.contextBuilder.patchLocal("buffer", {
      sources: [
        {
          name: "buffer",
        },
      ],
      uiParams: {
        ff: {
          floatingTitle: "Buffer Search :)",
        },
      },
    });

    // レジスタ検索
    args.contextBuilder.patchLocal("register", {
      sources: [
        {
          name: "register",
        },
      ],
      uiParams: {
        ff: {
          floatingTitle: "Register Search :)",
        },
      },
    });

    // lazy.nvim
    args.contextBuilder.patchLocal("lazy_nvim", {
      sources: [
        {
          name: "lazy_nvim",
        },
      ],
      kindOptions: {
        file: {
          defaultAction: "cd",
        },
      },
    });

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
    args.contextBuilder.patchLocal("git_log", {
      sources: [
        {
          name: "git_log",
        },
      ],

      uiParams: {
        ff: {
          floatingTitle: "Git Log Search :)",
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
