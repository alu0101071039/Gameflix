
;;;=====================================================================
;;;     Gameflix Videogame Suggestion Expert System
;;;
;;;     This expert system suggests what videogame should you play
;;;     depending on your answers
;;;
;;;     Version 1.0 (beta)
;;;
;;;     Johan Croix Plasencia Estrada
;;;     Airan Omar Villacorta Betancor
;;;
;;;     To execute, merely load, reset and run.
;;;
;;;
;;;     http://geekologie.com/2014/02/18/video-game-flowchart-small.jpg
;;;=====================================================================

;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction ask-question (?question $?allowed-values)
  (printout t ?question)
  (bind ?answer (read))
  (if (lexemep ?answer)
    then (bind ?answer (lowcase ?answer)))
  (while (not (member ?answer ?allowed-values)) do
    (printout t ?question)
    (bind ?answer (read))
    (if (lexemep ?answer)
      then (bind ?answer (lowcase ?answer))))
  ?answer)

(deffunction yes-or-no-p (?question)
  (bind ?response (ask-question ?question yes no y n))
  (if (or (eq ?response yes) (eq ?response y))
    then yes
    else no))


;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-game-difficulty ""
  (not (found-game ?))
  =>
  (assert (using-much-brain (yes-or-no-p "Do you want to avoid using much of your brain? (yes/no)? "))))

(defrule determine-reflexes ""
  (using-much-brain yes)
  (not (found-game ?))
  =>
  (assert (reflexes (yes-or-no-p "Do you have unreal reflexes ?(yes/no)? "))))

(defrule determine-drugs ""
  (reflexes yes)
  (not (found-game ?))
  =>
  (assert (drugs (yes-or-no-p "Are you on drugs? ?(yes/no)? "))))

(defrule determine-feel-like-you-are ""
  (drugs no)
  (not (found-game ?))
  =>
  (assert (feel-like-you-are (yes-or-no-p "Do you want to feel like you are?(yes/no)? "))))

(defrule determine-timing ""
  (feel-like-you-are no)
  (not (found-game ?))
  =>
  (assert (timing (yes-or-no-p "Do you have superb timing ?(yes/no)? "))))

(defrule determine-rock-out ""
  (timing yes)
  (not (found-game ?))
  =>
  (assert (rock-out (yes-or-no-p "Do you want to rock out?(yes/no)? "))))

(defrule determine-2-buttons ""
  (timing no)
  (not (found-game ?))
  =>
  (assert (2-buttons (yes-or-no-p "Are 2 buttons too many for you ?(yes/no)? "))))

(defrule determine-point-and-click ""
  (reflexes no)
  (not (found-game ?))
  =>
  (assert (point-and-click (yes-or-no-p "Do you want to point and click click click click...?(yes/no)? "))))

(defrule determine-play-straight-week ""
  (point-and-click yes)
  (not (found-game ?))
  =>
  (assert (play-straight-week (yes-or-no-p "Do you plan on playing for the next week straight? ?(yes/no)? "))))

(defrule determine-hardest-game-ever ""
  (point-and-click no)
  (not (found-game ?))
  =>
  (assert (hardest-game-ever (yes-or-no-p "Do you want the hardest game ever?(yes/no)? "))))

(defrule determine-maximum-creativity ""
  (using-much-brain no)
  (not (found-game ?))
  =>
  (assert (maximum-creativity (yes-or-no-p "Maximum creativity? (yes/no)? "))))

(defrule determine-solve-puzzles ""
  (maximum-creativity no)
  (not (found-game ?))
  =>
  (assert (solve-puzzles (yes-or-no-p "Do you want to solve some puzzles? (yes/no)? "))))

(defrule determine-need-storyline ""
  (solve-puzzles yes)
  (not (found-game ?))
  =>
  (assert (need-storyline (yes-or-no-p "Do you feel the need for a storyline as well? (yes/no)? "))))

(defrule determine-edward-fan ""
  (need-storyline yes)
  (not (found-game ?))
  =>
  (assert (edward-fan (yes-or-no-p "Are you an Edward Gorey fan? (yes/no)? "))))

(defrule determine-kick-oldschool ""
  (need-storyline no)
  (not (found-game ?))
  =>
  (assert (kick-oldschool (yes-or-no-p "Kick it oldschool? (yes/no)? "))))

             
;;;****************
;;;* GAME RULES *
;;;****************
   
(defrule maximum-creativity-conclussion ""
  (using-much-brain no)
  (maximum-creativity yes)
  (not (found-game ?))
  =>
  (assert (found-game "Minecraft.")))

(defrule drugs-conclussion ""
  (drugs yes)
  (not (found-game ?))
  =>
  (assert (found-game "REZ.")))

(defrule feel-like-you-are-conclussion ""
  (feel-like-you-are yes)
  (not (found-game ?))
  =>
  (assert (found-game "Geometry Wars 2.")))
 
(defrule rock-out-conclussion ""
  (rock-out yes)
  (not (found-game ?))
  =>
  (assert (found-game "Rockband 3.")))

(defrule not-rock-out-conclussion ""
  (rock-out no)
  (not (found-game ?))
  =>
  (assert (found-game "Ikaruga.")))

(defrule 2-buttons-conclussion ""
  (2-buttons yes)
  (not (found-game ?))
  =>
  (assert (found-game "Ms.Pac-Man 2.")))

(defrule not-2-buttons-conclussion ""
  (2-buttons no)
  (not (found-game ?))
  =>
  (assert (found-game "Punch-Out!.")))

(defrule hardest-game-ever-conclussion ""
  (hardest-game-ever yes)
  (not (found-game ?))
  =>
  (assert (found-game "Devil May Cry 3.")))

(defrule not-hardest-game-ever-conclussion ""
  (hardest-game-ever no)
  (not (found-game ?))
  =>
  (assert (found-game "MonkeyBall.")))
 
(defrule play-straight-week-conclussion ""
  (play-straight-week yes)
  (not (found-game ?))
  =>
  (assert (found-game "World of Warcraft.")))

(defrule not-play-straight-week-conclussion ""
  (play-straight-week no)
  (not (found-game ?))
  =>
  (assert (found-game "Diablo III.")))

(defrule edward-fan-conclussion ""
  (edward-fan yes)
  (not (found-game ?))
  =>
  (assert (found-game "LIMBO.")))
  
(defrule kick-oldschool-conclussion ""
  (kick-oldschool yes)
  (not (found-game ?))
  =>
  (assert (found-game "TETRIS.")))
   
(defrule not-kick-oldschool-conclussion ""
  (kick-oldschool no)
  (not (found-game ?))
  =>
  (assert (found-game "LUMINES.")))
  

;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "GAMEFLIX The Videogame Suggestion Expert System")
  (printout t crlf crlf))

(defrule print-game ""
  (declare (salience 10))
  (found-game ?item)
  =>
  (printout t crlf crlf)
  (printout t "Suggested game:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))