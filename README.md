# Vim/Neovim Keybindings and Commands

This repository contains a collection of custom keybindings and commands for Vim/Neovim. The keybindings are designed to improve productivity and streamline the development workflow.

## Keybindings

### General Keymaps
- `i`, `jk` => Exit Insert Mode
- `<leader>nh` => Clear search highlight
- `<leader>+` => Increment
- `<leader>-` => Decrement

### Split Management
- `<leader>sv` => Split vertically
- `<leader>sh` => Split horizontally
- `<leader>se` => Equalize splits
- `<leader>sx` => Close all splits

### Tab Management
- `<leader>to` => Open a new tab
- `<leader>tx` => Close the current tab
- `<leader>tn` => Go to the next tab
- `<leader>tp` => Go to the previous tab
- `<leader>tf` => Move the current tab to a new tab

### Vim Split Maximizer
- `<leader>sm` => Maximize or minimize the current split

### Todo Comments Navigation
- `]t` => Go to the next TODO comment
- `[t` => Go to the previous TODO comment

### Telescope Navigation
- `ctrl+k` => Move to the previous result
- `ctrl+j` => Move to the next result
- `ctrl+q` => Open the quick fix list

- `<leader>ff` => Fuzzy find files in current working directory
- `<leader>fr` => Fuzzy find recent files
- `<leader>fs` => Fuzzy search for a string in the current directory
- `<leader>fc` => Find the string under the cursor in the current directory
- `<leader>ft` => Find TODO comments using Telescope

### Substitute Commands
- `s` => Substitute with motion
- `ss` => Substitute the entire line
- `S` => Substitute to the end of the line
- `x, s` => Substitute in visual mode

### Nvim Tree File Explorer
- `<leader>ee` => Toggle file explorer
- `<leader>ef` => Toggle file explorer on the current file
- `<leader>ec` => Collapse file explorer
- `<leader>er` => Refresh file explorer

### Auto-Session Management
- `<leader>wr` => Restore the last workspace session for the current directory
- `<leader>ws` => Save the current workspace session

### Language Server Protocol (LSP) Keybindings
- `gR` => Show references
- `gD` => Go to declaration
- `gd` => Show LSP definitions
- `gi` => Show LSP implementations
- `gt` => Show LSP type definitions
- `<leader>ca` => Show available code actions
- `<leader>rn` => Smart rename
- `<leader>D` => Show diagnostics for the file
- `<leader>d` => Show diagnostics for the current line
- `[d` => Jump to the previous diagnostic
- `]d` => Jump to the next diagnostic
- `K` => Show documentation for the symbol under the cursor
- `<leader>rs` => Restart LSP if necessary

### Trouble Plugin
- `<leader>xw` => Open workspace diagnostics in Trouble
- `<leader>xd` => Open document diagnostics in Trouble
- `<leader>xq` => Open the quickfix list in Trouble
- `<leader>xl` => Open location list in Trouble
- `<leader>xt` => Open TODO comments in Trouble

### nvim-cmp (Completion)
- `ctrl+k` => Move to the previous suggestion
- `ctrl+j` => Move to the next suggestion
- `ctrl+b` => Scroll (-4 lines)
- `ctrl+f` => Scroll (4 lines)
- `ctrl+<leader>` => Show completion suggestions
- `ctrl+e` => Close the completion window
- `Enter` => Confirm the selection

### Formatter
- `<leader>mp` => Format the entire file or selected range (in visual mode)

### Linting
- `<leader>l` => Trigger linting for the current file

### Git Integration with LazyGit and Gitsigns
- `<leader>lg` => Open LazyGit
- `]h` => Go to the next Git hunk
- `[h` => Go to the previous Git hunk
- `<leader>hs` => Stage the current hunk
- `<leader>hr` => Reset the current hunk
- `<leader>hS` => Stage the entire buffer
- `<leader>hR` => Reset the entire buffer
- `<leader>hu` => Undo the staged hunk
- `<leader>hp` => Preview the current hunk
- `<leader>hb` => Blame the current line
- `<leader>hB` => Toggle line blame
- `<leader>hd` => Diff the current hunk
- `<leader>hD` => Diff the hunk with the previous state
- `ih` => Select a Git hunk (in visual mode)

---

## Installation

To use these keybindings in your Vim or Neovim setup, simply add the configuration to your `init.vim` or `init.lua` file.

```vim
