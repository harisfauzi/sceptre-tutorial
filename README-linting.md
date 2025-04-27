# README

To have the automatic linting applied to your repo, you can do the following:

1. Install [shellcheck](https://github.com/koalaman/shellcheck)
2. Optionally install [nvm](https://github.com/nvm-sh/nvm) or you can install
nodejs of specific version globally on your system, e.g. version 20 or 22.
3. Install [pre-commit](https://pre-commit.com/)
4. Copy the following config files to your repo:
    - [.lintstagedrc](./.lintstagedrc)
    - [.pre-commit-config.yaml](.pre-commit-config.yaml)
    - [eslint.config.mjs](./eslint.config.mjs)
5. Run the initialisation script [init-repo.sh](./init-repo.sh). You can either
run that script or run the content manually in a shell. The file `.husky/pre-commit`
will be created by that script.
6. Be sure to update your `.gitignore` file to exclude files that will be
added by the installation of those tools, e.g. `node_modules/`.
