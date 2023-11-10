;; base16-material-lighter-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/tinted-theming/home)

;;; Authors:
;; Scheme: Nate Peterson
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-material-lighter-theme-colors
  '(:base00 "#FAFAFA"
    :base01 "#E7EAEC"
    :base02 "#CCEAE7"
    :base03 "#CCD7DA"
    :base04 "#8796B0"
    :base05 "#80CBC4"
    :base06 "#80CBC4"
    :base07 "#FFFFFF"
    :base08 "#FF5370"
    :base09 "#F76D47"
    :base0A "#FFB62C"
    :base0B "#91B859"
    :base0C "#39ADB5"
    :base0D "#6182B8"
    :base0E "#7C4DFF"
    :base0F "#E53935")
  "All colors for Base16 Material Lighter are defined here.")

;; Define the theme
(deftheme base16-material-lighter)

;; Add all the faces to the theme
(base16-theme-define 'base16-material-lighter base16-material-lighter-theme-colors)

;; Mark the theme as provided
(provide-theme 'base16-material-lighter)

(provide 'base16-material-lighter-theme)

;;; base16-material-lighter-theme.el ends here
