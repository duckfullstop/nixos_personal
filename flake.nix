{
  description = "User configuration for duck.";

  outputs = _: {
    nixosModules = {
      base = import ./base;
      workstation = import ./workstation;
      # i3 = import ./workstation/i3;
    };
  };
};
