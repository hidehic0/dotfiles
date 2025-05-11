import {
  BaseConfig,
  type ConfigArguments,
} from "jsr:@shougo/ddc-vim@~9.4.0/config";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    const default_sources = [
      // "copilot",
      "lsp",
      "vsnip",
      "file",
      "rg",
      // "mocword",
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
        "CmdlineEnter",
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
          minAutoCompleteLength: 1,
          maxItems: 15,
        },
        cmdline_history: {
          mark: "[Hist]",
          maxItems: 2,
          minAutoCompleteLength: 5,
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
          minAutoCompleteLength: 1,
          maxItems: 5,
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
        shell_native: { shell: "zsh" },
      },
      filterParams: {
        converter_fuzzy: {
          hlGroup: "Title",
        },
        converter_kind_labels: {
          // referenced: https://github.com/Shougo/ddc-source-lsp/blob/main/doc/ddc-filter-converter_kind_labels.txt
          kindLabels: {
            Text: " Text",
            Method: " Method",
            Function: " Function",
            Constructor: " Constructor",
            Field: " Field",
            Variable: " Variable",
            Class: " Class",
            Interface: " Interface",
            Module: " Module",
            Property: " Property",
            Unit: " Unit",
            Value: " Value",
            Enum: " Enum",
            Keyword: " Keyword",
            Snippet: " Snippet",
            Color: " Color",
            File: " File",
            Reference: " Reference",
            Folder: " Folder",
            EnumMember: " EnumMember",
            Constant: " Constant",
            Struct: " Struct",
            Event: " Event",
            Operator: " Operator",
            TypeParameter: " TypeParameter",
          },
          kindHlGroups: {
            Method: "Function",
            Function: "Function",
            Constructor: "Function",
            Field: "Identifier",
            Variable: "Identifier",
            Keyword: "Conditional",
            Class: "Structure",
            Interface: "Structure",
          },
        },
      },
    });
  }
}
