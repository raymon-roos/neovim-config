return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import <nixpkgs> { }',
      },
      options = {
        nixos = {
          expr =
          '(builtins.getFlake ("git+file://" + toString "$XDG_CONFIG_HOME/nix")).nixosConfigurations.raydesk.options',
        },
        home_manager = {
          expr =
          '(builtins.getFlake ("git+file://" + toString "$XDG_CONFIG_HOME/nix")).homeConfigurations."ray@raydesk".options',
        },
      },
    },
  },
}
