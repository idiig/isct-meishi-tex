{
  description = "Dev environment for meishi";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux" 
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems =
        f:
        nixpkgs.lib.genAttrs allSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forAllSystems (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              (texlive.combine {
                inherit (texlive)
                  scheme-basic  # basic scheme
                  latexmk       # for automatic compilation
                  luatexja      # for LuaLaTeX Japanese support
                  xkeyval       # for ifplatform
                  fontspec      # Font selection
                  pgf           # tikz package
                  haranoaji     # Japanese font
                  pxrubrica;    # Japanese ruby annotation
              })
            ];
            
            shellHook = ''
              export OSFONTDIR="${pkgs.charis-sil}/share/fonts/truetype" # Set ipa font directory for LaTeX

              echo "🎓 Meishi Environment Ready!"
              echo ""
              echo "Usage:"
              echo "  latexmk main.tex    # automatically compile with latexmk"
              echo "  lualatex -shell-escape main.tex  # compile with lualatex and shell escape"
            '';
          };
        }
      );
    };
}
