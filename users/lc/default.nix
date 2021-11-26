{ pkgs, ... }:

{

  users.users.lc = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$6$gPzhjvk1TIy$kJpFfg/ZoHJ363REctU3b11D3CXqAEC5MXplsy9cWlyvVaVmEASdZUEWHVO6dKdn7gFrxNwrb4DiR/JrYUxZc1";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7hpvOy4IhlwGTd/I6OZ46ja3niKz0TCiwd5WCDe+3+kRe/06CX1L7L94uM7iOPnONaTaokbE5pkLudCmckBN/td+tbuRm8AanNZxceastUduqNS7ems3QN7/ApVOa3AIeY/4tGkRUVgxcfpuv37FmU1cYxM/90sngfNhsDszzEs8N4K4iF1peqKPim0MdpqsNvujftH0GTTtJ7iIGw+ODAk0AI5hq7X1AoqfBeJl4Ly1sZLZEFYIoUtbAsaiFw4h2ctk41Yh83BVRT+N6k4dSbLlE/CiLjqxqhs0EMkSFbpzQsIm7WCfp6HmasGFYieuQUWJDXtAYQx1R7wBJiG8z lc@aiur"
    ];
    shell = pkgs.fish;
  };

}
