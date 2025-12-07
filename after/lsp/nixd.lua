return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import <nixpkgs> { }',
      },
      options = {
        nixos = {
          expr =
          '(builtins.getFlake "/home/ray/.xdg/config/nix").nixosConfigurations.raydesk.options',
        },
        home_manager = {
          expr =
          -- '(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.raydesk.options.home-manager.users.type.getSubOptions []'
          '(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.raydesk.config.home-manager.users.ray'
        }
      },
    },
  },
}
