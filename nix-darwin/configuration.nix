{
  self,
  hostPlatform,
  ...
}:
{
  nixpkgs = {
    #overlays = [
    #  inputs.neovim-nightly-overlay.overlays.default
    #  inputs.claude-code.overlays.default
    #];
    config = {
      allowUnfree = true;
    };
  };

  users.users.zyun.home = "/Users/zyun";
  imports = [
    ./home_manager.nix
  ];

  system = {
    stateVersion = 6;
    primaryUser = "zyun";
  };


  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.enable = false;

  programs.zsh.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
    finder = {
      AppleShowAllFiles = true; # 隠しファイルを表示
      FXDefaultSearchScope = "SCcf"; # 検索範囲をカレントフォルダに設定
      ShowPathbar = true; # パスバーを表示
      FXEnableExtensionChangeWarning = false; # ファイル拡張子変更の警告を無効化
      FXPreferredViewStyle = "Nlsv"; # デフォルトの表示方法をリストビューに設定
    };
    dock = {
      show-recents = false; # 最近使ったアプリを非表示
      launchanim = false; # アプリ起動時のアニメーションを無効化
      mineffect = "scale"; # ウィンドウを閉じるときのエフェクトをスケールに設定
    };
  };
}
