;; Enable mu4e
(require-package 'mu4e)
(require 'mu4e)

;; Create contexts for each account
;; TODO: match UFL on phys.ufl.edu too
(setq mu4e-contexts
      `( ,(make-mu4e-context
	   :name "UFL"
           :enter-func (lambda () (mu4e-message "Entering UFL context"))
           :leave-func (lambda () (mu4e-message "Leaving UFL context"))
           ;; we match based on the contact-fields of the message
	   :match-func (lambda (msg)
			 (when msg 
			   (mu4e-message-contact-field-matches msg 
							       :to "ragnese@ufl.edu")))
	   :vars '((user-mail-address      . "ragnese@ufl.edu")
		   (user-full-name         . "Rob Agnese")
		   (mu4e-maildir           . "~/mail/ufl")
		   (mu4e-sent-folder       . "/Sent Items")
		   (mu4e-drafts-folder     . "/Drafts")
		   (mu4e-trash-folder      . "/Deleted Items")
		   (mu4e-refile-folder     . "/Archives/2017")))
	 ,(make-mu4e-context
	   :name "Litmus"
	   :enter-func (lambda () (mu4e-message "Entering Litmus context"))
           :leave-func (lambda () (mu4e-message "Leaving Litmus context"))
	   ;; we match based on the contact-fields of the message
	   :match-func (lambda (msg)
			 (when msg 
			   (mu4e-message-contact-field-matches msg 
							       :to "rob@litmushealth.com")))
	  :vars '((user-mail-address       . "rob@litmushealth.com")
		  ( user-full-name         . "Rob Agnese")
		   (mu4e-maildir           . "~/mail/litmus")
		   (mu4e-sent-folder       . "/[Gmail]/Sent Mail")
		   (mu4e-drafts-folder     . "/[Gmail]/Drafts")
		   (mu4e-trash-folder      . "/[Gmail]/Trash")
		   (mu4e-refile-folder     . "/All Mail")))))

;; Update every 10 minutes
(setq mu4e-update-interval 600)

;; don't do a full cleanup check
;;(setq mu4e-index-cleanup nil)

;; don't consider up-to-date dirs
;;(setq mu4e-index-lazy-check t)

;; compose with the current context is no context matches;
;; default is to ask 
(setq mu4e-compose-context-policy nil)

