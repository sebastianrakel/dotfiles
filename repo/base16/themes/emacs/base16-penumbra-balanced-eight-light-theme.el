;; base16-penumbra-balanced-eight-light-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)

;;; Authors:
;; Scheme: yushyin (generated by base16-penumbra-scheme-gen.pl)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-penumbra-balanced-eight-light-theme-colors
  '(:base00 "#FFF7ED"
    :base01 "#F2E6D4"
    :base02 "#BEBEBE"
    :base03 "#8F8F8F"
    :base04 "#636363"
    :base05 "#3E4044"
    :base06 "#303338"
    :base07 "#24272B"
    :base08 "#CA736C"
    :base09 "#8D9741"
    :base0A "#BA823A"
    :base0B "#47A477"
    :base0C "#00A2AF"
    :base0D "#5794D0"
    :base0E "#9481CC"
    :base0F "#BC73A4")
  "All colors for Base16 penumbra balanced eight light are defined here.")

;; Define the theme
(deftheme base16-penumbra-balanced-eight-light)

;; Add all the faces to the theme
(base16-theme-define 'base16-penumbra-balanced-eight-light base16-penumbra-balanced-eight-light-theme-colors)

;; Mark the theme as provided
(provide-theme 'base16-penumbra-balanced-eight-light)

(provide 'base16-penumbra-balanced-eight-light-theme)

;;; base16-penumbra-balanced-eight-light-theme.el ends here
