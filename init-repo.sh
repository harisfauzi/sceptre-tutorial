#!/bin/bash

# nvm use
npm -g install yarn

yarn add --dev eslint \
  eslint-config-prettier \
  eslint-config-standard \
  eslint-plugin-import \
  eslint-plugin-n \
  eslint-plugin-yml \
  eslint-plugin-prettier \
  eslint-plugin-promise \
  eslint-plugin-json \
  @typescript-eslint/eslint-plugin \
  lint-staged \
  husky \
  prettier \
  yaml-eslint-parser \
  markdownlint-cli2

# From https://prettier.io/docs/en/install.html
npx husky
npm pkg set scripts.prepare="husky"

# Custom .husky/pre-commit script
PRECOMMIT_SCRIPT="$(pwd)/.husky/pre-commit"
mkdir .husky || echo "Directory .husky exists"
cat  << EOF > "${PRECOMMIT_SCRIPT}"
#!/bin/sh
#
# An example hook script to verify what is about to be committed.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.
#
# To enable this hook, rename this file to "pre-commit".

echo "--- Processing pre-commit hook ---"

# Call yarn git:precommit
yarn git:precommit
if [ $? != 0 ]; then
  echo "Linting failed. Please check the message"
  exit 1
fi
EOF

chmod +x "${PRECOMMIT_SCRIPT}"

# Linting
npm pkg set scripts.lint="eslint **/{sceptre,test}/**/*.{js,ts,tsx,json,yml,yaml} --no-error-on-unmatched-pattern"
npm pkg set scripts.lint-fix="yarn lint --fix"

# Git hooks
npm pkg set scripts.git:precommit="lint-staged"
