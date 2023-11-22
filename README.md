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
local str = "Hello,"
local str2 = " World!"
```

```lua
print(str .. str2)
```

## this is a header

some text
kjlkjfn

### this is another header

some text

## this is a low down header

some text

