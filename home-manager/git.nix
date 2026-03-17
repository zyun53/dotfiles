{pkgs, ...}: {
  programs.git = {
    enable = true;
    signing = {
      key = "0x67704856E13A5571";
      signByDefault = false;
    };
    settings = {
      user.name = "Isida Zyun'iti";
      user.email = "mail@zyun.jp";
      extraConfig = {
        pull.ff = "only";
        init.defaultBranch = "main";
      };
      alias = {
        c = "commit -m";
        cn = "commit --no-gpg-sign -m";
        ca = "commit --amend --no-edit";
        s = "status";
        d = "diff";
        ds = "diff --staged";
        rs = "restore --staged";
        sc = "switch --create";

        force-clean = "clean -fdX";
        gr = "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'";
        m-init = "submodule update --init --recursive";
      };
    };

    ignores = [
      "*.*~"
      "*.swp"
      ".vscode"
      ".DS_Store"
      ".direnv"
      ".envrc"
    ];
  };
}
