import { BaseConfig, ConfigArguments } from "@shougo/ddt-vim/config";

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      nvimServer: "~/.cache/nvim/server.pipe",
      uiParams: {
        terminal: {
          command: ["zsh"],
          promptPattern: "\\w*% \\?",
          split: "farleft",
          startInsert: true,
          winWidth: 75,
        },
      },
    });
  }
}
