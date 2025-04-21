import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddc-vim@~9.4.0/config";

import { type DdcItem } from "jsr:@shougo/ddc-vim@~9.4.0/types";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    const default_sources = [
      "copilot",
      "vsnip",
      "lsp",
      "file",
      "mocword",
      "rg",
      "skkeleton",
    ];
    const default_converters = [
      "converter_fuzzy",
      "converter_truncate_abbr",
      "converter_remove_overlap",
    ];
    const search_sources = ["rg", "mocword", "around"];

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
        ":": ["cmdline", "file", "cmdline_history", "skkeleton"].concat(
          search_sources,
        ),
        "/": search_sources,
        "?": search_sources,
      },
      sourceOptions: {
        _: {
          sorters: ["sorter_fuzzy"],
          matchers: ["matcher_fuzzy"],
          converters: default_converters,
          enabledIf: "!skkeleton#is_enabled()",
          ignoreCase: true,
        },
        lsp: {
          mark: "[LSP]",
          matchers: ["matcher_fuzzy", "matcher_prefix"],
          converters: ["converter_kind_labels"].concat(default_converters),
          forceCompletionPattern: "\\.\\w*|::\\w*|->\\w*",
          dup: "force",
          minAutoCompleteLength: 1,
        },
        cmdline: {
          mark: "[CMD]",
        },
        cmdline_history: {
          mark: "[Hist]",
          maxItems: 2,
        },
        around: {
          mark: "[A]",
        },
        file: {
          mark: "[F]",
          isVolatile: true,
          forceCompletionPattern: "\S/\S*",
        },
        mocword: {
          mark: "[MocWord]",
          minAutoCompleteLength: 3,
          maxItems: 5,
        },
        skkeleton: {
          mark: "あ",
          matchers: [],
          sorters: [],
          converters: [],
          isVolatile: true,
          minAutoCompleteLength: 1,
          enabledIf: "skkeleton#is_enabled()",
        },
        rg: {
          mark: "[rg]",
          minAutoCompleteLength: 4,
        },
        copilot: {
          mark: "",
        },
        vsnip: {
          mark: "[snip]",
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
      filterParams: {
        converter_fuzzy: {
          hlGroup: "Title",
        },
        converter_kind_labels: {
          kindLabels: {
            Text: "󰉿 Text",
            Method: "󰆧 Method",
            Function: "󰊕 Function",
            Constructor: " Constructor",
            Field: "󰜢 Field",
            Variable: "󰀫 Variable",
            Class: "󰠱 Class",
            Interface: " Interface",
            Module: " Module",
            Property: "󰜢 Property",
            Unit: "󰑭 Unit",
            Value: "󰎠 Value",
            Enum: " Enum",
            Keyword: "󰌋 Keyword",
            Snippet: " Snippet",
            Color: "󰏘 Color",
            File: "󰈙 File",
            Reference: " Reference",
            Folder: "󰉋 Folder",
            Constant: "󰏿 Constant",
            Struct: "󰙅 Struct",
            Event: " Event",
            Operator: "󰆕 Operator",
            TypeParameter: " Type parameter",
          },
          kindHlGroups: {
            Method: "Function",
            Function: "Function",
            Constructor: "Function",
            Field: "Identifier",
            Variable: "Identifier",
            Class: "Structure",
            Interface: "Structure",
            Keyword: "Statement",
            Text: "String",
          },
        },
      },
    });
  }
}
