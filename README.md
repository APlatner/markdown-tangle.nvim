# markdown-tangle.nvim
A Neovim plugin that parses markdown files for code blocks and writes them into seperate code files.

```c
#include <stdio.h>

int main() {
    printf("Hello, World!\n");

    return 0;
}
```

```lua
str = "Hello,"
local str2 = " World!"
print(str2)
if vim.api.nvim_eval('exists("str")') == true then
    print(str)
end
```

```lua

```

## this is a header

some text that goes on for long enough that the text should wrap, except that it won't because I included a codeblock that has some lua configuration code that makes it so that neovim will stop the wrapping.

### this is another header

some text

## this is a low down header

some text

