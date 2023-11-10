;; base16-material-palenight-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)

;;; Authors:
;; Scheme: Nate Peterson
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-material-palenight-theme-colors
  '(:base00 "#292D3E"
    :base01 "#444267"
    :base02 "#32374D"
    :base03 "#676E95"
    :base04 "#8796B0"
    :base05 "#959DCB"
    :base06 "#959DCB"
    :base07 "#FFFFFF"
    :base08 "#F07178"
    :base09 "#F78C6C"
    :base0A "#FFCB6B"
    :base0B "#C3E88D"
    :base0C "#89DDFF"
    :base0D "#82AAFF"
    :base0E "#C792EA"
    :base0F "#FF5370")
  "All colors for Base16 Material Palenight are defined here.")

;; Define the theme
(deftheme base16-material-palenight)

;; Add all the faces to the theme
(base16-theme-define 'base16-material-palenight base16-material-palenight-theme-colors)

;; Mark the theme as provided
(provide-theme 'base16-material-palenight)

(provide 'base16-material-palenight-theme)

;;; base16-material-palenight-theme.el ends here
