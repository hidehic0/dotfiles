import type {
  ContextBuilder,
  ExtOptions,
  Plugin,
  ProtocolName,
} from "@shougo/dpp-vim/types";
import { Protocol } from "@shougo/dpp-vim/protocol";
import type { Dpp } from "@shougo/dpp-vim/dpp";
import { BaseConfig, type ConfigReturn } from "@shougo/dpp-vim/config";

import type { Denops } from "@denops/core";

import type {
  Ext as TomlExt,
  Params as TomlParams,
} from "@shougo/dpp-ext-toml";
import type {
  Ext as LazyExt,
  LazyMakeStateResult,
  Params as LazyParams,
} from "@shougo/dpp-ext-lazy";

type Toml = {
  hooks_file?: string;
  ftplugins?: Record<string, string>;
  plugins?: Plugin[];
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
          githubAPIToken: Deno.env.has("GITHUB_TOKEN_READONLY")
            ? Deno.env.get("GITHUB_TOKEN_READONLY")
            : "",
        },
      },
      protocols: ["git"],
    });

    const [context, options] = await args.contextBuilder.get(args.denops);
    const protocols = (await args.denops.dispatcher.getProtocols()) as Record<
      ProtocolName,
      Protocol
    >;
    const recordPlugins: Record<string, Plugin> = {};
    const hooksFiles: string[] = [];

    const checkFiles: CheckFile[] = [
      {
        path: "~/.config/nvim/plugins/dpp.toml",
        lazy: false,
      },
    ];

    for (
      const file of Deno.readDirSync(
        `${Deno.env.get("HOME")}/.config/nvim/plugins`,
      )
    ) {
      if ("dpp.toml" != file.name) {
        checkFiles.push({
          path: `~/.config/nvim/plugins/${file.name}`,
          lazy: true,
        });
      }
    }

    const [tomlExt, tomlOptions, tomlParams]: [
      TomlExt | undefined,
      ExtOptions,
      TomlParams,
    ] = (await args.denops.dispatcher.getExt("toml")) as [
      TomlExt | undefined,
      ExtOptions,
      TomlParams,
    ];

    if (tomlExt) {
      const action = tomlExt.actions.load;

      const tomlPromises = checkFiles.map((file) =>
        action.callback({
          denops: args.denops,
          context,
          options,
          protocols,
          extOptions: tomlOptions,
          extParams: tomlParams,
          actionParams: {
            path: file.path,
            options: {
              lazy: file.lazy,
            },
          },
        })
      );
      const tomls: Toml[] = await Promise.all(tomlPromises);

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
    }

    const [lazyExt, lazyOptions, lazyParams]: [
      LazyExt | undefined,
      ExtOptions,
      LazyParams,
    ] = (await args.denops.dispatcher.getExt("lazy")) as [
      LazyExt | undefined,
      ExtOptions,
      LazyParams,
    ];

    let lazyResult: LazyMakeStateResult | undefined = undefined;
    if (lazyExt) {
      lazyResult = await lazyExt.actions.makeState.callback({
        denops: args.denops,
        context,
        options,
        protocols,
        extOptions: lazyOptions,
        extParams: lazyParams,
        actionParams: {
          plugins: Object.values(recordPlugins),
        },
      });
    }

    return {
      hooksFiles,
      plugins: lazyResult?.plugins ?? [],
      stateLines: lazyResult?.stateLines ?? [],
    };
  }
}
