(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'load-path "/usr/share/emacs/site-lisp")

;; Check that all required packages are installed

(require 'cl)
 
(defvar my-packages
  '(projectile haml-mode linum-relative monokai-theme powerline yaml-mode yasnippet nyan-mode)
  "A list of packages to ensure are installed at launch.")
 
(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))
 
(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Save last opened files
(setq desktop-save t)
(desktop-save-mode t)

;; No welcome screen
(setq-default inhibit-startup-message t)

;; No backups
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

;; Graphical interface tweaks
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Powerline
(require 'powerline)

;; Lines and columns
(line-number-mode 1)
(column-number-mode 1)

;; Load Monokai theme
(require 'monokai-theme)

;; Load relative numbers
(require 'linum-relative)

;; Cursor
(blink-cursor-mode 0)
(global-hl-line-mode 1)
(set-face-background 'hl-line "grey22")

;; Enable linum-mode
(global-linum-mode t)
(setq-default linum-relative-current-symbol "")

;; Writing helpers
(electric-pair-mode 1)

;; Writing style
(setq-default c-basic-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default fill-column 80)

;; Syntax highlighting
(show-paren-mode 1)
(setq-default show-paren-delay 0)
(setq-default show-paren-style 'parenthesis)
(require 'haml-mode)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)

;; Default font
(set-default-font "Monaco 12")
