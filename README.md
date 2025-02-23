# Melange for React Developers (with flake.nix)

A simple project template using [Melange](https://github.com/melange-re/melange)
with [opam-nix](https://github.com/tweag/opam-nix).

## Quick Start

```shell
# Start developer terminal
nix develop
# Build the project
dune build @ui
# Use an IDE with 
code .

# Bundle
npm install
npm run bundle
```

### React

React support is provided by
[`reason-react`](https://github.com/reasonml/reason-react/). The entry
point of the sample React app is [`Index.re`](Index.re).