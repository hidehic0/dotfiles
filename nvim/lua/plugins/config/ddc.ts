import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddc-vim@~9.1.0/config";

import { type DdcItem } from "jsr:@shougo/ddc-vim@~9.1.0/types";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    const default_sources = ["lsp", "skkeleton"];
    const default_converters = [
      "converter_fuzzy",
      "converter_truncate_abbr",
      "converter_remove_overlap",
    ];
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
          converters: default_converters,
          enabledIf: "!skkeleton#is_enabled()",
        },
        lsp: {
          mark: "[LSP]",
          matchers: ["matcher_fuzzy", "matcher_prefix"],
          converters: ["converter_kind_labels"].concat(default_converters),
          forceCompletionPattern: "\\.\\w*|::\\w*|->\\w*",
          dup: "force",
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
          enabledIf: "skkeleton#is_enabled()",
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
        converter_kind_labels: {
          kindLabels: {
            Text: "󰉿 text",
            Method: "󰆧 method",
            Function: "󰊕 function",
            Constructor: " constructor",
            Field: "󰜢 field",
            Variable: "󰀫 variable",
            Class: "󰠱 class",
            Interface: " interface",
            Module: " module",
            Property: "󰜢 property",
            Unit: "󰑭 unit",
            Value: "󰎠 value",
            Enum: " enum",
            Keyword: "󰌋 keyword",
            Snippet: " snippet",
            Color: "󰏘 color",
            File: "󰈙 file",
            Reference: "󰈇 reference",
            Folder: "󰉋 folder",
            EnumMember: " enum member",
            Constant: "󰏿 constant",
            Struct: "󰙅 struct",
            Event: " event",
            Operator: "󰆕 operator",
            TypeParameter: " type parameter",
          },
        },
      },
    });
  }
}
