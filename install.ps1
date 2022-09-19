$location = Get-Location

New-Item -Path "$($env:APPDATA)/.emacs.d" -ItemType Directory
Copy-Item -Path "$location/repo/emacs/init.el" -Destination "$env:APPDATA/.emacs.d/init.el"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA/.emacs.d/personal" -Value "$location/repo/emacs/personal"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA/.emacs.d/snippets" -Value "$location/repo/emacs/snippets"

New-Item -ItemType SymbolicLink -Path "~/.gitconfig" -Value "$location/repo/git/gitconfig"