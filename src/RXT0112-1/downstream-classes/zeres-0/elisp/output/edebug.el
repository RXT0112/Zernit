#!/bin/sh
":"; exec emacs --script "$0" "$@" # -*- mode: emacs-lisp; lexical-binding: t; -*-
;; Created by Jacob Hrbek identified with an electronic mail <kreyren@rixotstudio.cz> and GPG signature <0x765AED304211C28410D5C478FCBA0482B0AB9F10> under all rights reserved in 26/08/2020 11:11:38 CEST

(defvar edebug-format-string "DEBUG: %s\n" "Non-standard variable used to define a formatting string for non-standard `efixme' function defined by the zernit project")

;; FIXME: Implement logging levels that output based on value in variable 'emacs-debug'
(zn-defun edebug (level message)
"Non-standard function used to output in the buffer with logging support to annoy the end-user with fixme messages for code quality issues that might influence the runtime"

	(cond
		((= (lenght message ) 0)
			(princ (format die-format-string-bug (format "Function '%1$s' was used without specified message '%2$s'" function-name message))
			(append-to-file (format die-format-string-bug (format "Function '%1$s' was used without specified message '%2$s'" function-name message)) nil emacs-log-file) )
		((> (lenght message) 0)
			(princ (format edebug-format-string message)
			(append-to-file (format edebug-format-string message) nil emacs-log-file)) )
		(t
			(princ (format die-format-string-unexpected (format "Function '%1$s' with argument 'message' storing value '%2$s' triggered an unexpected trap which usually indicates insufficient programming logic" function-name message))
			(append-to-file (format die-format-string-unexpected (format "Function '%1$s' with argument 'message' storing value '%2$s' triggered an unexpected trap which usually indicates insufficient programming logic" function-name message)) nil emacs-log-file)
		)
	)
)
