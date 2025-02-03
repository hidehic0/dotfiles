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
          winCol: 20,
          winWidth: 70,
          winHeight: 35,
          winRow: 6,
          // preview configs
          floatingBorder: "rounded",
          previewFloating: true,
          previewFloatingBorder: "rounded",
          previewFloatingTitle: "Preview",
          previewSplit: "vertical",
          previewWidth: 70,
          previewCol: 93,
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
          smartCase: true,
        },
      },
      sourceParams: {
        rg: {
          args: [
            "--vimgrep",
            "--json",
            "--column",
            "--no-heading",
            "--color",
            "never",
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
          quit: true,
        },
      },

      filterParams: {
        matcher_fzf: {
          highlightMatched: "Search",
        },
      },
    });
    return Promise.resolve();
  }
}
