;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
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
    (monokai-theme iy-go-to-char ace-jump-mode js2-mode undo-tree helm-ag ag flycheck json-mode magit expand-region multiple-cursors helm-projectile helm projectile company company-jedi)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit default))))
 )

(add-to-list 'exec-path "/usr/local/bin/")

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
(setq company-dabbrev-downcase nil)
(setq company-idle-delay 0)
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

;; allow dired-find-alternative-file in order to be able to navigate through directories without opening new buffers
(put 'dired-find-alternate-file 'disabled nil)

;; configure electric pair mode to auto-close parenthesis, etc
(electric-pair-mode 1)

;; Show closing parenthesis and brakets
(show-paren-mode 1)

(defun my/hideshow-mode-enable()
  (local-set-key (kbd "C-c <right>") 'hs-show-block)
  (local-set-key (kbd "C-c <left>")  'hs-hide-block)
  (local-set-key (kbd "C-c <up>")    'hs-hide-all)
  (local-set-key (kbd "C-c <down>")  'hs-show-all)
  (hs-minor-mode t))

;; configure html mode hooks
(defun my/html-mode-hook()
  (my/hideshow-mode-enable)
  (set (make-local-variable 'sgml-basic-offset) 4))

(add-hook 'html-mode-hook 'my/html-mode-hook)

;; configure python-mode hooks
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (my/hideshow-mode-enable)
  (flycheck-mode t))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;; configure webmode hooks

;; configure js2-mode hooks
(defun my/js2-mode-hook ()
  (my/hideshow-mode-enable))

(add-hook 'js2-mode-hook 'my/js2-mode-hook)

;; configure file type modes
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; configure undo tree for better undo-redo experience
(global-undo-tree-mode)

;; make emacs cursor as bar
(setq-default cursor-type 'bar)

;; general flycheck configuration
(setq flycheck-highlighting-mode 'lines)

;; ace jump config (jump to x character easly)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; iy-go-to-char config (jump to n occurrence of character)
(global-set-key (kbd "C-c f") 'iy-go-up-to-char)
(global-set-key (kbd "C-c F") 'iy-go-up-to-char-backward)
