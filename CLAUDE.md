# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a chezmoi dotfiles repository that manages shell configuration and environment setup for macOS. It uses chezmoi's templating system to dynamically generate configuration files.

## Key Commands

- `chezmoi apply` - Apply all dotfile changes to the home directory
- `chezmoi diff` - Show what would change with apply
- `chezmoi add <file>` - Add a new file to be managed by chezmoi
- `chezmoi edit <file>` - Edit a managed file
- `chezmoi cd` - Enter the source directory
- `chezmoi status` - Show files that differ between source and target

## Architecture

### Template System

Files use chezmoi's templating with Go template syntax:
- `.tmpl` suffix indicates template files that will be processed
- `dot_` prefix represents dotfiles (e.g., `dot_zshrc.tmpl` → `~/.zshrc`)
- `run_once_before_*` scripts run once before applying changes
- `run_onchange_*` scripts run when their contents change

### Configuration Data

- `.chezmoi.toml.tmpl` - Main configuration defining user data (name, email) and environment detection (container vs native)
- `.chezmoidata/packages.yaml` - Package definitions for brew/cask installations on Darwin

### Key Files

- `dot_zshrc.tmpl` - Main zsh configuration with PATH setup, aliases, oh-my-zsh config, and shell integrations
- `dot_zshenv.tmpl` - Environment variables loaded for all shells (cargo setup)
- Integration with 1Password CLI via `onepasswordRead` template function for secure credential management
- Container detection logic (`{{ if ne .container true }}`) conditionally includes macOS-specific configuration

### PATH Management

Multiple PATH entries are managed in `dot_zshrc.tmpl` for various tools, with conditional logic for container vs native environments.

### Package Management

Darwin packages defined in `.chezmoidata/packages.yaml` are automatically installed via `run_onchange_darwin-install-packages.sh.tmpl` using `brew bundle`.

### Shell Plugins

- Uses antidote for zsh plugin management (installed via `run_once_before_install-antidote.sh`)
- Plugins defined in `dot_zsh_plugins.txt`
- Uses starship prompt (installed via `run_once_before_install-starship.sh`)
- Configuration in `dot_config/starship.toml`
