{ pkgs, ... }:

{
	environment.variables = { EDITOR = "vim"; };
	environment.systemPackages = with pkgs; [

		((vim_configurable.override { }).customize{
		 name = "vim";

		 vimrcConfig.packages.myPlugins = with pkgs.vimPlugins; {
		 start = [
		 ale
		 rust-vim
		 YouCompleteMe
		 auto-pairs
		 syntastic
         fzf-vim
         fzf
		 ];

		 opt = [ ];

		 };

		 vimrcConfig.customRC = ''
		 syntax enable
		 colorscheme slate
		 set tabstop=4
		 set shiftwidth=4
		 set expandtab
		 set hlsearch
		 set incsearch
		 set ignorecase
		 set smartcase
		 set showmatch
		 set ruler
		 set wrap
		 set relativenumber
		 set scrolloff=5
		 filetype plugin indent on
		 highlight LineNr ctermfg=grey
         highlight MatchParen ctermbg=242 guibg=#6c6c6c
         highlight matchparen cterm=underline gui=underline ctermfg=NONE guifg=NONE ctermbg=NONE guibg=NONE
		 inoremap jj <Esc>
		 autocmd CmdlineLeave /,\? :set nohlsearch
		 '';

		}

	)];
}
