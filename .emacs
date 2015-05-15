;;; NOTE - this version lacks the file backup stuff (PHASE 10) - recover from windows.emacs

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE -1: %b " ))

(setq stack-trace-on-error t)

(defvar init-file-version "2010.11.4")

;;; skip copyrights and warranties
(put 'eval-expression 'disabled nil)	;; want this if startup fails
(setq inhibit-startup-message t)



(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 0: %b " ))

;;;
;;; Various globals to suit self
;;;
(setq default-ctl-arrow t)		;; Print control characters like
					;; this: ^L
(setq visible-bell t)			;; Flash the screen, don't beep.
(if (and (string-equal window-system "x")
     (fboundp 'x-set-bell)		;; Visible bell in X, too
	 (or (null (getenv "TERM"))
	     (string-equal (getenv "TERM") "xterm")))
    (x-set-bell t))


(setq require-final-newline nil)	;; Make PHP happier by not doing
					;; trailing newlines.
;(setq default-major-mode 'text-mode)	;; If you're not editing some other
					;; kind of thing, you're editing text.
(setq auto-save-interval 50)
(setq backup-by-copying-when-linked t)

(setq default-case-fold-search t)

(setq delete-auto-save-files nil)

;;; set up personal load

(setq exec-path
      (append exec-path (list "/home/spreece/Emacs" "/usr/ccs/bin" "/usr/tools/local/bin" "/usr/tools/remote/bin")))

;; The path of old load-paths.  To load a shadowed definition, pop the 
;; stack into load-path.
;(defvar load-path-stack (list load-path))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 1: %b " ))

;; Add special places to load-path
(add-to-list 'load-path "~/Emacs")
;;(require 'php-mode)
;;
;;    (setq php-mode-hook
;;	  '(lambda ()
;;	     (define-key php-mode-map "\e{" 'php-beginning-of-defun)
;;	     (define-key php-mode-map "\e}" 'php-end-of-defun)
;;	     (define-key php-mode-map "\e(" 'php-beginning-of-defun)
;;	     (define-key php-mode-map "\e)" 'php-end-of-defun)
;;	     ))

; NOTE the gnus directories are removed; this means motgnus.el must
; be in a place that *is* on the list, like ~/emacs

;;; LOAD PATH SETTING REMOVED FOR WINDOWS VERSION

;;; MAIL, NOTES, ETC AUTOLOADS REMOVED

(if nil (progn
	  (if (not (string-lessp emacs-version "19"))
	      (progn
		(autoload 'sgml-mode  "sgml-mode" "SGML Editing Mode" t)
		)
	    )
	  ))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 2: %b " ))

;;
;; like mlisp auto-execute
(defun fix-auto-mode-alist (pattern mode)
  (setq auto-mode-alist (cons (cons pattern mode) auto-mode-alist)))

(fix-auto-mode-alist "\\.js" 'java-mode)

;;; load custom stuff

(load "format")

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 3: %b " ))

(setq ps-printer-name "\\\\chp-fps1\\bubbles")

;(setq lpr-command "lpr")
;(setq lpr-switches '("-dhppsB"))

;;
;; turn on cbreak and flow control (wish we didn't have to do this!)
(if (not (string-lessp emacs-version "19"))
    (set-input-mode nil t t)
  (set-input-mode nil t))

;; Turn off flow control...
(enable-flow-control -1)

;;; Mode hook functions

(setq find-file-hooks (cons '(lambda () (abbrev-mode 1)) find-file-hooks))

(defun html-convert-to-comment ()
  "Decorate a chunk of text as an HTML comment"
  (interactive)
  (let ((line-end nil))
    (beginning-of-line)
    (insert "<!--	")
    (end-of-line)
    (insert "	-->")
    (setq line-end (point))
    (beginning-of-line)
    (narrow-to-region (point) line-end)
    (fill-paragraph nil)
    (insert "	")
    (replace-regexp "^" "		")
    (if (looking-at "$")
	(delete-backward-char 2))
    (widen)
))

(defun html-insert-comment ()
  "Insert the syntax for a comment, leaving point inside it"
  (interactive)
  (insert "<!--		-->")
  (backward-char 4))

(defun html-insert-break ()
  "Insert the syntax for a break, leaving point after it"
  (interactive)
  (insert "<br>"))

(defun html-insert-rule ()
  "Insert the syntax for a horizontal rule, leaving point after it"
  (interactive)
  (insert "<hr>"))

(defun html-insert-cell ()
  "Insert the syntax for a data cell, leaving point after it"
  (interactive)
  (insert "<td>"))

(defun html-insert-table ()
  "Construct the framework for a table"
  (interactive)
  (insert "<table border>") (newline)
  (insert "<caption></caption>") (newline)
  (let ((rows 0)
	(columns 0)
	(headerRows 0)
	(r 0)
	(c 0))
    (setq columns (read-from-minibuffer "Columns:"))
    (setq headerRows (read-from-minibuffer "Header rows:"))
    (setq rows (read-from-minibuffer "Data rows:"))

					; insert rows for column headers
    (setq r (string-to-int headerRows))
    (while (> r 0)
      (insert "<tr>")
      (progn 
       (setq c (string-to-int columns))
       (while (> c 0)
	 (progn (insert "<th>")
	       (setq c (- c 1))))
       (newline)
       (setq r (- r 1))))

					; insert data rows
    (setq r (string-to-int rows))
    (while (> r 0)
      (insert "<tr>")
      (progn 
       (setq c (string-to-int columns))
       (while (> c 0)
	 (progn (insert "<td>")
	       (setq c (- c 1))))
       (newline)
       (setq r (- r 1))))

    (setq c (string-to-int columns))
    (insert "<!--	Row template: <tr>")
    (while (> c 0)
      (progn (insert "<td>")
	     (setq c (- c 1))))
    (newline)
    (insert "	-->")
    )
  (newline)
  (insert "</table>") (newline)
)

(defun html-add-row ()
  (interactive)
  (let ((start (point)))
    (if (re-search-forward "</table\\|Row template: \\|<table" nil t)
	(if (looking-at "<")
	    (let ((tmplt-start (point))
		  (tmplt ""))
	      (end-of-line)
	      (setq tmplt (buffer-substring tmplt-start (point)))
	      (goto-char start)
	      (insert tmplt)
	      (newline)
	      )))
    ))

(setq hm--html-user-config-file "~/emacs/hm--html-config.el")

(setq html-mode-hook
      '(lambda()
	 (define-key html-mode-map "\^c!" 'html-insert-comment)
	 (define-key html-mode-map "\^c?" 'html-convert-to-comment)
	 (define-key html-mode-map "\^c-" 'html-insert-rule)
	 (define-key html-mode-map "\^c[" 'html-insert-table)
	 (define-key html-mode-map "\^c/" 'html-insert-break)
	 (define-key html-mode-map "\^c|" 'html-insert-cell)
	 (define-key html-mode-map "\^c_" 'html-add-row)
	 (turn-on-auto-fill)
	 (set-fill-column 72)
	 (if (not (string-lessp emacs-version "19"))
	     (font-lock-mode)))
)

 (setq html-helper-htmldtd-version
        "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n")

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 4: %b " ))

(if (not (string-lessp emacs-version "19"))
    (progn
      (setq skeleton-pair t)
      (global-set-key "(" 'skeleton-pair-insert-maybe)
      (global-set-key "[" 'skeleton-pair-insert-maybe)
      (global-set-key "{" 'skeleton-pair-insert-maybe)

      (setq sgml-mode-hook
	    '(lambda()
	       (font-lock-mode)))

      (setq java-mode-hook
	    '(lambda ()
	       (setq indent-tabs-mode nil)
	       ))

      (setq c++-mode-hook
	    '(lambda()
	       (font-lock-mode)
	       (setq c-strict-syntax-p t)
	       (setq c-tab-always-indent nil)
	       (setq c-comment-only-line-offset 0)
	       (setq c-block-comments-indent-p 3)
	       (setq c-cleanup-list '(scope-operator defun-close-semi list-close-comma empty-defun-breaces))
	       (setq c-backslash-column 72)
	       (setq c-basic-offset 8)
	       (c-toggle-auto-newline 1)
	       (c-set-offset 'statement-block-intro '+ t)
	       (c-set-offset 'substatement-open '0 t)
	       (c-set-offset 'label '0 t)
	       (c-set-offset 'statement-cont '+ t)
	       (c-set-offset 'statement-case-open '+)
	       (c-set-offset 'arglist-intro 'c-lineup-arglist-intro-after-paren)
	       (c-set-offset 'arglist-close 'c-lineup-arglist)
	       ))

      (setq c-mode-hook
	    '(lambda()
	       (font-lock-mode)
	       (setq c-strict-syntax-p t)
	       (setq c-tab-always-indent nil)
	       (setq c-comment-only-line-offset 0)
	       (setq c-block-comments-indent-p 3)
	       (setq c-cleanup-list '(scope-operator defun-close-semi list-close-comma empty-defun-breaces))
	       (setq c-backslash-column 72)
	       (setq c-basic-offset 8)
	       (c-toggle-auto-newline 1)
	       (c-set-offset 'statement-block-intro '+ t)
	       (c-set-offset 'substatement-open '0 t)
	       (c-set-offset 'label '0 t)
	       (c-set-offset 'statement-cont '+ t)
	       (c-set-offset 'statement-case-open '+)
	       (c-set-offset 'arglist-intro 'c-lineup-arglist-intro-after-paren)
	       (c-set-offset 'arglist-close 'c-lineup-arglist)
	       ))
      )
  (progn
    (setq c++-mode-hook
	  '(lambda()
					;	 (load "c-mode")
	     (setq compile-command "ksh PATH=/usr/ccs/bin:$PATH make -k")
	     (define-key c++-mode-map "\e\^i" 'c++-indent-line)
	     (define-key c++-mode-map "\t" 'tab-to-tab-stop)
	     (define-key c++-mode-map "(" 'insert-parentheses)
	     (define-key c++-mode-map "[" 'insert-brackets)
	     (define-key c++-mode-map "{" 'insert-c++-braces)
	     (define-key c++-mode-map "\e{" 'beginning-of-defun)
	     (define-key c++-mode-map "\e}" 'end-of-defun)
	     (fset 'calculate-c++-indent (symbol-function 'my-calculate-c++-indent))
	     (fset 'electric-c++-terminator (symbol-function 'my-electric-c++-terminator))
	     (setq comment-prefix " * ")
	     (setq comment-multi-line t)
	     (setq c-argdecl-indent 8)
	     (setq c-indent-level 8)
	     (setq c-label-offset -8)
	     (setq c-continued-statement-offset 8)
	     (setq c-brace-offset -8)
	     (setq c-comment-to-buffer-fun 'pop-to-buffer)
	     (setq c-comment-terse-p t)
;	     (setq cscope-bindings-2deep t);; cscope.el
;	     (cscope-bind-keys);; cscope.el
	     (local-set-key "\^c;" 'c-comment-edit-plus)))

    (setq c-mode-hook
	  '(lambda()
	     (setq compile-command "ksh PATH=/usr/ccs/bin:$PATH make -k")
	     (define-key c-mode-map "\e\^i" 'Xc-indent-line)
	     (define-key c-mode-map "\t" 'tab-to-tab-stop)
	     (define-key c-mode-map "(" 'insert-parentheses)
	     (define-key c-mode-map "[" 'insert-brackets)
	     (define-key c-mode-map "{" 'insert-braces)
	     (define-key c-mode-map "\e{" 'beginning-of-defun)
	     (define-key c-mode-map "\e}" 'end-of-defun)
	     (setq comment-prefix " * ")
	     (setq comment-multi-line t)
	     (setq c-argdecl-indent 8)
	     (setq c-indent-level 8)
	     (setq c-auto-newline t)
	     (setq c-continued-statement-offset 8)
	     (setq c-brace-offset -8)
					;	 (require 'c-comment-edit "c-comment")
	     (setq c-comment-to-buffer-fun 'pop-to-buffer)
	     (setq c-comment-terse-p t)
	     (local-set-key "\^c;" 'c-comment-edit-plus)
;	     (setq cscope-bindings-2deep t);; cscope.el
;	     (cscope-bind-keys);; cscope.el
	     (save-excursion
	       (if
		   (re-search-forward "class\\|template\|private\\|::" nil t)
		   (c++-mode)))))

    (defun c-comment-edit-plus ()
      (interactive)
      (if (within-c-comment-p)
	  (c-comment-edit nil)
	(insert "/* */")
	(backward-char 3)
	(c-comment-edit nil)))
    ))


(setq lisp-mode-hook
      '(lambda()
	 (if (not (string-lessp emacs-version "19"))
	     (font-lock-mode))
	 (setq comment-indent-hook 'my-lisp-comment-indent)
	 (setq comment-multi-line t)
	 (define-key lisp-mode-map "\ej" 'lisp-indent-definition)
	 (define-key lisp-mode-map "\e(" 'backward-sexp)
	 (define-key lisp-mode-map "\e)" 'forward-sexp)
	 (define-key lisp-mode-map "(" 'insert-parentheses)
	 (define-key lisp-mode-map "\t" 'tab-to-tab-stop)
	 (define-key lisp-mode-map "\e\^i" 'lisp-indent-line)))

(setq emacs-lisp-mode-hook
      '(lambda()
	 (if (not (string-lessp emacs-version "19"))
	     (font-lock-mode))
	 (setq comment-indent-hook 'my-lisp-comment-indent)
	 (setq comment-multi-line t)
	 (define-key emacs-lisp-mode-map "\ej" 'lisp-indent-definition)
	 (define-key emacs-lisp-mode-map "\e(" 'backward-sexp)
	 (define-key emacs-lisp-mode-map "\e)" 'forward-sexp)
	 (define-key emacs-lisp-mode-map "(" 'insert-parentheses)
	 (define-key emacs-lisp-mode-map "\t" 'tab-to-tab-stop)
	 (define-key emacs-lisp-mode-map "\e\^i" 'lisp-indent-line)))

(defvar my-shell-pwd-regexp "^PWD=.*$")

(defun my-shell-cd-check (string)
  "check for canonical appearance of current-directory string in STRING
 and use to set default-directory for buffer"
  (if (string-match my-shell-pwd-regexp string)
      (let ((new-dir (substring string 4 (- (match-end 0) 1))))
	(setq shell-last-dir default-directory)
	(setq default-directory (concat new-dir "/"))))
  )

(setq shell-mode-hook
      '(lambda ()
	 (define-key shell-mode-map "\^J" 'shell-send-input)
	 (if (not (string-lessp emacs-version "19"))
	     (progn
	       (setq comint-output-filter-functions (append comint-output-filter-functions (list 'my-shell-cd-check)))
	       (setq comint-password-prompt-regexp-orig comint-password-prompt-regexp)
	       (setq shell-dirtrackp nil))
	   ; for older emacs, deal with the PWD= string we now use to
	   ; mark the dirs output line for comint directory tracking
	   (defun shell-send-input ()
	     "Send input to subshell.
At end of buffer, sends all text after last output
 as input to the subshell, including a newline inserted at the end.
Not at end, copies current line to the end of the buffer and sends it,
after first attempting to discard any prompt at the beginning of the line
by matching the regexp that is the value of shell-prompt-pattern if possible.
This regexp should start with \"^\"."
	     (interactive)
	     (end-of-line)
	     (if (eobp)
		 (progn
		   (move-marker last-input-start
				(process-mark (get-buffer-process (current-buffer))))
		   (insert ?\n)
		   (move-marker last-input-end (point)))
	       (beginning-of-line)
	       (re-search-forward shell-prompt-pattern nil t)
	       (let ((copy (buffer-substring (point)
					     (progn (forward-line 1) (point)))))
		 (goto-char (point-max))
		 (move-marker last-input-start (point))
		 (insert copy)
		 (move-marker last-input-end (point))))
	     (let ((directory-change-possible
		    (save-excursion
		      (progn
			(goto-char last-input-start)
			(or (looking-at-command shell-popd-regexp)
			    (looking-at-command shell-pushd-regexp)
			    (looking-at-command shell-cd-regexp))))))
	       ;; Now send the command to the shell.  If a directory change is
	       ;; possible, wait for a reply.
	       (let ((process (get-buffer-process (current-buffer))))
		 (send-region process last-input-start last-input-end)
		 (set-marker (process-mark process) (point))
		 (if directory-change-possible
		     (accept-process-output process)))

	       ;; If we might have changed the directory, parse the shell's answer.
	       (if directory-change-possible
		   (let ((shell-answer
			  (save-excursion
			    (buffer-substring last-input-end
					      (progn
						(goto-char last-input-end)
						(skip-chars-forward "^\n")
						(point))))))
		     (if (string-match "PWD=" shell-answer)
			 (setq shell-answer (substring shell-answer 4)))
		     ;; Test to see whether we've been given a directory list or
		     ;; an error message.  Determined by whether there's a trailing
		     ;; blank on the line.  If no error, set up the
		     ;; shell-directory-stack.
		     (cond ((not (shell-bad-chdir shell-answer))
			    (setq shell-directory-stack
				  (parse-and-expand-directories shell-answer))
			    (cd (car shell-directory-stack))
			    (setq shell-directory-stack
				  (cdr shell-directory-stack))))))))
	   )
	 (setq mode-line-format
	       (list "%b" 'default-directory " %M %3p %[(%m: %s)%]%"))))

(setq text-mode-hook
      '(lambda () (turn-on-auto-fill)
	 (define-key text-mode-map "\es" 'my-search-forward)
	 (define-key text-mode-map "\eS" 'shell)
	 (define-key text-mode-map "\e("    'backward-paragraph)
	 (define-key text-mode-mad "\e)"    'forward-paragraph)
	 (set-fill-column 72)))

(setq nroff-mode-hook '(lambda ()
  			 (setq nroff-brace-table (cons (cons ".(N" ".)N") nroff-brace-table))
  			 (setq nroff-brace-table (cons (cons ".GI" ".EG") nroff-brace-table))
  			 (setq nroff-brace-table (cons (cons ".VL" ".LE") nroff-brace-table))
  			 (setq nroff-brace-table (cons (cons ".DL" ".LE") nroff-brace-table))
  			 (setq nroff-brace-table (cons (cons ".BL" ".LE") nroff-brace-table))
  			 (setq nroff-brace-table (cons (cons ".P{" ".P}") nroff-brace-table))
			 (define-key nroff-mode-map "\es" 'my-search-forward)
			 (define-key nroff-mode-map "\ej" 'fill-paragraph)
			 (define-key nroff-mode-map "\eS" 'shell)
			 (electric-nroff-mode 1)))	 

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 5: %b " ))


(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 6: %b " ))

(defun my-sc-overload-hook-func ()
  (require 'sc-oloads)
  (sc-overload-functions))

(setq sc-load-hook
      '(lambda ()
;	 (setq sc-auto-fill-region-p t)
	 (setq sc-fixup-whitespace-p t)
	 (setq sc-confirm-always-p nil)
	 (setq sc-nested-citation-p t)))

;;; I don't like lisp-mode's comment treatment

(defun my-lisp-comment-indent ()
  (if (looking-at ";;;")
      (progn
	(setq comment-prefix ";;; ")
	(current-column))
    (if (looking-at ";;")
	(let ((tem (calculate-lisp-indent)))
	  (setq comment-prefix ";; ")
	  (if (listp tem) (car tem) tem))
      (progn
	(setq comment-prefix "; ")
	(skip-chars-backward " \t"))
      (max (if (bolp) 0 (1+ (current-column)))
	   comment-column))))

(defun lisp-indent-definition ()
  (interactive)
  (save-excursion
    (beginning-of-defun)
    (indent-sexp)))

(setq shell-prompt-pattern "^.*:")
(setq comint-prompt-regexp shell-prompt-pattern)
(setq shell-pushd-regexp "pd")
(setq shell-cd-regexp "\\(cd\\|C\\|\\.\\.\\|bk\\|back\\|cdi\\|pd\\|dirs\\|pwd\\|popd\\)")

;;;

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 7: %b " ))

;;;
;;; key bindings
;;;
;(global-set-key [(return)]            'newline-and-indent)
(global-set-key "\e\177" 'mark-paragraph)
(global-set-key "\e!" 'line-to-top-of-window)
(global-set-key "\eh" 'backward-kill-word)
(global-set-key "\em" 'xrmail-mail)
(global-set-key "\eM" 'tmail)
(global-set-key "\eS" 'shell)
(global-set-key "\en" 'normal-mode)
(global-set-key "\et" 'text-mode)
(global-set-key "\ep" 'ps-print-buffer)
(global-set-key "\e\^l" 'recenter)
(global-set-key "\e\^y" 'insert-buffer)
(global-set-key "\^l" 'redraw-display)
;(global-set-key "\^xv" 'view-mode)
(global-set-key "\^x\^u" 'undo)
(global-set-key "\^x\^y" 'upcase-region)
;(global-set-key "\^x!" 'shell-command)
(global-set-key "\e<" '(lambda () (interactive)(goto-char (point-min))))
(global-set-key "\e>" '(lambda () (interactive)(goto-char (point-max))))

;;;
;;; gosling-as-modified bindings
;;;
(global-set-key "\^h" 'delete-backward-char)

;(global-set-key "\ep" 'suspend-emacs)

(global-set-key "\es" 'my-search-forward)
(global-set-key "\^s" 'my-search-forward)	;only for non-flow-control
;(global-set-key "/" 'my-search-forward)	;only for non-dt80
(global-set-key "\^_" 'my-search-forward)
(global-set-key "\^r" 'my-search-backward)
(global-set-key "\e/" 'repeat-last-search)
(global-set-key "\^xq" 'quoted-insert)
(global-set-key "\^xc" 'copy-region-as-kill)
;;;
;;; from gosling.el
;;;
(global-set-key "\^x\^e" 'compile)
(global-set-key "\^x\^f" 'save-buffers-kill-emacs)
(global-set-key "\^xm" 'unipress-save-modified-files)
(global-set-key "\^x\^i" 'insert-file)
(global-set-key "\^x\^n" 'next-error)
(global-set-key "\^x\^o" 'switch-to-buffer)
(global-set-key "\^x\^r" 'insert-file)
(global-set-key "\^x\^u" 'advertised-undo)
(global-set-key "\^x\^v" 'find-file-other-window)
(global-set-key "\^xv" 'find-file)
(global-set-key "\^xV" 'find-file-at-point)
(global-set-key "\^x\^z" 'shrink-window)
;(global-set-key "\^x!"   'shell-command)
(global-set-key "\^xd"   'delete-window)
(global-set-key "\^xn"   'unipress-next-window)
(global-set-key "\^xp"   'unipress-previous-window)
(global-set-key "\^xz"   'enlarge-window)
;(global-set-key "\^z"    'scroll-one-line-up)
(global-set-key "\^x\^c"  'save-buffers-kill-emacs)
(global-set-key "\e!"    'line-to-top-of-window)
(global-set-key "\e("    'backward-sexp)
(global-set-key "\e)"    'forward-sexp)
(global-set-key "\e?"    'apropos)
(global-set-key "\eh"    'backward-kill-word)
;(global-set-key "\ej"    'indent-sexp)
(global-set-key "\eq"    'query-replace-regexp)
(global-set-key "\er"    'replace-regexp)
(global-set-key "\ez"    'scroll-one-line-down)
(global-set-key "\e."	 'goto-line)
(global-set-key "\^xt"   'find-tag-other-window)
(global-set-key "\^x<"   'delete-whitespace-backward)
(global-set-key "\^x>"   'delete-whitespace-forward)
(global-set-key "\^x?"   'delete-whitespace)
(global-set-key "\^x,"   'skip-whitespace-backward)
(global-set-key "\^x."   'skip-whitespace)
;(global-set-key "\^_"    'suspend-emacs))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 8: %b " ))

(defun unipress-previous-window ()
  (interactive)
  (select-window (previous-window)))

(defun unipress-next-window ()
  (interactive)
  (select-window (next-window)))

(defun scroll-one-line-up ()
  (interactive)
  (scroll-up 1))

(defun scroll-one-line-down ()
  (interactive)
  (scroll-down 1))

(defun line-to-top-of-window ()
  (interactive)
  (recenter 0))

(defun unipress-save-modified-files ()
  (interactive)
  (save-some-buffers 0))

(defvar search-last-regexp ""
  "last regexp arg to  my search functions")
(defvar last-search-forward 1
  "t if last search was forward, else nil")

(defun preceding-nonwhitespace-char ()
  (save-excursion
    (skip-chars-backward " 	\n")
    (preceding-char)))

(defun skip-whitespace ()
  (interactive)
  (skip-chars-forward " 	\n"))

(defun skip-whitespace-backward ()
  (interactive)
  (skip-chars-backward " 	\n"))

(defun delete-whitespace-forward ()
  "Delete whitespace up to next non-whitespace character"
  (interactive)
  (while (or (= (following-char) ? )
	     (= (following-char) ?	)
	     (= (following-char) ?\n))
    (delete-char 1)))

(defun delete-whitespace-backward ()
  "Delete whitespace back to previous non-whitespace character"
  (interactive)
  (while (or (= (preceding-char) ? )
	     (= (preceding-char) ?	)
	     (= (preceding-char) ?\n))
    (backward-delete-char 1)))

(defun delete-whitespace ()
  "Delete whitespace around point out to next non-whitespace characters"
  (interactive)
  (delete-whitespace-forward)
  (delete-whitespace-backward))

(defun my-search-forward (&optional regexp)
  "Re-search-forward, remembering target for next time"
  (interactive "sTarget: ")
  (setq last-search-forward t)
  (if (string-equal regexp "")
      (re-search-forward search-last-regexp)
    (progn
      (setq search-last-regexp regexp)
      (re-search-forward regexp))))

(defun my-search-backward (&optional regexp)
  "Re-search backward, remembering arg for next time"
  (interactive "sTarget: ")
  (setq last-search-forward nil)
  (if (string-equal regexp "")
      (re-search-backward search-last-regexp)
    (progn
      (setq search-last-regexp regexp)
      (re-search-backward regexp))))

(defun repeat-last-search ()
  "Repeat last my-search-forward or my-search-backward"
  (interactive)
  (if last-search-forward
      (re-search-forward search-last-regexp)
    (re-search-backward search-last-regexp)))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 9: %b " ))

(defvar comment-prefix nil
  "Prefix for non-initial lines of multi-line comments")

(defun beginning-of-comment ()
  (and comment-start
       (or
	(let ((opoint (point))
	      linestart)
	  (forward-line -1)
	  (beginning-of-line)
	  (setq linestart (point))
	  (goto-char opoint)
	  (search-backward comment-prefix linestart t))
	(let ((opoint (point)))
	  (forward-line -1)
	  (re-search-forward comment-start-skip opoint t)) )) )

(defun Xindent-new-comment-line ()
  "Break line at point and indent, continuing comment if presently within one."
  (interactive "*")
  (let (comcol comstart)
    (skip-chars-backward " \t")
    (insert ?\n)
    (delete-region (point)
		   (progn (skip-chars-forward " \t")
			  (point)))
    (save-excursion
      (if (beginning-of-comment)
	  (progn
	    (goto-char (match-beginning 0))
	    (setq comcol (current-column))
	    (setq comstart (buffer-substring (point) (match-end 0))))))
    (if comcol
	(let ((comment-column comcol)
	      (comment-start comstart)
	      (comment-end comment-end))
	  (and comment-end (not (equal comment-end ""))
	       (if (not comment-multi-line)
		   (progn
		     (forward-char -1)
		     (insert comment-end)
		     (forward-char 1))
		 (setq comment-column (+ comment-column
					 (if comment-prefix 0
					   (length comment-prefix)))
		       comment-start "")))
	  (if (not (eolp))
	      (setq comment-end ""))
	  (insert ?\n)
	  (forward-char -1)
	  (indent-for-comment)
	  (if comment-multi-line
	      (if comment-prefix
		  (insert comment-prefix)))
	  (delete-char 1))
      (if fill-prefix
	  (insert fill-prefix)
	(indent-according-to-mode)))))

(defun Xc-indent-line ()
  "Indent the current line properly"
  (interactive)
  (c-indent-line))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 10: %b " ))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 11: %b " ))

	;;; This version of sort-columns actually does take its
	;;; beginning and ending from the point and mark and does
	;;; allow them to be optional, as indicated

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 12: %b " ))


(put 'downcase-region 'disabled t)	;; It's very annoying to do this 

(if (string-lessp emacs-version "19")
    (setq command-switch-alist
	  (append '(("-crb" . x-ignore-arg)
		    ("-iconic" . ignore)
		    ("-cursor" . x-ignore-arg)
		    ("-cursormask" . x-ignore-arg)
		    ("-icongeometry" . x-ignore-arg))
		  command-switch-alist)))

(setq Man-filter-list
      '(("sed "
	 ("-e ': start\ns/^\\n$//\n/^$/{\nN\nbstart\n}\n/\\n/{\nP\nD\n}'"
	  "-e '/[Nn]o such file or directory/d'"
	  "-e '/Reformatting page.  Wait... done/d'"
	  "-e '/^\\([A-Z][A-Z.]*([0-9A-Za-z][-0-9A-Za-z+]*)\\).*\\1$/d'"
	  "-e '/^[ \\t]*Hewlett-Packard Company[ \\t]*- [0-9]* -.*$/d'"
	  "-e '/^[ \\t]*Hewlett-Packard[ \\t]*- [0-9]* -.*$/d'"
	  "-e '/^ *Page [0-9]*.*(printed [0-9\\/]*)$/d'"
	  "-e '/^Printed [0-9].*[0-9]$/d'"
	  "-e '/^[ \\t]*X Version 1[01].*Release [0-9]/d'"
	  "-e '/^[A-za-z].*Last change:/d'"
	  "-e '/^Sun Release [0-9].*[0-9]$/d'"
	  ))))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 13: %b " ))


(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 14: %b " ))

(if (file-exists-p (concat (getenv "HOME") "/.emacs.local"))
		   (load (concat (getenv "HOME") "/.emacs.local")))

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 15: %b " ))

;(server-start)

(set-default 'mode-line-buffer-identification '( "STARTUP-FAILED PHASE 16: %b " ))

(set-default 'mode-line-buffer-identification '( "Emacs: %b " ))

(setq default-mode-line-format
      '("%[" mode-line-buffer-identification " %*+%* %3p (%m) %f%] %-"))
;      '("" "%[%f %*+%* %3p (" mode-name minor-mode-alist ")%]" mode-line-process " " mode-line-buffer-identification "%-"))

;(setq exec-directory "/proj/svr4/r40v1/devel/preece/emacs-18.57/etc/")

(put 'narrow-to-region 'disabled nil)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-keyword-face ((((class color) ) (:foreground "magenta" :weight bold)))))

(global-font-lock-mode t)

(setq stack-trace-on-error nil)
(setq frame-title-format "%b - emacs")
