# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ge4300"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  networking.interfaces.enp3s0.ipv4.addresses = [ { address = "192.168.1.200"; prefixLength = 24; } ];
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];
  
  networking.bridges."lxcbr0" = {
    interfaces = [ ];
  };

  environment.etc."lxc/default.conf".text = ''
    lxc.net.0.type = veth
    lxc.net.0.link = lxcbr0
    lxc.net.0.flags = up
  '';

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tudi= {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim 
     wget
  ];
  environment.defaultPackages = with pkgs; [
   vim
   mc
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall.enable = false;

  networking.hostId = "a1b2c3d4";
  boot.supportedFilesystems = [ "zfs" ];
  boot.kernelParams = [ "zfs.zfs_arc_max=8589934592" ]; # 8GB in bytes
  systemd.services.create-zfs-pool = {
    enable = true;
    description = "Create ZFS pool on boot";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/run/current-system/sw/bin/zpool create rpool -o ashift=12 -O compression=off -O mountpoint=/zpool -f /dev/sda /dev/sdb";
      RemainAfterExit = true;
    };
  };

  virtualisation.lxc.enable = true;
  systemd.services.create-lxc-storage = {
    enable = true;
    description = "Create LXC ZFS storage pool";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/run/current-system/sw/bin/zfs create rpool/lxc";
      RemainAfterExit = true;
    };
  };
  
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
