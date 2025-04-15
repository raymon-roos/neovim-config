return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import <nixpkgs> { }',
      },
      options = {
        nixos = {
          expr =
          '(builtins.getFlake "/home/ray/.xdg/config/nix").nixosConfigurations.currentSystem.options',
        },
        darwin = {
          expr =
          '(builtins.getFlake "/home/ray/.xdg/config/nix").darwinConfigurations.raymac.options',
        },
      },
    },
  },
}
