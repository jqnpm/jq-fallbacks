<p align="center">
  <img src="https://rawgit.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg" alt="jqnpm logotype, a Penrose triangle" width="100" />
</p>

# [jq-fallbacks](https://github.com/joelpurra/jq-fallbacks)

Provide fallbacks for bad values.

This is a package for the command-line JSON processor [`jq`](https://stedolan.github.io/jq/). Install the package with [`jqnpm`](https://github.com/joelpurra/jqnpm):

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

When using **jq-fallbacks**, comply to at least one of the three available licenses: BSD, MIT, GPL.
Please see the LICENSE file for details.


