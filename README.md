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


!obs some resources capital letters might be wrong if any issues accure


notes to remember
Make sure sim card and phone are sold somewhere

might have to temp use pma-voice since fivem integrated voice might not work for phones etc
configure adminmenu to use right fuel system, and also to use right garage etc
remember to get a boss panel job panel for companies and police etc to manage employes with cool ui but the current might be okey for now
add report system if the current adminmenu don't have that
add bank card incase bank system don't include it as item in inventory
radio neded
maybe duty blips needed
maybe intereact-sound or simular needed
maybe qbx tunerchip later
maybe lockpick script like qbx if not added somewhere in another resource
qbx helicam maybe
loadingscreen
vehiclefailure
binocular
drone
rc car
density control
realastionchip between npc script
weather sync
maybe printer script like qbx one
animations script
change nd_police name on files like audio in qbx_police to only be police or something, ps need compiling and chaning xml files also
maybe add fireworks
carwash

if sd-simonsays and sd-dialog and sd-levels are not used in the end maybe remove them

maybe change the images from nd_ambulance to match with the other images styles which is tourniquet, gauze, splint, burndressing, medbag, defib, stretcher

maybe restorant job

make able to shot or hur people in the same vehicle

most likely if it has change garages green and red marker on the ground to sometihng more modern like target or textui

add in the anti clip trough walls maybe

add logs maybe

ragdoll

add vehicle teleport to the s4t4n667_elevators

skipped to run sql for v-sport since they said it would be ran on first start if it did not exist

added tirekit.png and advancedrepairkit.png to inventory images looked almost like the others i belive added also for gym items pre_workout.png, protein_bar.png, sports_drink.png, and whey.png and also the items also from wz-blindfold added a blindfold.png and item to it aswell also added anchovy, sardine, mackerel, bass, salmon, tuna, swordfish, clam, treasure_map, ancient_relic, lottery_ticket, fishing_voucher and images to it where only for that where added strippedbass_fish.png swordfish.png lottery_scratchcards.png mapa.png contract_paper.png and currently clam tuna salmon mackerel sardine anchovy and maybe also bass need accurate images all of them exept bass use same fish img added also pet_medkit pet_revive pet_food pet_water but no images just items in inventory

removed duplicate screwdriver and added config not included for the mt_fakeplates screwdriver the old one was looking like this
['screwdriver'] = {
    label = 'Screwdriver',
    rarity = 'common',
    weight = 300,
    stack = true,
    close = true,
    description = 'A flathead screwdriver for prying coin boxes and unbolting fixtures.',
},

also removed powersaw dublicate old one was
['powersaw'] = {
    label = 'Power Saw',
    rarity = 'uncommon',
    grid = { 2, 2 },
    weight = 4000,
    stack = true,
    close = true,
    description = 'A cordless reciprocating saw for cutting through metal.',
},

removed
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
since its for sd-multijob diving and i use qbx_divegear which looks like this that i added
['diving_fill'] = {
    label = 'Diving Tube',
    weight = 3000,
    stack = false,
    close = true,
    description = "used to refill your diving gear's oxygen supply."
},
and added diving_fill image

added also drone_battery_empty drone_battery and drone for nzkfc_drone and images

added rc-bandito item and image

powersaw item inside of the inventory has a dupplicate

make sure to add flip vehicle with command or item since vehiclehandler might not have that

make sure to find what resource that we used a stable realese version instead of main

maybe make not enough cops incative in scripts since its limiting roleplay that you can do

make sure all items resources use exist with images and that images look the same in quality size etc

Add els for emergency vehicles

gunrange

add to when anti animate trough wall is added check to see if they are in prison and use the prison script tp back to prison for if you relog and also check if is cuffed and if they are cuffed tp them back to the police who put the cuffs on them or maybe set a specifik spot that cops only can open a cage somewhere or if its zip ties put them somewhere where only people from the outside can find them something like it

hunting

should remove images that are only for install in the different resources to save space and have it more clean

Seatbelt resource might need to make sure that the harnes if it is a prop don't do like one music and mayham i think if a player disconnects or something like that just freezes in the air i gues easy if it is that way just to check status on player now and then if it disconects and delete the harnes or wathever check if its aboneoned and delete the entity
