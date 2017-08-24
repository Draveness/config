;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     sql
     sml
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0
                      auto-completion-private-snippets-directory nil)
     octave
     java
     (c-c++ :variables
            c-c++-default-mode-for-headers 'objc-mode
            c-c++-enable-clang-support t)
     rust
     chinese
     nginx
     swift
     erlang
     elixir
     yaml
     (c-c++ :variables
            c-c++-default-mode-for-headers 'objc-mode
            c-c++-enable-clang-support t)
     better-defaults
     git
     markdown
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'multi-term
            shell-default-term-shell "/bin/zsh"
            shell-default-full-span nil)
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     version-control
     osx
     ruby-on-rails
     (ruby :variables
           ruby-version-manager 'rvm
           ruby-test-runner 'rspec)
     html
     react
     go
     javascript
     react
     themes-megapack
     emacs-lisp
     (org :variables
          org-enable-github-support t)
     )
   dotspacemacs-additional-packages '(js2-mode
                                      tern
                                      (vue-mode :location (recipe :fetcher github :repo "codefalling/vue-mode")))
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '(smartparens)
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server t
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq js2-strict-semi-warning nil)
  (setq js2-missing-semi-one-line-override nil)
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq web-mode-attr-indent-offset n) ; web-mode, js code in html file
  (setq web-mode-indent-style n)
  (setq css-indent-offset n) ; css-mode
  (setq standard-indent n)
  (setq tab-width n)
  (setq indent-tabs-mode nil)
  (setq go-tab-width n)
  )

(defun dotspacemacs/user-init ()
  (my-setup-indent 2) ;; indent two spaces width
  (setq exec-path-from-shell-check-startup-files nil) ;; disable exec path from shell warnings
  (setq create-lockfiles nil)
  (setq neo-show-hidden-files nil)
  )

(defun dotspacemacs/user-config ()
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))
  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((C . t)
       (ruby . t)
       (sqlite . t)
       (emacs-lisp . t)
       (sh . t)
       (shell . t)
       (sml . t)
       (java . t)
       (elixir . t)
       (python . t)))
    )
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sql-indent ob-sml sml-mode company-emacs-eclim eclim ob-http ox-gfm enh-ruby-mode toml-mode racer flycheck-rust seq cargo rust-mode flycheck-objc-clang nginx-mode swift3-mode swift-mode org-projectile org-present org-pomodoro alert log4e gntp org-download htmlize go-guru go-eldoc gnuplot company-go go-mode evil-unimpaired yaml-mode mwim erlang disaster company-c-headers cmake-mode clang-format projectile-rails vue-mode web-mode js-auto-beautify zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme rainbow-mode rainbow-identifiers color-identifiers-mode jsx-mode vue-html-mode inflections feature-mode orgit magit-gitflow git-gutter-fringe+ git-gutter+ flyspell-correct-helm evil-magit magit magit-popup git-commit company-web chinese-pyim ac-ispell yapfify xterm-color smeargle shell-pop reveal-in-osx-finder pyvenv pytest pyenv-mode py-isort pip-requirements pbcopy pangu-spacing osx-trash osx-dictionary multi-term live-py-mode launchctl hy-mode helm-pydoc helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe fringe-helper git-gutter flyspell-correct flycheck-pos-tip find-by-pinyin-dired with-editor eshell-z eshell-prompt-extras esh-help diff-hl cython-mode web-completion-data company-tern dash-functional company-statistics company-anaconda chinese-pyim-basedict pos-tip auto-yasnippet auto-dictionary anaconda-mode pythonic ace-pinyin pinyinlib ace-jump-mode auto-complete tern tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ob-elixir livid-mode skewer-mode js2-refactor yasnippet multiple-cursors flycheck-mix alchemist company org flycheck elixir-mode web-beautify simple-httpd json-mode json-snatcher json-reformat js2-mode js-doc coffee-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text mmm-mode minitest markdown-toc markdown-mode macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio gh-md flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode chruby bundler inf-ruby bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))))
(defun dotspacemacs/emacs-custom-settings ()
  (custom-set-variables
   '(package-selected-packages
     (quote
      (winum helm-purpose window-purpose imenu-list fuzzy flycheck-credo projectile-rails jsx-mode vue-html-mode inflections feature-mode orgit magit-gitflow git-gutter-fringe+ git-gutter+ flyspell-correct-helm evil-magit magit magit-popup git-commit company-web chinese-pyim ac-ispell yapfify xterm-color smeargle shell-pop reveal-in-osx-finder pyvenv pytest pyenv-mode py-isort pip-requirements pbcopy pangu-spacing osx-trash osx-dictionary multi-term live-py-mode launchctl hy-mode helm-pydoc helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe fringe-helper git-gutter flyspell-correct flycheck-pos-tip find-by-pinyin-dired with-editor eshell-z eshell-prompt-extras esh-help diff-hl cython-mode web-completion-data company-tern dash-functional company-statistics company-anaconda chinese-pyim-basedict pos-tip auto-yasnippet auto-dictionary anaconda-mode pythonic ace-pinyin pinyinlib ace-jump-mode auto-complete tern web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ob-elixir livid-mode skewer-mode js2-refactor yasnippet multiple-cursors flycheck-mix alchemist company org flycheck elixir-mode web-beautify simple-httpd json-mode json-snatcher json-reformat js2-mode js-doc coffee-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text mmm-mode minitest markdown-toc markdown-mode macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio gh-md flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode chruby bundler inf-ruby bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))))
  (custom-set-faces
   )
  )
