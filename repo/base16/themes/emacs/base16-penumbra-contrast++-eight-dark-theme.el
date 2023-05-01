;; base16--theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)

;;; Authors:
;; Scheme: yushyin (generated by base16-penumbra-scheme-gen.pl)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16--theme-colors
  '(:base00 "#181B1F"
    :base01 "#3E4044"
    :base02 "#636363"
    :base03 "#AEAEAE"
    :base04 "#DEDEDE"
    :base05 "#F2E6D4"
    :base06 "#FFF7ED"
    :base07 "#FFFDFB"
    :base08 "#F58C81"
    :base09 "#A9B852"
    :base0A "#E09F47"
    :base0B "#54C794"
    :base0C "#00C4D7"
    :base0D "#6EB2FD"
    :base0E "#B69CF6"
    :base0F "#E58CC5")
  "All colors for Base16 penumbra contrast++ eight dark are defined here.")

;; Define the theme
(deftheme base16-)

;; Add all the faces to the theme
(base16-theme-define 'base16- base16--theme-colors)

;; Mark the theme as provided
(provide-theme 'base16-)

(provide 'base16--theme)

;;; base16--theme.el ends here
