# Linting

- [Linting](#linting)
  - [Markdown](#markdown)
    - [Automated fixes](#automated-fixes)
    - [Configuration](#configuration)
    - [IDE Support](#ide-support)
      - [VS Code](#vs-code)
  - [Eslint](#eslint)
    - [Automated fixes](#automated-fixes-1)
    - [Configuration](#configuration-1)
    - [IDE Support](#ide-support-1)
      - [VS Code](#vs-code-1)

## Markdown

We've selected the npm package `markdownlint-cli` for linting markdown ([package](https://www.npmjs.com/package/markdownlint-cli)).

Rulesets can be found [here](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md).

### Automated fixes

Where no IDE integration is possible, `markdownlint` fixes can be automated:

```json
"scripts": {
    "fix:markdown": "markdownlint '**/*.md' --fix --ignore node_modules -c .markdownlint.json"
}
```

The flag `-c` is pointing to a config file, in this case `.markdownlint.json`, which is at root in the example to automatically configure any IDE plugins (plugins may need special config to load the config file from another location).

### Configuration

`markdownlint-cli` can be configured using a variety of file formats ([see docs for the selection](https://www.npmjs.com/package/markdownlint-cli)). This is what, for example, a `.markdownlint.json` file might look like:

```json
{
    "default": true,
    "MD013": false
}
```

In this case, the standard config is being imported and the rule for line lengths is being disabled. Rulesets can be found [here](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md).

### IDE Support

#### VS Code

Plugin support for VSCode can be found in the marketplace under the name `markdownlint` (plugin ID: `davidanson.vscode-markdownlint`). This will provide highlighting.

To add autofix (see [the setup guide](https://github.com/DavidAnson/vscode-markdownlint)), configure VS Code's `editor.codeActionsOnSave` settings:

```json
"editor.codeActionsOnSave": {
    "source.fixAll.markdownlint": true
}
```

## Eslint

### Automated fixes

Where no IDE integration is possible, `eslint` fixes can be automated:

```json
"scripts": {
    "fix:eslint": "eslint --fix --ext .js,.jsx,.ts,.tsx ."
}
```

The `.eslintrc.json` config file is picked up from package root by default.

### Configuration

`Eslint` is configured in this project using the `.eslintrc.json` in the `ui` folder. To understand how amend the config, see [Configuring ESLint](https://eslint.org/docs/user-guide/configuring)

### IDE Support

#### VS Code

Plugin support for VSCode can be found in the marketplace under the name `ESLint` (plugin ID: `dbaeumer.vscode-eslint`). This will provide highlighting.

To add autofix, configure VS Code's `editor.codeActionsOnSave` settings:

```json
"editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
}
```
