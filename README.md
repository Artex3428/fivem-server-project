--SETUP--
To add a resource
* Make a fork of their repo
* Add it as a module with git submodule add https://github.com/authorofforksname/resourcename.git server-data/resources/whatresourcefoldernameshouldbe

* Do this inside of the resource folder git remote add upstream https://github.com/authorsname/resourcename.git
This leaves you with origin / your fork and upstream so the original repo and to update you do
git fetch upstream
git merge upstream/main
git push origin main

And incase the forked resource is a fork from someone else and at least if they don't share git history do
* Make a fork of the fork
* Add that as a module
* Enter the resource folder and do add remote official repo which is the original repo and also do upstream from the auhor who you forked from that forked from the original and to update you do
git fetch upstream
git merge upstream/main
git push origin main
PS only for the forked repo
To get the original updates you need to do
git fetch official
git log --oneline official/main -10
or how many ever commits you want to check
git show <commit hash>
you have to check relevant commits manually

Make sure that after each update you build if a build is needed ussaly with either
npm install
npm run build

or
pnpm i
pnpm run build

or
npm ci
npm run build

or
bun install --forzen-lockfile
bun run build

all depending on what resource it is aobut and resources

Use the startwithouttxadmin.bat if you don't want to use txadmin otherwise run the exe in the root

Add submodule
git submodule add https://github.com/Artex3428/RESOURCENAME.git server-data/resources/RESOURCENAME

Add original author repo as upstream
git remote add upstream https://github.com/ORIGINALOWNER/RESOURCENAME.git

removing added repo
git submodule deinit -f -- server-data/resources/recoursename
git rm -f server-data/resources/recoursename
rmdir /s /q .git\modules\server-data\resources\recoursename
then commit it
and also remove fork from github i guess

!obs some resources names might be wrong if any issues accure


--NOTES--
Make sure sim card and phone are sold somewhere

might have to temp use pma-voice since fivem integrated voice might not work for phones etc

configure adminmenu to use right fuel system, and also to use right garage etc

remember to get a boss panel job panel for companies and police etc to manage employes with cool ui but the current might be okey for now

add report system if the current adminmenu don't have that

add bank card incase bank system don't include it as item in inventory

maybe duty blips needed

maybe intereact-sound or simular needed

maybe qbx tunerchip later

maybe lockpick script like qbx if not added somewhere in another resource

maybe printer script like qbx one
change nd_police name on files like audio in qbx_police to only be police or something, ps need compiling and chaning xml files also

maybe change the images from nd_ambulance to match with the other images styles which is tourniquet, gauze, splint, burndressing, medbag, defib, stretcher

maybe restorant job

maybe nightclub job

most likely if it has change garages green and red marker on the ground to sometihng more modern like target or textui

use the qbx_core logs functionality to make sure that admins can see it either in current admin menu or in a seperete ui and add logs that checks for things like connect/leave(if they where dead when they left/combatlogged), if someone suddenly traveled to fast in a way that you can't with any meant to be game mechanics, if they dublicate items and more. 

add vehicle teleport to the s4t4n667_elevators

skipped to run sql for v-sport since they said it would be ran on first start if it did not exist

powersaw item inside of the inventory has a dupplicate

make sure to find what resource that we used a stable realese version instead of main

maybe make not enough cops incative in scripts since its limiting roleplay that you can do

make sure all items resources use exist with images and that images look the same in quality size etc

add to when anti animate trough wall is added check to see if they are in prison and use the prison script tp back to prison for if you relog and also check if is cuffed and if they are cuffed tp them back to the police who put the cuffs on them or maybe set a specifik spot that cops only can open a cage somewhere or if its zip ties put them somewhere where only people from the outside can find them something like it

should remove images that are only for install in the different resources to save space and have it more clean

Seatbelt resource might need to make sure that the harnes if it is a prop don't do like one music and mayham i think if a player disconnects or something like that just freezes in the air i gues easy if it is that way just to check status on player now and then if it disconects and delete the harnes or wathever check if its aboneoned and delete the entity

add bobipl maybe

make sure that property script uses the houses and apartments that actually got windows but that still has different instances

-- Inventory items --
REMOVED
['diving_fill'] = {
    label = 'Diving Tube',
    weight = 3000,
    stack = false,
    close = true,
    description = "used to refill your diving gear's oxygen supply."
},
['driver_license'] = {
    label = 'Drivers License',
    rarity = 'common',
},
['screwdriver'] = { -- The dublicate
    label = 'Screwdriver',
    rarity = 'common',
    weight = 300,
    stack = true,
    close = true,
    description = 'A flathead screwdriver for prying coin boxes and unbolting fixtures.',
},
["diving_fill"] = {
    label = "Diving Tube",
    rarity = 'common',
    grid = { 1, 2 },
    weight = 1000,
    stack = false,
    close = true,
    consume = 0,
    description = "Refill your oxygen tank with this diving tube.",
    client = {
        image = "diving_tube.png",
    },
    server = {
        export = 'sd-civjobs.useDivingFill'
    }
},
['powersaw'] = { -- The dublicate
    label = 'Power Saw',
    rarity = 'uncommon',
    grid = { 2, 2 },
    weight = 4000,
    stack = true,
    close = true,
    description = 'A cordless reciprocating saw for cutting through metal.',
},

ADDED ITEMS
drone_battery_empty drone_battery and drone for nzkfc_drone
rc-bandito
rentalpapers
gunrangereceipt
skining_knife, boar_meat, boar_skin, deer_meat, deer_skin, coyote_meat, coyote_skin, rabbit_meat, rabbit_skin, cow_meat, cow_skin, chicken_meat, chicken_skin, pig_meat, pig_skin, hunting_talent_reset, hunting_xpboost
driver_license cdl_license and motorcycle_license
diving_fill
mt_fakeplates screwdriver
pre_workout protein_bar sports_drink whey
blindfold
anchovy, sardine, mackerel, bass, salmon, tuna, swordfish, clam, treasure_map, ancient_relic, lottery_ticket, fishing_voucher
pet_medkit pet_revive pet_food pet_water
keys
crafting_bench_w
police_crafting_bench

ADDED IMAGES
drone_battery_empty drone_battery and drone for nzkfc_drone
rc-bandito
rentalpapers
skining_knife, boar_meat, boar_skin, deer_meat, deer_skin, coyote_meat, coyote_skin, rabbit_meat, rabbit_skin, cow_meat, cow_skin, chicken_meat, chicken_skin, pig_meat, pig_skin, hunting_talent_reset, hunting_xpboost
cdl_license and motorcycle_license
diving_fill
mt_fakeplates screwdriver
tirekit advancedrepairkit
pre_workout protein_bar sports_drink whey
blindfold
strippedbass_fish swordfish lottery_scratchcards mapa contract_paper

-- GOALS -- 
Make the server pve and pvp compatible either automaticly, depending on playerbase, both, or either one.
Make all resources safe to restart while ingame and using the script for easier development as well as be able to set it up and install it.
All resource should be authoritative and not abusable.
No glitches, bugs, or errors.
All resources should use the same standard like naming convention and more.
Compatability for different controls like handcontroller, vr, steeringwheel and other sim gear and of curse keyboard and mouse.

List of things that i should do

- Look into what the z radial menu comes from and look if that is realy neccesery
- Admin say duty is required and giving admin seems not to work
- The target makes the screen dark when using it disable that maybe but kind of nice tho
- There is currently crouch and stance try set them both to control or wathever my old server courch crawl script uses or just add that if crawl dos not exist
- Holding up hands script seems to be inflicting with another one or its just wierdly made
- Add the center cursor once you enter inventory btw quick thinking is that because we center the cursor that item info reapears becuase its where it was left before maybe you can center it before you close it to so it have time to get rid of it not pointing at a item
- Add so you can run and possible run while using the inventory
- preconfigure the keybinds better
- change the chat theme not to have background
- change chat performance if needed
- unbind chat keybinds by default
- The character might have a bug where after first load it fucks up what you did like face thicknes etc but it might be that the character face is on 1 but looks like 0 yes it starts at 1 by default tho face is as 0
- Check first if inventory settings ingame when you open inventory have something for the inventory above
- Disable hud money coming upp while losing or reciving money
- Seems not able to delete character
- Sim card might not have image
- Phone item config in inventory might need button for simtray
- How do you revive maybe because we use nd_ambulance
- The old status stil showing maybe while in a vehicle
- Admin keep saying you are not admin or god
- Fix the cfg structure
- Can't open gunstore shop keep saying you cant open inventory right now
- 

Add enter any vehicle doors with ox

crashed when consumed item item was both burger and water but not on the laptop tho

Seems to be alot of props that crashes and maybe we have not converted thos think its even default gtas

recoil not working

add remove status bar

remove multi char system backgrounds that glitches

change anme for car spawn to vehicle command name

add bob ipl might be why some background bug but still incase someone dont use it only use what is there by default

isbusyinventory realy bad made

crosshair in vehicle flickering only in first person

Failed to load data file cfx_resource_ultra-voltlab:/audiodata/dlchei4_game.dat of type AUDIO_GAMEDATA for resource ultra-voltlab
Failed to load data file cfx_resource_ultra-voltlab:/audiodata/dlchei4_sounds.dat of type AUDIO_SOUNDDATA for resource ultra-voltlab


Failed to add replacement texture: Could not find original texture. Dict name: platform:/textures/graphics, Tex name: radarmask1g.