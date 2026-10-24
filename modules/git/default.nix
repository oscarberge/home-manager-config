{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Oscar Berge";
      user.email = "oscar.berge.mail@gmail.com";
      init.defaultBranch = "main";
      fetch.prune = true;
    };
  };
}
