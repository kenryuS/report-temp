{
  description = "LaTeX Assignment Template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    eskk-vim = {
      url = "github:vim-skk/eskk.vim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, eskk-vim }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      name = "report";
      pkgs = import nixpkgs {
        inherit system;
        config = {};
        overlays = [
          (final: prev: {
            vimPlugins = prev.vimPlugins // {
              vim-eskk = prev.vimUtils.buildVimPlugin {
                name = "vim-eskk";
                src = eskk-vim;
              };
            };
          })
        ];
      };

      vimWithTex = pkgs.vim-full.customize {
        name = "vim-with-tex";
        vimrcConfig = {
          packages.vimWithTexPackage = with pkgs.vimPlugins; {
            start = [
              vim-eskk
              vimtex
            ];
            opt = [];
          };
          customRC = ''
            filetype plugin indent on
            set encoding=utf-8
            set autoindent
            set smartindent
            set expandtab
            set shiftwidth=4
            set tabstop=4
            set wrap
            set number relativenumber
            set nospell
            set ruler
            set cursorline
            set mousehide
            syntax enable

            let g:vimtex_view_method = 'general'
            let g:vimtex_view_general_viewer = 'okular'
            let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
            let g:vimtex_compiler_method = 'latexmk'
            let maplocalleader = ","

            let g:eskk#directory = "~/.config/eskk"
            let g:eskk#dictionary = { 'path': "~/.config/eskk/jisyo", 'sorted': 1, 'encoding': 'utf-8', }
            let g:eskk#large_dictionary = { 'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }
            let g:eskk#kakutei_when_unique_candidate = 0
            let g:eskk#enable_completion = 0
            let g:eskk#no_default_mappings = 1
            let g:eskk#keep_state = 0
            let g:eskk#egg_like_newline = 1
            let g:toggle_latex_eskk = 1

            function! s:latex_eskk() abort
                if &filetype == 'tex' && g:toggle_latex_eskk ==# 1
                    call eskk#enable()
                endif
            endfunction

            function! s:latex_eskk_toggle() abort
                let g:toggle_latex_eskk = g:toggle_latex_eskk == 1 ? 0 : 1
                if g:toggle_latex_eskk ==# 1
                    echomsg 'LaTeX Japanese Input Enabled'
                else
                    echomsg 'LaTeX Japanese Input Disabled'
                endif
            endfunction

            augroup vimrc_eskk
                autocmd!
                autocmd Filetype tex nnoremap <buffer><silent> <F1> :call <SID>latex_eskk_toggle()<CR>
                autocmd User eskk-enable-post lmap <buffer> l <Plug>(eskk:disable)
            augroup END

            imap jk <Plug>(eskk:toggle)
            cmap jk <Plug>(eskk:toggle)
          '';
        };
      };

      texEnv = pkgs.texliveSmall.withPackages (ps: with ps; [
        # Bibliography
        biber
        bibtex
        biblatex

        # Japanese Support
        babel
        babel-japanese
        luatexja
        ascmac
        bxjscls
        zxjatype
        collection-langjapanese

        # Fonts
        noto
        zxjafont
        haranoaji
        libertine
        latex-fonts
        mathfont
        newtx
        luainputenc
        fontspec

        # Math
        amsmath
        amsfonts
        unicode-math
        mathtools

        # Graphics
        graphics
        wrapfig
        caption
        here
        pgf
        circuitikz

        # Tools
        latexmk
        subfiles
        enumitem
        hyperref
        float
        framed
        tabularray
        footmisc
        listings
        xcolor
        xstring
        xpatch
      ] ++ [ ps.import ]);
    in
    {
      devShells.default = pkgs.stdenv.mkDerivation {
	inherit name;
        shellHook = ''
          export PS1="${name} \w \$ "
        '';
        buildInputs = [
          texEnv
          vimWithTex
          pkgs.qpdf
          pkgs.kdePackages.okular
        ];
      };
    }
  );
}
