import type { ContextBuilder, Plugin } from "jsr:@shougo/dpp-vim@~5.0.0/types";
import type { Dpp } from "jsr:@shougo/dpp-vim@~5.0.0/dpp";
import {
  BaseConfig,
  type ConfigReturn,
} from "jsr:@shougo/dpp-vim@~5.0.0/config";

import type { Denops } from "jsr:@denops/core@8.0.0";

type Toml = {
  hooks_file?: string;
  ftplugins?: Record<string, string>;
  plugins?: Plugin[];
};

type LazyMakeStateResult = {
  plugins: Plugin[];
  stateLines: string[];
};

type CheckFile = {
  path: string;
  lazy: boolean;
};

export class Config extends BaseConfig {
  override async config(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
    basePath: string;
    dpp: Dpp;
  }): Promise<ConfigReturn> {
    args.contextBuilder.setGlobal({
      extParams: {
        installer: {
          checkDiff: true,
        },
      },
      protocols: ["git"],
    });

    const checkFiles: CheckFile[] = [{path: "~/.config/nvim/dpp.toml",lazy:false}];

    for (const file of Deno.readDirSync(`${Deno.env.get("HOME")}/.config/nvim/plugins`)) {
      checkFiles.push({path:`~/.config/nvim/plugins/${file.name}`,lazy:true})
    }

    const [context, options] = await args.contextBuilder.get(args.denops);

    const tomls: Toml[] = [];

    for (const file of checkFiles) {
      tomls.push(
        await args.dpp.extAction(
          args.denops,
          context,
          options,
          "toml",
          "load",
          {
            path: file.path,
            options: {
              lazy: file.lazy,
            },
          },
        ) as Toml,
      );
    }

    const recordPlugins: Record<string, Plugin> = {};
    const hooksFiles: string[] = [];

    for (const toml of tomls) {
      if (toml.plugins) {
        for (const plugin of toml.plugins) {
          recordPlugins[plugin.name] = plugin;
        }
      }

      if (toml.hooks_file) {
        hooksFiles.push(toml.hooks_file);
      }
    }

    const lazyResult = await args.dpp.extAction(
      args.denops,
      context,
      options,
      "lazy",
      "makeState",
      {
        plugins: Object.values(recordPlugins),
      },
    ) as LazyMakeStateResult | undefined;

    return {
      checkFiles,
      hooksFiles,
      plugins: lazyResult?.plugins ?? [],
      stateLines: lazyResult?.stateLines ?? [],
    };
  }
}
