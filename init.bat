@ECHO OFF

ECHO "User Dir: " %UserProfile%
ECHO "Script Dir: " "%~dp0"
mklink /J %UserProfile%\.emacs.d "%~dp0\editor\.emacs.d"
mklink /H %UserProfile%\.emacs "%~dp0\editor\.emacs"

mklink /J %UserProfile%\.vim "%~dp0\editor\.vim"
mklink /H %UserProfile%\.vimrc "%~dp0\editor\.vimrc"

mklink /H %UserProfile%\.gitconfig "%~dp0\tools\.gitconfig"
PAUSE
