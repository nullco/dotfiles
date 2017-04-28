;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "b97a01622103266c1a26a032567e02d920b2c697ff69d40b7d9956821ab666cc" default)))
 '(horizontal-scroll-bar-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(linum-format "%d ")
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(ns-right-alternate-modifier (quote none))
 '(package-archives
   (quote
    (("melpa-stable" . "https://stable.melpa.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (crux undo-tree web-mode helm-ag ag flycheck dracula-theme json-mode magit expand-region multiple-cursors helm-projectile helm projectile company company-jedi powerline)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; replace yes or no questions for y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; get rif of the default emacs message at startup
(setq inhibit-startup-message t)
;; disable auto-backups on files
(setq make-backup-files nil)
;; enable windows movement with S-<arrows>
(windmove-default-keybindings)
;; disable auto-save
(setq auto-save-default nil)
;; projectile config
(projectile-global-mode)
(setq projectile-switch-project-action 'projectile-dired)

;; enable company mode globally
(global-company-mode t)
(setq company-minimum-prefix-length 1)
;; enable flycheck mode
(global-flycheck-mode)
;; display line numbers globally
(global-linum-mode t)

;; use ibuffer instead of the default buffer list
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; helm configuration
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; setup helm-projectile integration
(helm-projectile-on)

;; multiple cursos config
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; allow marked text replacement
(delete-selection-mode 1)

;; store the emacs session when exiting
(desktop-save-mode 1)

;; expand-region binding key
(global-set-key (kbd "C-=") 'er/expand-region)

;; powerline config
(setq ns-use-srgb-colorspace nil)
(powerline-default-theme)

;; allow dired-find-alternative-file in order to be able to navigate through directories without opening new buffers
(put 'dired-find-alternate-file 'disabled nil)

;; configure electric pair mode to auto-close parenthesis, etc
(electric-pair-mode 1)
;; configure electric indent to stop indenting previous line
(setq-default electric-indent-inhibit t)

;; Show closing parenthesis and brakets
(show-paren-mode 1)
;; configure python-mode hooks
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; configure webmode

(defun my/web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
)
(add-hook 'web-mode-hook  'my/web-mode-hook)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; configure undo tree for better undo-redo experience
(global-undo-tree-mode)
