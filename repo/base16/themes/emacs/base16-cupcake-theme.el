;; base16-cupcake-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)

;;; Authors:
;; Scheme: Chris Kempson (http://chriskempson.com)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-cupcake-theme-colors
  '(:base00 "#fbf1f2"
    :base01 "#f2f1f4"
    :base02 "#d8d5dd"
    :base03 "#bfb9c6"
    :base04 "#a59daf"
    :base05 "#8b8198"
    :base06 "#72677E"
    :base07 "#585062"
    :base08 "#D57E85"
    :base09 "#EBB790"
    :base0A "#DCB16C"
    :base0B "#A3B367"
    :base0C "#69A9A7"
    :base0D "#7297B9"
    :base0E "#BB99B4"
    :base0F "#BAA58C")
  "All colors for Base16 Cupcake are defined here.")

;; Define the theme
(deftheme base16-cupcake)

;; Add all the faces to the theme
(base16-theme-define 'base16-cupcake base16-cupcake-theme-colors)

;; Mark the theme as provided
(provide-theme 'base16-cupcake)

(provide 'base16-cupcake-theme)

;;; base16-cupcake-theme.el ends here
