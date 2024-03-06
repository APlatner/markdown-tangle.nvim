# markdown-tangle.nvim
A Neovim plugin that parses markdown files for code blocks and writes them into seperate code files. I got the idea from emacs org-mode. Org files can contain code blocks, and if the code blocks are elisp, they can be written to elisp files. I wanted to make a version of this for markdown, since I prefer markdown to org files.

## Usage
The plugin registers the :Tangle command, which can either be used by itself, or you can specify a file. It works on the currently open file buffer unless you specify a file to tangle.

## Valid File Types
currently it only works with C and Lua files.
