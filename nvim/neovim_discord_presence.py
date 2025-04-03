# discord_rpc.py
from pypresence import Presence
import time

# DiscordアプリケーションIDをここに貼り付け
CLIENT_ID = "1357310917334798499"


def update_presence():
    rpc = Presence(CLIENT_ID)
    rpc.connect()
    rpc.update(
        state="Codierung in Neovim.", large_image="neovim", large_text="Neovim"
    )  # "Playing Neovim" を表示
    print("Discord Presence updated!")

    # 接続を維持
    while True:
        time.sleep(15)  # Discordの制限で15秒ごとに更新


if __name__ == "__main__":
    update_presence()
