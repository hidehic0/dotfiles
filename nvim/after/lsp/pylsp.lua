return {
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = false }, -- pylintを無効化
        pyflakes = { enabled = false }, -- pyflakesを無効化
        pycodestyle = { enabled = false }, -- pycodestyleを無効化
        mccabe = { enabled = false }, -- mccabeを無効化（必要に応じて）
        flake8 = { enabled = false }, -- flake8を無効化（必要に応じて）
        pydocstyle = { enabled = false }, -- pydocstyleを無効化
      },
    },
  },
}
