import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddc-vim@~9.1.0/config";

import { type DdcItem } from "jsr:@shougo/ddc-vim@~9.1.0/types";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    const default_sources = ["lsp", "skkeleton"];
    const search_sources = ["around"];

    args.contextBuilder.patchGlobal({
      ui: "pum",
      autoCompleteEvents: [
        "InsertEnter",
        "TextChangedI",
        "TextChangedP",
        "CmdlineChanged",
      ],

      sources: default_sources,
      cmdlineSources: {
        ":": ["cmdline"].concat(search_sources),
        "/": search_sources,
        "?": search_sources,
      },
      sourceOptions: {
        _: {
          sorters: ["sorter_fuzzy"],
          matchers: ["matcher_fuzzy"],
          converters: ["converter_fuzzy"],
        },
        lsp: {
          mark: "[LSP]",
          forceCompletionPattern: "\.\w*|:\w*|->\w*",
        },
        cmdline: {
          mark: "[CMD]",
        },
        around: {
          mark: "[A]",
        },
        skkeleton: {
          mark: "あ",
          matchers: [],
          sorters: [],
          converters: [],
          isVolatile: true,
          minAutoCompleteLength: 1,
        },
      },
      sourceParams: {
        lsp: {
          snippetEngine: async (body: string) => {
            await args.denops.call("vsnip#anonymous", body);
          },
          enableResolveItem: true,
          enableAdditionalTextEdit: true,
        },
      },
    });
  }
}
