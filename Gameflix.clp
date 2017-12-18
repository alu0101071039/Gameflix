
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

(defrule determine-crazy-japanese ""
(edward-fan no)
(not (found-game ?))
=>
(assert (crazy-japanese (yes-or-no-p "Looking for crazy Japanese awesomeness? (yes/no)? "))))

(defrule determine-shiny-textures ""
(crazy-japanese no)
(not (found-game ?))
=>
(assert (shiny-textures (yes-or-no-p "Do you want shiny textures? (yes/no)? "))))

(defrule determine-enjoy-simulations ""
(solve-puzzles no)
(not (found-game ?))
=>
(assert (enjoy-simulations (yes-or-no-p "Do you enjoy simulations? (yes/no)? "))))

(defrule determine-charge-life ""
(enjoy-simulations yes)
(not (found-game ?))
=>
(assert (charge-life (yes-or-no-p "Do you want to be in charge of a life? (yes/no)? "))))

(defrule determine-multiple-players ""
(enjoy-simulations no)
(not (found-game ?))
=>
(assert (multiple-players (yes-or-no-p "Do you have multiple local players? (yes/no)? "))))

(defrule determine-lose-yourself ""
(multiple-players no)
(not (found-game ?))
=>
(assert (lose-yourself (yes-or-no-p "Do you want to lose yourself in another world? (yes/no)? "))))

(defrule determine-yearn-level ""
(lose-yourself yes)
(not (found-game ?))
=>
(assert (yearn-level (yes-or-no-p "Do you yearn to level up your character? (yes/no)? "))))

;;; 1.n.7.n.9.n.10.y.11.n.12 Do you like to be terrified?
(defrule determine-like-terrified ""
(yearn-level no)
(not (found-game ?))
=>
(assert (like-terrified (yes-or-no-p "Do you like to be terrified? (yes/no)? "))))

(defrule determine-yourself-tactician ""
(yearn-level yes)
(not (found-game ?))
=>
(assert (yourself-tactician (yes-or-no-p "Do you fancy yourself a tactician? (yes/no)? "))))

(defrule determine-mobile ""
(yourself-tactician yes)
(not (found-game ?))
=>
(assert (mobile (yes-or-no-p "Mobile? (yes/no)? "))))

(defrule determine-made-japan ""
(yourself-tactician no)
(not (found-game ?))
=>
(assert (made-japan (yes-or-no-p "Do you want a game made in Japan? (yes/no)? "))))

(defrule determine-army-battles ""
(made-japan yes)
(not (found-game ?))
=>
(assert (army-battles (yes-or-no-p "Do you want some large-scale army battles? (yes/no)? "))))

(defrule determine-use-lightsaber ""
(made-japan no)
(not (found-game ?))
=>
(assert (use-lightsaber (yes-or-no-p "Are you cool without getting to use a lightsaber? (yes/no)? "))))

(defrule determine-button-mashable ""
(multiple-players yes)
(not (found-game ?))
=>
(assert (button-mashable (yes-or-no-p "Button mashable? (yes/no)? "))))

(defrule determine-realistic-violence ""
(button-mashable yes)
(not (found-game ?))
=>
(assert (realistic-violence (yes-or-no-p "Does realistic violence upset you? (yes/no)? "))))

(defrule determine-like-weapons ""
(realistic-violence no)
(not (found-game ?))
=>
(assert (like-weapons (yes-or-no-p "Do you like big-ass weapons? (yes/no)? "))))

(defrule determine-opponent-spine ""
(like-weapons no)
(not (found-game ?))
=>
(assert (opponent-spine (yes-or-no-p "Do you want to tear out your opponent's spine? (yes/no)? "))))

(defrule determine-official-team ""
(button-mashable no)
(not (found-game ?))
=>
(assert (official-team (yes-or-no-p "Do you own any official team jerseys? (yes/no)? "))))

(defrule determine-sound-squealing ""
(official-team no)
(not (found-game ?))
=>
(assert (sound-squealing (yes-or-no-p "Does the sound of squealing tires excite you? (yes/no)? "))))

(defrule determine-wrestling-stupid ""
(sound-squealing no)
(not (found-game ?))
=>
(assert (wrestling-stupid (yes-or-no-p "Do you think professional wrestling is stupid? (yes/no)? "))))

(defrule determine-skate ""
(wrestling-stupid yes)
(not (found-game ?))
=>
(assert (skate (yes-or-no-p "Skate? (yes/no)? "))))

(defrule determine-racing-games ""
(sound-squealing yes)
(not (found-game ?))
=>
(assert (racing-games (yes-or-no-p "Should racing games be based in reality? (yes/no)? "))))

(defrule determine-super-speed ""
(racing-games no)
(not (found-game ?))
=>
(assert (super-speed (yes-or-no-p "Super speed? (yes/no)? "))))

(defrule determine-want-badass ""
(racing-games yes)
(not (found-game ?))
=>
(assert (want-badass (yes-or-no-p "You want to be a badass? (yes/no)? "))))

(defrule determine-rally ""
(want-badass no)
(not (found-game ?))
=>
(assert (rally (yes-or-no-p "Rally? (yes/no)? "))))

(defrule determine-adventure-enough-for-you ""
(like-terrified no)
(not (found-game ?))
=>
(assert (adventure-enough-for-you (yes-or-no-p "Is adventure enough for you? (yes/no? "))))

(defrule determine-want-best-acting-and-plot ""
(adventure-enough-for-you yes)
(not (found-game ?))
=>
(assert (want-best-acting-and-plot (yes-or-no-p "Want some of the best acting and plot ever put into a game? (yes/no)? "))))

(defrule determine-more-childish ""
(want-best-acting-and-plot no)
(not (found-game ?))
=>
(assert (more-childish (yes-or-no-p "More childish? (yes/no)? "))))

(defrule determine-you-want-to-get-far-fetched ""
(more-childish yes)
(not (found-game ?))
=>
(assert (you-want-to-get-far-fetched (yes-or-no-p "Do you want to get far-fetched? (yes/no)? "))))

(defrule determine-want-litle-role-playing ""
(adventure-enough-for-you no)
(not (found-game ?))
=>
(assert (want-litle-role-playing (yes-or-no-p "Do you want a litle role playing with your action? (yes/no)? "))))

(defrule determine-have-fetish-disney-character ""
(want-litle-role-playing yes)
(not (found-game ?))
=>
(assert (have-fetish-disney-character (yes-or-no-p "Do you have a fetish for any Disney characters? (yes/no)? "))))

(defrule determine-what-about-outer-space ""
(have-fetish-disney-character no)
(not (found-game ?))
=>
(assert (what-about-outer-space (yes-or-no-p "What about outer space? (yes/no)? "))))

(defrule determine-feel-like-throwing-in-fps ""
(what-about-outer-space no)
(not (found-game ?))
=>
(assert (feel-like-throwing-in-fps (yes-or-no-p "Feel like throwing in some first person shooting? (yes/no)? "))))

(defrule determine-want-female-main-character ""
(want-litle-role-playing no)
(not (found-game ?))
=>
(assert (want-female-main-character (yes-or-no-p "Do you want a female main character? (yes/no)? "))))

(defrule determine-want-alien-conspiracy ""
(want-female-main-character yes)
(not (found-game ?))
=>
(assert (want-alien-conspiracy (yes-or-no-p "Want some of alien conspiracy? (yes/no)? "))))

(defrule determine-want-link ""
(want-female-main-character no)
(not (found-game ?))
=>
(assert (want-link (yes-or-no-p "Male then. What about Link? (yes/no)? "))))

(defrule determine-want-beautifully-crafted-jap-story ""
(want-link no)
(not (found-game ?))
=>
(assert (want-beautifully-crafted-jap-story (yes-or-no-p "Do you want a beautifully crafted Japanese story? (yes/no)? "))))

(defrule determine-open-world""
(want-beautifully-crafted-jap-story no)
(not (found-game ?))
=>
(assert (open-world (yes-or-no-p "Do you want open world? (yes/no)? "))))

(defrule determine-want-to-be-assassin ""
(open-world yes)
(not (found-game ?))
=>
(assert (want-to-be-assassin (yes-or-no-p "Do you want to be an assassin? (yes/no)? "))))

(defrule determine-stealth-rewarded ""
(open-world no)
(not (found-game ?))
=>
(assert (stealth-rewarded(yes-or-no-p "Do you want to be stealth rewarded? (yes/no)? "))))

(defrule determine-want-to-be-criminal ""
(want-to-be-assassin no)
(not (found-game ?))
=>
(assert (want-to-be-criminal (yes-or-no-p "Do you want to be a criminal? (yes/no)? "))))

(defrule determine-do-you-lean-towards-art""
(want-beautifully-crafted-jap-story yes)
(not (found-game ?))
=>
(assert (do-you-lean-towards-art (yes-or-no-p "Do you lean more towards the art? (yes/no)? "))))

(defrule determine-want-oldschool ""
(want-link yes)
(not (found-game ?))
=>
(assert (want-oldschool (yes-or-no-p "The legend of Zelda then. Oldschool? (yes/no)? "))))

(defrule determine-like-playing-with-wiimote ""
(want-oldschool no)
(not (found-game ?))
=>
(assert (want-playing-with-wiimote (yes-or-no-p "Do you like playing with the Wiimote? (yes/no)? "))))


(defrule determine-looking-for-real-time-battles ""
(largescale-army-battle no)
(not (found-game ?))
=>
(assert (looking-for-real-time-battles (yes-or-no-p "Looking for real time battles? (yes/no)? "))))

(defrule determine-capable-of-making-fun-of-yourself ""
(looking-for-real-time-battles no)
(not (found-game ?))
=>
(assert (capable-of-making-fun-of-yourself (yes-or-no-p "Are you capable of making fun of yourself? (yes/no)? "))))

(defrule determine-serious-dragon-fetish ""
(capable-of-making-fun-of-yourself no)
(not (found-game ?))
=>
(assert (serious-dragon-fetish (yes-or-no-p "Do you have a serious dragon fetish? (yes/no)? "))))

(defrule determine-greatest-game-of-all-time ""
(serious-dragon-fetish no)
(not (found-game ?))
=>
(assert (greatest-game-of-all-time (yes-or-no-p "Care to play possibly the greatest game of all time? (yes/no)? "))))

(defrule determine-active-battle-system ""
(greatest-game-of-all-time no)
(not (found-game ?))
=>
(assert (active-battle-system (yes-or-no-p "Maximum creativity? (yes/no)? "))))

(defrule determine-want-to-collect-weapons ""
(terrified yes)
(not (found-game ?))
=>
(assert (want-to-collect-weapons (yes-or-no-p "Want to collect weapons but be too afraid to use any ammo? (yes/no)? "))))

(defrule determine-want-to-be-confused-and-horrified ""
(want-to-collect-weapons no)
(not (found-game ?))
=>
(assert (want-to-be-confused-and-horrified (yes-or-no-p "Do you want to be confused and horrified the entire time? (yes/no)? "))))

(defrule determine-platforming ""
(feel-like-throwing-in-fps no)
(not (found-game ?))
=>
(assert (platforming (yes-or-no-p "How about some platforming? (yes/no)? "))))

(defrule determine-batman""
(stealth-rewarded yes)
(not (found-game ?))
=>
(assert (batman (yes-or-no-p "Are you Batman or do you want to be? (yes/no)? "))))

(defrule determine-keep-things-simple ""
(stealth-rewarded no)
(not (found-game ?))
=>
(assert (keep-things-simple (yes-or-no-p "Keep things simple? (yes/no)? "))))

(defrule determine-kill-gods""
(keep-things-simple   no)
(not (found-game ?))
=>
(assert (kill-gods (yes-or-no-p "Do you want to kill gods (or things decidedly godlike? (yes/no)? "))))

(defrule determine-brutal-carnage""
(kill-gods  yes)
(not (found-game ?))
=>
(assert (brutal-carnage (yes-or-no-p "Do you enjoy brutal gratuitious carnage? (yes/no)? "))))

(defrule determine-run-walls""
(kill-gods no)
(not (found-game ?))
=>
(assert (run-walls (yes-or-no-p "Do you want to run on walls? (yes/no)? "))))

(defrule determine-platforms ""
(lose-yourself no)
(not (found-game ?))
=>
(assert (platforms (yes-or-no-p "Do you want to jump to platforms? (yes/no)? ")))) 

(defrule determine-fps ""
(platforms no)
(not (found-game ?))
=>
(assert (fps (yes-or-no-p "Do you want a FPS? (yes/no)? ")))) 

(defrule determine-fps-single ""
(fps yes)
(not (found-game ?))
=>
(assert (fps-single (yes-or-no-p "Are you looking for a single player game? (yes/no)? ")))) 

(defrule determine-fps-single-mouse""
(fps-single  yes)
(not (found-game ?))
=>
(assert (fps-single-mouse (yes-or-no-p "Do yoy want to use a mouse as well? "))))

(defrule determine-fps-respawn""
(fps-single  no)
(not (found-game ?))
=>
(assert (fps-respawn (yes-or-no-p "Do you like games without a respawn? "))))

(defrule determine-fps-ridiculous""
(fps-respawn  no)
(not (found-game ?))
=>
(assert (fps-ridiculous (yes-or-no-p "Ridiculous non-stop action,rocket jumps, laser guns, etc.? "))))

(defrule determine-fps-team""
(fps-ridiculous  no)
(not (found-game ?))
=>
(assert (fps-team (yes-or-no-p "Heavy reliance on team-play and strategy? "))))

(defrule determine-fps-noob""
(fps-team  no)
(not (found-game ?))
=>
(assert (fps-noob (yes-or-no-p "Do you like being called a n00b by 8 year olds? "))))

(defrule determine-fps-zombies""
(fps-noob  no)
(not (found-game ?))
=>
(assert (fps-zombies (yes-or-no-p "Zombies? "))))

(defrule determine-shoot-people-while-jumping-platforms""
(platforms yes)
(not (found-game ?))
=>
(assert (shoot-people-while-jumping-platforms  (yes-or-no-p "Do you want to shoot people while jumping on platforms? (yes/no)? ")))) 

(defrule determine-more-gun-less-platforming""
(shoot-people-while-jumping-platforms  yes)
(not (found-game ?))
=>
(assert (more-gun-less-platforming  (yes-or-no-p "More run-and-gun,less platforming? (yes/no)? ")))) 

(defrule determine-add-more-adventure""
(more-gun-less-platforming no)
(not (found-game ?))
=>
(assert (add-more-adventure  (yes-or-no-p "Add some adventure to your action/platformer? (yes/no)? ")))) 

(defrule determine-italian-plumber""
(shoot-people-while-jumping-platforms no)
(not (found-game ?))
=>
(assert (italian-plumber  (yes-or-no-p "Do you have an affection for italian plumbers? (yes/no)? ")))) 

(defrule determine-italian-simple-controls""
(italian-plumber yes)
(not (found-game ?))
=>
(assert (italian-simple-controls  (yes-or-no-p "Do you want the controls kept as simple as possible? (yes/no)? ")))) 
 
(defrule determine-italian-2d""
(italian-simple-controls no)
(not (found-game ?))
=>
(assert (italian-2d  (yes-or-no-p "Do you want it 2D? (yes/no)? ")))) 
 
(defrule determine-italian-2d-mix""
(italian-2d no)
(not (found-game ?))
=>
(assert (italian-2d-mix  (yes-or-no-p "Do you want some 2d throwback levels in the mix? (yes/no)? ")))) 
 

(defrule determine-yearn-1980-cartoons""
(italian-plumber no)
(not (found-game ?))
=>
(assert (yearn-1980-cartoons (yes-or-no-p "Do you yearn for 1980's cartoons? (yes/no)? ")))) 
  
(defrule determine-under-water-levels""
(yearn-1980-cartoons no)
(not (found-game ?))
=>
(assert (under-water-levels (yes-or-no-p "Do you enjoy under-water levels? (yes/no)? ")))) 

(defrule determine-keep-it-indie""
(under-water-levels no)
(not (found-game ?))
=>
(assert (keep-it-indie (yes-or-no-p "Want to keep it indie? (yes/no)? "))))
              
;;;****************
;;;* GAME RULES *
;;;****************

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

(defrule crazy-japanese-conclussion ""
   (crazy-japanese yes)
   (not (found-game ?))
   =>
   (assert (found-game "Katamari.")))

(defrule shiny-textures-conclussion ""
   (shiny-textures yes)
   (not (found-game ?))
   =>
   (assert (found-game "BRAID.")))
   
(defrule not-shiny-textures-conclussion ""
   (shiny-textures no)
   (not (found-game ?))
   =>
   (assert (found-game "PORTAL2.")))

(defrule charge-life-conclussion ""
   (charge-life yes)
   (not (found-game ?))
   =>
   (assert (found-game "SIMS-3.")))
   
(defrule not-charge-life-conclussion ""
   (charge-life no)
   (not (found-game ?))
   =>
   (assert (found-game "SIM-CITY-2000.")))

(defrule mobile-conclussion ""
   (mobile yes)
   (not (found-game ?))
   =>
   (assert (found-game "ADVANCE-WARS.")))
   
(defrule not-mobile-conclussion ""
   (mobile no)
   (not (found-game ?))
   =>
   (assert (found-game "FINAL-FANTASY-TACTICS.")))

(defrule army-battles-conclussion ""
   (army-battles yes)
   (not (found-game ?))
   =>
   (assert (found-game "SUIKODEN-2.")))
   
(defrule use-lightsaber-conclussion ""
   (use-lightsaber yes)
   (not (found-game ?))
   =>
   (assert (found-game "FALLOUT.")))
   
(defrule not-use-lightsaber-conclussion ""
   (use-lightsaber no)
   (not (found-game ?))
   =>
   (assert (found-game "STAR-WARS-KNIGHTS.")))

(defrule realistic-violence-conclussion ""
   (realistic-violence yes)
   (not (found-game ?))
   =>
   (assert (found-game "SUPER-SMASH-BROS.")))

(defrule like-weapons-conclussion ""
   (like-weapons yes)
   (not (found-game ?))
   =>
   (assert (found-game "SOULCALIBUR.")))

(defrule opponent-spine-conclussion ""
   (opponent-spine yes)
   (not (found-game ?))
   =>
   (assert (found-game "MORTAL-KOMBAT.")))
   
(defrule not-opponent-spine-conclussion ""
   (opponent-spine no)
   (not (found-game ?))
   =>
   (assert (found-game "Street fighter.")))

(defrule official-team-conclussion ""
   (official-team yes)
   (not (found-game ?))
   =>
   (assert (found-game "EA-SPORTS.")))

(defrule wrestling-stupid-conclussion ""
   (wrestling-stupid no)
   (not (found-game ?))
   =>
   (assert (found-game "W-NO-MERCY.")))

(defrule skate-conclussion ""
   (skate yes)
   (not (found-game ?))
   =>
   (assert (found-game "TONY-HAWK'S-3.")))
   
(defrule not-skate-conclussion ""
   (skate no)
   (not (found-game ?))
   =>
   (assert (found-game "HOT-SHOTS-GOLF.")))

(defrule super-speed-conclussion ""
   (super-speed yes)
   (not (found-game ?))
   =>
   (assert (found-game "F-ZERO-X.")))
   
(defrule not-super-speed-conclussion ""
   (super-speed no)
   (not (found-game ?))
   =>
   (assert (found-game "MARIO-KART-64.")))

(defrule want-badass-conclussion ""
   (want-badass yes)
   (not (found-game ?))
   =>
   (assert (found-game "PARADISE.")))
   
(defrule rally-conclussion ""
   (rally yes)
   (not (found-game ?))
   =>
   (assert (found-game "SEGA-RALLY.")))
   
(defrule not-rally-conclussion ""
   (rally no)
   (not (found-game ?))
   =>
   (assert (found-game "GRAN-TURISMO-3.")))

(defrule serious-dragon-fetish-conclussion ""
   (serious-dragon-fetish  yes)
   (not (found-game ?))
   =>
   (assert (found-game "Dragon Quest VII.")))
   
   (defrule active-battle-system-conclussion ""
      (active-battle-system  yes)
      (not (found-game ?))
      =>
      (assert (found-game "Final Fantasy VI.")))

     (defrule not-active-battle-system-conclussion ""
         (active-battle-system  no)
         (not (found-game ?))
         =>
         (assert (found-game "Final Fantasy X.")))

     (defrule making-fun-of-yourself-conclussion ""
        (making-fun-of-yourself  yes)
        (not (found-game ?))
        =>
        (assert (found-game "Earthbound.")))

    (defrule greatest-game-of-all-time-conclussion ""
       (greatest-game-of-all-time  yes)
       (not (found-game ?))
       =>
       (assert (found-game "Chrono Trigger.")))

       (defrule looking-for-real-time-battles-conclussion ""
          (looking-for-real-time-battles  yes)
          (not (found-game ?))
          =>
          (assert (found-game "Secret of Mana.")))

    (defrule want-to-collect-weapons-conclussion ""
       (want-to-collect-weapons  yes)
       (not (found-game ?))
       =>
       (assert (found-game "Resident Evil 4.")))

     (defrule want-to-be-confused-and-horrified-conclussion ""
        (want-to-be-confused-and-horrified  yes)
        (not (found-game ?))
        =>
        (assert (found-game "Silent Hills 2.")))

        (defrule not-want-to-be-confused-and-horrified-conclussion ""
           (want-to-be-confused-and-horrified  no)
           (not (found-game ?))
           =>
           (assert (found-game "Bioshock.")))

    (defrule want-oldschool-conclussion ""
           (want-oldschool  yes)
           (not (found-game ?))
           =>
           (assert (found-game "The legend of Zelda: Ocarina of Time.")))

    (defrule not-like-playing-with-wiimote-conclussion ""
           (like-playing-with-wiimote  no)
           (not (found-game ?))
           =>
           (assert (found-game "The legend of Zelda: Windwaker.")))

    (defrule want-to-be-assassin-conclussion ""
           (want-to-be-assassin yes)
           (not (found-game ?))
           =>
           (assert (found-game "Assassins Creed II.")))

    (defrule want-to-be-criminal-conclussion ""
           (want-to-be-criminal yes)
           (not (found-game ?))
           =>
           (assert (found-game "Grand Theft Auto IV.")))

    (defrule not-want-to-be-criminal-conclussion ""
           (want-to-be-criminal no)
           (not (found-game ?))
           =>
           (assert (found-game "Red Dead Redemption.")))

    (defrule do-you-lean-towards-art-conclussion ""
           (do-you-lean-towards-art yes)
           (not (found-game ?))
           =>
           (assert (found-game "Okami.")))

    (defrule not-do-you-lean-towards-art-conclussion ""
           (do-you-lean-towards-art no)
           (not (found-game ?))
           =>
           (assert (found-game "ICO.")))

    (defrule want-alien-conspiracy-conclussion ""
           (want-alien-conspiracy yes)
           (not (found-game ?))
           =>
           (assert (found-game "Beyond Good & Evil.")))

    (defrule not-want-alien-conspiracy-conclussion ""
           (want-alien-conspiracy no)
           (not (found-game ?))
           =>
           (assert (found-game "Tom Raider: Lara Croft.")))

   (defrule you-want-to-get-far-fetched-conclussion ""
           (want-alien-conspiracy yes)
           (not (found-game ?))
           =>
           (assert (found-game "Day of the tentacle.")))

   (defrule not-you-want-to-get-far-fetched-conclussion ""
           (want-alien-conspiracy no)
           (not (found-game ?))
           =>
           (assert (found-game "Monkey Island.")))

   (defrule feel-like-throwing-in-fps-conclussion ""
           (want-alien-conspiracy yes)
           (not (found-game ?))
           =>
           (assert (found-game "Deus Ex: Human Revolution.")))
           
   (defrule not-feel-like-throwing-in-fps-conclussion ""
           (want-alien-conspiracy no)
           (not (found-game ?))
           =>
           (assert (found-game "Mass Effect 2.")))
           
   (defrule have-fetish-disney-character-conclussion ""
           (have-fetish-disney-character yes)
           (not (found-game ?))
           =>
           (assert (found-game "Kingdom Hearts.")))
           
   (defrule not-more-childish-conclussion ""
           (more-childish no)
           (not (found-game ?))
           =>
           (assert (found-game "Grim Fandango.")))
           
   (defrule want-best-acting-and-plot-conclussion ""
           (want-best-acting-and-plot yes)
           (not (found-game ?))
           =>
           (assert (found-game "Gabriel Knight.")))

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
  
(defrule platforming-conclussion ""
   (platforming  yes)
   (not (found-game ?))
   =>
   (assert (found-game "Castlevania.")))

(defrule not-platforming-conclussion ""
   (platforming  no)
   (not (found-game ?))
   =>
   (assert (found-game "Elder Scrolls V: Skyrim.")))

(defrule run-walls-conclussion ""
   (run-walls  yes)
   (not (found-game ?))
   =>
   (assert (found-game "Prince of Persia.")))

(defrule not-run-walls-conclussion ""
   (run-walls  no)
   (not (found-game ?))
   =>
   (assert (found-game "Uncharted 2.")))

(defrule brutal-carnage-conclussion ""
   (brutal-carnage  yes)
   (not (found-game ?))
   =>
   (assert (found-game "God of War.")))

(defrule not-brutal-carnage-conclussion ""
   (brutal-carnage  no)
   (not (found-game ?))
   =>
   (assert (found-game "Shadow of Colossus.")))

(defrule batman-conclussion ""
   (batman  yes)
   (not (found-game ?))
   =>
   (assert (found-game "Batman Arkham Asylum.")))

(defrule not-batman-conclussion ""
   (batman  no)
   (not (found-game ?))
   =>
   (assert (found-game "Metal Gear Solid 3.")))

(defrule keep-things-simple-conclussion ""
   (keep-things-simple  yes)
   (not (found-game ?))
   =>
   (assert (found-game "Castle Crashers.")))

(defrule more-gun-less-platforming-conclussion ""
   (more-gun-less-platforming yes)
   (not (found-game ?))
   =>
   (assert (found-game "Contra III.")))

(defrule add-more-adventure-conclussion ""
   (add-more-adventure yes)
   (not (found-game ?))
   =>
   (assert (found-game "Super Metroid.")))

(defrule not-add-more-adventure-conclussion ""
   (add-more-adventure no)
   (not (found-game ?))
   =>
   (assert (found-game "Megaman 2.")))

(defrule fps-conclussion ""
   (fps no)
   (not (found-game ?))
   =>
   (assert (found-game "Gears of War 2.")))

(defrule fps-single-mouse-conclussion ""
   (fps-single-mouse yes)
   (not (found-game ?))
   =>
   (assert (found-game "Half-Life 2.")))

(defrule not-fps-single-mouse-conclussion ""
   (fps-single-mouse no)
   (not (found-game ?))
   =>
   (assert (found-game "Doom II.")))

(defrule fps-respawn-conclussion ""
   (fps-respawn yes)
   (not (found-game ?))
   =>
   (assert (found-game "Counter Strike.")))

(defrule fps-ridiculous-conclussion ""
   (fps-ridiculous yes)
   (not (found-game ?))
   =>
   (assert (found-game "Quake III Arena.")))

(defrule fps-team-conclussion ""
   (fps-team yes)
   (not (found-game ?))
   =>
   (assert (found-game "Team Fortress 2.")))

(defrule fps-noob-conclussion ""
   (fps-noob yes)
   (not (found-game ?))
   =>
   (assert (found-game "Halo 3.")))

(defrule fps-zombies-conclussion ""
   (fps-zombies yes)
   (not (found-game ?))
   =>
   (assert (found-game "Left 4 Dead 2.")))
(defrule not-fps-zombies-conclussion ""
   (fps-zombies no)
   (not (found-game ?))
   =>
   (assert (found-game "Call of Duty 4: modern warfare")))

(defrule italian-simple-controls-conclussion ""
   (italian-simple-controls yes)
   (not (found-game ?))
   =>
   (assert (found-game "Super Mario Bros 3.")))

(defrule italian-2d-conclussion ""
   (italian-2d yes)
   (not (found-game ?))
   =>
   (assert (found-game "Super Mario World.")))

(defrule italian-2d-mix-conclussion ""
   (italian-2d-mix yes)
   (not (found-game ?))
   =>
   (assert (found-game "Super Mario Galaxy 2.")))

(defrule not-italian-2d-mix-conclussion ""
   (italian-2d-mix no)
   (not (found-game ?))
   =>
   (assert (found-game "Super Mario 64.")))

(defrule yearn-1980-cartoons-conclussion ""
   (yearn-1980-cartoons yes)
   (not (found-game ?))
   =>
   (assert (found-game "Disney's Duck tales.")))

(defrule under-water-levels-conclussion ""
   (under-water-levels yes)
   (not (found-game ?))
   =>
   (assert (found-game "Donkey Kong Country.")))

(defrule keep-it-indie-conclussion ""
   (keep-it-indie yes)
   (not (found-game ?))
   =>
   (assert (found-game "Super Meat Boy.")))

(defrule not-keep-it-indie-conclussion ""
   (keep-it-indie no)
   (not (found-game ?))
   =>
   (assert (found-game "Psychonauts.")))
  


;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "The Videogame Suggestion Expert System")
  (printout t crlf crlf))

(defrule print-game ""
  (declare (salience 10))
  (found-game ?item)
  =>
  (printout t crlf crlf)
  (printout t "Suggested game:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))
