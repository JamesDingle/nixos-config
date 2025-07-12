{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Create a generic system-wide python install for rapid testing. Devenv will be used for specific test envs
    (python312.withPackages (ps: with ps; [
      numpy
      scipy
      pandas
      geopandas
      jupyterlab
      google-auth
      fiona
      tqdm
    ]))

  ];
}
