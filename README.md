# DOT

Welcome to my dotfiles repo! This repository contains my personal macOS environment setup, including configurations for various tools and applications, scripts for automating the setup process, and more. The goal is to streamline the process of setting up a new macOS system or restoring my preferred environment on existing systems.

## Overview
This repository includes:

- Configuration files (dotfiles) for Zsh, Neovim, tmux, git, and other command-line tools.
- Scripts for automating the installation of Homebrew, Homebrew packages, and macOS applications.
- A dry run feature in scripts to preview changes without applying them.

## Getting Started

### Prerequisites

- macOS operating system
- Command Line Tools for Xcode: `xcode-select --install`
- [Homebrew](https://brew.sh/) (The scripts will install Homebrew if it's not already installed.)
- Neovim 0.10 or later: `brew install neovim`

### Installation

1. **Clone the Repository**

   ```sh
   git clone https://github.com/s-kngstn/dot.git ~/dotfiles
   ```

2. **Initial Setup**

   The `initialsetup` script installs Xcode Command Line Tools, Homebrew, and Git.

   ```sh
   cd ~/dotfiles
   ./initialsetup --run
   ```

   Use `--run` to execute changes; omit it to perform a dry run.

3. **Install Homebrew Packages and Casks**

   After the initial setup, use `installpackages` to install Homebrew formulas and casks.

   ```sh
   ./installpackages --run
   ```

   Again, use `--run` to apply changes; omit for a dry run.

### Scripts

- **`initialsetup`**: Sets up the foundational tools required for the rest of the environment setup. It ensures that Xcode Command Line Tools, Homebrew, and Git are installed.
  
- **`installpackages`**: Automates the installation of specified Homebrew packages and casks.
