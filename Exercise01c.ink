/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 3
VAR ammo = 1
VAR weapon = ""
VAR fuses = 0
VAR e_cnt = 2
VAR acid_cerberus = 2
VAR fungal_minotaur = 1


-> Preparation

-> split_path

=== Preparation ===
Before you lies a fork in the road. You decide which weapon to prepare.

*[Revolver] 
    ~ weapon = "Revolver" 
    -> split_path
*[Shotgun] 
    ~ weapon = "Shotgun" 
    -> split_path
*[Marksman Rifle] 
    ~ weapon = "Marksman Rifle" 
    -> split_path


== split_path ==
You must choose your path. The crypt is unkown territory and is pitch black. The badlands aren't as dark, but are known for the abominations that reside there. {not fuse_pickup:There is a fuse on the floor.}

Are you sure the {weapon} is the right decision?

You have {fuses} fuses

+ [Take the crypt] -> crypt
+ [Take the badlands] -> badlands
* [Pick up the fuse charge] -> fuse_pickup
+ [Go Back] -> Preparation

== crypt ==
You are in the crypt. It is very dark, you can't see anything.
* {fuses > 0} [Use fuse] -> crypt_lit
+ [Go Back] -> split_path
-> END

== badlands ==
You have wandered into the badlands... good luck...
{weapon == "Revolver": A revolver in the badlands... old faithful.| }
* [Go set up camp in the woods] -> camp_site
+ [Go Back] -> split_path
-> END

=== fuse_pickup ===
~ fuses = fuses + 1
You now have a fuse charge. It can provide a momentary burst of light.
* [Go Back] -> split_path
-> END

== crypt_lit ==
You send out a burst of light with your fuse it won't last very long. Suddenly, you see an ammo stash and an exit path!
* [Go for exit] -> Fight
* [Loot ammo] -> ammo_loot
-> END

=== ammo_loot ===
~ ammo = ammo + 1
You now have {ammo} shots. This will aid in putting down monsters.
* [Go Back] -> crypt_lit
-> END

=== Fight ===

As you go for the exit you see two mutants blocking the way choose which one to take out.
* {ammo > 1} [Acid Cerberus] -> AC_End
* {ammo > 0} [Fungal Minotaur] -> FM_End

== AC_End ==
~ health = health - fungal_minotaur
You barley escape with your life you have {health} health remaining.
->END

== FM_End ==
~ health = health - acid_cerberus
You barley escape with your life you have {health} health remaining.
->END

== camp_site ==
You find a secluded area to set up camp. You'll need another fuse to ignite a camp fire.
+ [Go find fuse] -> camp_fuse_pickup
+ {fuses > 1} [Start fire and end night] -> camp_end
-> END

=== camp_fuse_pickup===
~ fuses = fuses + 1
You now have a fuse charge. It can help ignite a campfire.
+ [Go Back] -> camp_site
-> END

== camp_end ==
You sleep through the night with a fire to scare the mutants.
-> END