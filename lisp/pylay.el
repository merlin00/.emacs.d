(defvar w:run)
(defvar w:info)
(defvar w:ext)
(defvar b:run)


(defun py:reset-run-signal(process event)
  (kill-buffer "*Python*")
  (py:reset-run))


(defun py:reset-run()
   (run-python)
   (setq b:run (get-buffer "*Python*"))
   (set-window-buffer w:run b:run)
   (set-window-dedicated-p w:run t)
   (with-current-buffer b:run (toggle-truncate-lines t)))

;;;###autoload
(defun py:load-side-layout()
  (interactive)
  (py:unload-side-layout)
  (add-hook 'window-size-change-functions 'py:resize-side-layout)
  
  (setq w:run (split-window (selected-window) nil 'right))
  (setq w:ext (split-window w:run nil 'below))

  (setq w:delta (- 50 (window-width w:run)))
  (window-resize w:run w:delta t)

  (setq w:delta (round (- (* (frame-pixel-height) 0.55) (window-pixel-height w:run))))
  (window-resize w:run w:delta nil nil t)
    
  (setq w:info (split-window w:ext nil 'below))

  (setq b:run (get-buffer "*Python*"))
  (if b:run
      (progn
	(setq proc (get-buffer-process b:run))
	(if proc
	    (progn
	      (set-process-sentinel proc 'py:reset-run-signal)
	      (kill-process proc))
	  (py:reset-run)))
    (py:reset-run))

  (setq b:info (get-buffer "*Messages*"))
  ;;(with-current-buffer b:info (toggle-truncate-lines t))
  (set-window-buffer w:info b:info)

  (setq b:ext (get-buffer "*scratch*"))
  (with-current-buffer b:ext (toggle-truncate-lines t))
  (set-window-buffer w:ext b:ext))

;;;###autoload
(defun py:unload-side-layout()
  (interactive)
  (delete-other-windows)
  (remove-hook 'window-size-change-functions 'py:resize-side-layout))


(defun py:resize-side-layout(frame)
  (setq w:delta (- 50 (window-width w:run)))
  (window-resize w:run w:delta t))

(defalias 'load-python 'py:load-side-layout)

(provide 'pylay)
