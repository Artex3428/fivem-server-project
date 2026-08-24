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


!obs some resources capital letters might be wrong if any issues accure


notes to remember
Make sure sim card and phone are sold somewhere

might have to temp use pma-voice since fivem integrated voice might not work for phones etc
configure adminmenu to use right fuel system, and also to use right garage etc
remember to get a boss panel job panel for companies and police etc to manage employes with cool ui but the current might be okey for now
add nozzle script to the fuel script from nd_fuel to ox_fuel that we use
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
add nd police job handcuff animations to the qbx police job the one that we use
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

added tirekit.png and advancedrepairkit.png to inventory images looked almost like the others i belive

make sure to add flip vehicle with command or item since vehiclehandler might not have that

make sure to find what resource that we used a stable realese version instead of main

maybe make not enough cops incative in scripts since its limiting roleplay that you can do

make sure all items resources use exist with images and that images look the same in quality size etc

