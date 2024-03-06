# Test
This is a test markdown file. It contains some c and lua code blocks.
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

