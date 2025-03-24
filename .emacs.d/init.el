;; Author Eric Nantel
;; https://github.com/ericnantel/learn-orgmode/blob/main/.emacs.d/init.el

;; package-management
(custom-set-variables '(package-archives
						 '(("melpa" . "https://melpa.org/packages/")
						   ("elpa" . "https://elpa.gnu.org/packages/"))))

;; catppuccin theme
(use-package catppuccin-theme
			 :ensure t
			 :init
			 (load-theme 'catppuccin :no-confirm))

(require 'org)
(require 'org-agenda)
(require 'org-capture)
(require 'org-mobile)

;; TODO: Replace with C-c o a like <leader>oa (action open agenda)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-directory "~/org")
(setopt org-startup-indented t
		org-ellipsis " ▼"
		org-hide-emphasis-markers t
		org-pretty-entities t
		org-src-fontify-natively t
		org-fontify-whole-heading-line t
		org-fontify-quote-and-verse-blocks t
		ord-edit-src-content-indentation 0
		org-hide-block-startup nil
		org-src-tab-acts-natively t
		org-src-preserve-indentation nil
		;; org-startup-folded t
		org-cycle-separator-lines 2
		org-hide-leading-stars t
		org-highlight-latex-and-related '(native)
		org-goto-auto-isearch nil)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-startup-folded t)

(setq org-agenda-files (list (concat org-directory "/personal.org")
							 (concat org-directory "/work.org")
							 (concat org-directory "/school.org")
							 (concat org-directory "/diary.org")))
(setq org-deadline-warning-days 7)
(setq org-agenda-include-diary nil) ; NOTE: We are including calendar holidays in diary.org
(setq org-agenda-span 7)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-start-day "-1d")
(setq org-agenda-start-with-log-mode t)
;; TODO: org-agenda-custom-commands
(setq org-agenda-window-setup 'only-window)

(setq org-default-notes-file (concat org-directory "/refile.org"))
(setq org-capture-templates
	  '(("t" "Refile" entry (file (lambda () (concat org-directory "/refile.org")))
		 "* TODO %?\n %U\n" :empty-lines 1)
		("p" "Personal" entry (file (lambda () (concat org-directory "/personal.org")))
		 "* TODO %?\n %U\n" :empty-lines 1)
		("w" "Work" entry (file (lambda () (concat org-directory "/work.org")))
		 "* TODO %?\n %U\n" :empty-lines 1)
		("s" "School" entry (file (lambda () (concat org-directory "/school.org")))
		 "* TODO %?\n %U\n" :empty-lines 1)))

(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-use-encryption nil)
;; (setq org-mobile-encryption-password "")
;; (setq org-mobile-files (list ()))
(setq org-mobile-force-id-on-agenda-items nil)
(setq org-mobile-inbox-for-pull (concat org-directory "/mobile-flagged.org"))

;; org-bullets
(use-package org-bullets
			 :ensure t
			 :config
			 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; which-key
(use-package which-key
			 :defer nil
			 :diminish which-key-mode
			 :config
			 (which-key-mode))
