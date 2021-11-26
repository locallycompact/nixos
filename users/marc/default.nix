{ pkgs, ... }:

{

  users.users.marc = {
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1JRiwBLNgFdWU9P31itvqK9pKirynAyIa4PtHPrn3Mm3y4hnL4w7Rrvxjw7FPK2ME2JYKTA4Vb+/8bHfnDMTUQHSlDKCmceatVBOqMHV2XrcEZOYYiZCaOz2kEI0GDY/5vOPceF/rjVc2w3qQFIoeABla0piL0LZzHALyd4w3SRdi86zp4WVo3xhvQnDs7Iyb7b4092f4mr2tFFpsLfDg3UQnDx6ahvFVjlCnQDiYtzi30gspWGcZK5tuqeh3rzpR2d93Qkkl2pzWammKIFYQDIM6ffEw29YjmPsp3zmwO9vV/s+qBP2cfsBVjHeZbVaIDk0KtlKxme58OUmS9vdHVLUpYKBM1dKM1ef3M+DE8gICc0RggiK1Pbk1QIB2Hs9X/Wo9bmA/AQrnpi5EuKvhLVRplQExW6Hb8pEAxUTXNk/jHEOZYVJqmfl+KtG35X0KndTERdZgnfZR8sYRe10nx+bOP0hMn458FrBHAwMkSU5TlpmJKCgl1es6/bG/CCs= marcdunford@Marcs-MacBook-Pro.local"
     "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDKHC+JMZjIuaybwIKr8reOOcUcI1u8MN3kRich+XYZwK4ROwIaJlAwPNtQA4vqsJVfpNpTJ13T/8sAI9Sd3ArKEJVcdKku2u3lNx9KG5+ihef31Bp272hLIMtvIFrevmqyvv6FYyGd6eSrow9a+TbKBbzffS2L4k25ga7jzgzaOiysWnPBiMRFSiqeCqYYZRvLSnV0n/ySTUd2PTrSvF3IO3Tg7bx8fBQdK5v97iNsorcFJYHZGfsU0fE0mZN9aGu1N+6T9MKUzEffe+z+r5Syb/Wo1FRO8zmPQAUSXC15rdy9T2i0n+jjItICRyhjkW7WpfHFj10+cUd1ra3bQCl2Aws4qOVvv4IqZDc9aVkI8Bux20hon4+O2Wah66D5ht5GqbH/FoJx7/YqfXHTrvO3H13/wGwVt6VQmnq9oNU7T4QTDO296BuhraYoTV0Vx5Z2CWFfN0RR9w/vyZQBHvOrFXZOjlHvwSiznZwF0n3tbxANmKzoWUTwZnofVQdEXOs= marc@nixos"
    ];
    hashedPassword = "$6$gPzhjvk1TIy$kJpFfg/ZoHJ363REctU3b11D3CXqAEC5MXplsy9cWlyvVaVmEASdZUEWHVO6dKdn7gFrxNwrb4DiR/JrYUxZc1";
    isNormalUser = true;
    shell = pkgs.fish;
  };

}
