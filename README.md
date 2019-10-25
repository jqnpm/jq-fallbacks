<p align="center">
  <a href="https://github.com/joelpurra/jqnpm"><img src="https://raw.githubusercontent.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg?sanitize=true" alt="jqnpm logotype, a Penrose triangle" width="100" border="0" /></a>
</p>

# [jq-fallbacks](https://github.com/joelpurra/jq-fallbacks)

Provide fallbacks for bad values.

This is a package for the command-line JSON processor [`jq`](https://stedolan.github.io/jq/). Install the package in your jq project/package directory with [`jqnpm`](https://github.com/joelpurra/jqnpm):

```bash
jqnpm install joelpurra/jq-fallbacks
```



## Usage


```jq
import "joelpurra/jq-fallbacks" as Fallbacks;

# Fallbacks::unlessNullFallback(<normal>; <fallback>)
"not null" | Fallbacks::unlessNullFallback("a"; "b"),  # "a"
null | Fallbacks::unlessNullFallback("a"; "b"),        # "b"

# Fallbacks::ifNull(<fallback>)
"not null" | Fallbacks::ifNull("a"),  # "not null"
null | Fallbacks::ifNull("a"),        # "a"

# Fallbacks::unlessNull(<fallback>)
"not null" | Fallbacks::unlessNull("a"),  # "a"
null | Fallbacks::unlessNull("a"),        # "not null"

# Fallbacks::nullAsObject
"not null" | Fallbacks::nullAsObject("a"),  # "not null"
null | Fallbacks::nullAsObject("a"),        # {}
```



---

## License
Copyright (c) 2014, 2015, Joel Purra <http://joelpurra.com/>
All rights reserved.

When using **jq-fallbacks**, comply to the MIT license. Please see the LICENSE file for details.
