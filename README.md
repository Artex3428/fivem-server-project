**IMPORTANT**

This server is work in progress. The server is working fine but might require some configuration and small amount of fixing. It is a good start and maybe the best one out there.

**PREVIEW**
<img width="1672" height="941" alt="ServerPreview" src="https://github.com/user-attachments/assets/b78f0272-3d0d-4942-b626-071d166c81a9" />

**INFORMATION**

This server is a qbox server.

Goals for the server
* Make the server pve and pvp compatible either automaticly, depending on playerbase, both, or either one.
* Make all resources safe to restart while ingame and using the script for easier development as well as be able to set it up and install it.
* All resource should be authoritative and not abusable.
* No glitches, bugs, or errors.
* All resources should use the same standard like naming convention and more.
* Compatability for different controls like handcontroller, vr, steeringwheel and other sim gear and of curse keyboard and mouse.

**SETUP**

Steps to take to get the server up

1. Download required software
* Mariadb
* Hedisql(optional if you want a database interface)
* Vs code(optional for editing code and texts)

2. Setup
* Create a database in mariadb after you have set mariadb up with password for root user or recomended making a new user for your server. I recomend using hedisql to make the server database.
* Run the backed up sql file in server-data in the newly created database
* Download FiveM enhanced artifacts files and add to root. Leave the system resources folder the current one and do not replace with new if you want to keep the chat modification which i recomend.
* Configure a server-private.cfg with the following: sv_licenseKey changeme, set steam_webApiKey "", #set rcon_password "", add_principal identifier.license:playerlicense group.admin # add the admin to the group, set mysql_connection_string "mysql://mariadbuser:password@ipwithporthere(default is 127.0.0.1:3306 if on local)/databasename"

To add a resource
* Make a fork of their repo
* Add it as a module with git submodule add https://github.com/authorofforksname/resourcename.git server-data/resources/whatresourcefoldernameshouldbe
* Do this inside of the resource folder git remote add upstream https://github.com/authorsname/resourcename.git

This leaves you with origin / your fork and upstream so the original repo and to update you do
* git fetch upstream
* git merge upstream/main
* git push origin main

Incase problems with shared git history ussaly from forked forks do
* Make a fork of the fork
* Add that as a module
* Inside the resource folder add the offical original repo remotly as official as well as the fork from the one you used as upstream
When updateing
* git fetch upstream
* git merge upstream/main
* git push origin main
PS only for the forked repo
To get the original updates you need to do
* git fetch official
* git log --oneline official/main -10
or how many ever commits you want to check
* git show <commit hash>
you have to check relevant commits manually

Make sure that after each update you build if a build is needed ussaly with either
* npm install
* npm run build
or
* pnpm i
* pnpm run build
or
* npm ci
* npm run build
or
* bun install --forzen-lockfile
* bun run build

Add submodule
* git submodule add https://github.com/Artex3428/RESOURCENAME.git server-data/resources/RESOURCENAME

Add original author repo as upstream
* git remote add upstream https://github.com/ORIGINALOWNER/RESOURCENAME.git

Removing added repo
* git submodule deinit -f -- server-data/resources/recoursename
* git rm -f server-data/resources/recoursename
* rmdir /s /q .git\modules\server-data\resources\recoursename
* Commit it
And if you want remove the fork from github

Tip is use the startwithouttxadmin.bat if you don't want to use txadmin otherwise run the exe in the root

**NOTES**
* Make sure sim card and phone are sold somewhere
* Some resources names might be wrong if any issues accure
* Add boss panel ui
* Add report system if the current adminmenu don't have that
* Add bank card incase bank system don't include it as item in inventory
* Add x-shound if a resource in the future requires it
* Maybe qbx tunerchip later
* Maybe printer script like qbx one
* Maybe restorant job
* Maybe nightclub job
* skipped to run sql for v-sport since they said it would be ran on first start if it did not exist
* Make sure to find what resource that we used a stable realese version instead of main
* Maybe make not enough cops incative in scripts since its limiting roleplay that you can do
* Make sure all items resources use exist with images and that images look the same in quality size etc
* Maybe add anti animate trough wall and check to see if they are in prison and use the prison script tp back to prison for if you relog or maybe set a specifik spot like a cell you tp to
* Add anticheat maybe
* Should maybe remove images that are only for install in the different resources to save space and have it more clean
* Seatbelt resource might need to make sure harnes entity are deleted if a player uses it and disconnects or if the car despawns since sometimes it might be stuck in the air
* Make sure that property script uses the houses and apartments that actually got windows but that still has different instances

**Changes**
Inventory

REMOVED ITEMS
* diving_fill
* driver_license
* screwdriver
* powersaw

ADDED ITEMS
* drone_battery_empty drone_battery and drone for nzkfc_drone
* rc-bandito
* rentalpapers
* gunrangereceipt
* skining_knife, boar_meat, boar_skin, deer_meat, deer_skin, coyote_meat, coyote_skin, rabbit_meat, rabbit_skin, cow_meat, cow_skin, chicken_meat, chicken_skin, pig_meat, pig_skin, hunting_talent_reset, hunting_xpboost
* driver_license cdl_license and motorcycle_license
* diving_fill
* mt_fakeplates screwdriver
* pre_workout protein_bar sports_drink whey
* blindfold
* anchovy, sardine, mackerel, bass, salmon, tuna, swordfish, clam, treasure_map, ancient_relic, lottery_ticket, fishing_voucher
* pet_medkit pet_revive pet_food pet_water
* keys
* crafting_bench_w
* police_crafting_bench
* pilot_license
* boat_license

ADDED IMAGES
* drone_battery_empty drone_battery and drone for nzkfc_drone
* rc-bandito
* rentalpapers
* skining_knife, boar_meat, boar_skin, deer_meat, deer_skin, coyote_meat, coyote_skin, rabbit_meat, rabbit_skin, cow_meat, cow_skin, chicken_meat, chicken_skin, pig_meat, pig_skin, hunting_talent_reset, hunting_xpboost
* cdl_license and motorcycle_license
* diving_fill
* mt_fakeplates screwdriver
* tirekit advancedrepairkit
* pre_workout protein_bar sports_drink whey
* blindfold
* strippedbass_fish swordfish lottery_scratchcards mapa contract_paper
* pilot_license
* boat_license

**TODO**

FIXLIST
* Look into what the z radial menu comes from and look if that is realy neccesery
* Change nd_police name on files like audio in qbx_police to only be police or something, ps need compiling and chaning xml files also
* The target makes the screen dark when using it disable that maybe but kind of nice tho
* Add the center cursor once you enter inventory btw quick thinking is that because we center the cursor that item info reapears becuase its where it was left before maybe you can center it before you close it to so it have time to get rid of it not pointing at a item
* Sim card might not have image
* Change garage markes to use target or textui
* Setup qbx_core logs to log things that also admins can see like left, joined, killed, and more anticheat kind of logs
* Add vehicle teleport to the s4t4n667_elevators
* Change the images from nd_ambulance to match with the other images styles which is tourniquet, gauze, splint, burndressing, medbag, defib, stretcher
* Add enter any vehicle doors with ox
* Add sound for seatbelt on of maybe
* Fixing so the street names and compas is hidden while the escape menu is open and inventory and other menus if thats the case fix force minmap hidden either on foot or in vehicle or both via config
* Remove so vehicles don't despawn while you noclip trough them its true for npc vehicles
* For making it more plesent in the begining of loading in alot of things show up that loaded on the screen hide that maybe somehow
* Fix crosshair in vehicle flickering only in first person
* Add menu options on either target menu, context or radial menu. Open all doors, Lock, Open all windows, Engine shut on off, Neon control, Extras, Air supspension
* Remove 3dme since it is not realistic to have text writen over peoples head and you should instead speak of what you do
* Remove say command

UNCLEAR
* Saved walk styles might be between all characters
* Crashes when cunsuming items either caused by animation or prop might even be for default gta 5 props 
* Can't open gunstore shop keep saying you cant open inventory right now maybe you need gun lisence as item in inventory
* Character face seem to still change randomly and the character that you start with seems not to be about that config in qbx core but maybe inside illenium appearance somewhere

FEUTURE THINS MIGHT BE INFLICTING
* Make silencer in vehicle allowed
* Make clothing like hats or fat jackets allowed in vehicles
* Make trailers or other things attached to vehicles like towtrucks be treated as a vehicle otherwize npc will run straight trough the trailer not thinking its something in the whay and lights wont work etc
* Mirrors in vehicles working
* First person only

ERRORS

Failed to load data file cfx_resource_ultra-voltlab:/audiodata/dlchei4_game.dat of type AUDIO_GAMEDATA for resource ultra-voltlab
Failed to load data file cfx_resource_ultra-voltlab:/audiodata/dlchei4_sounds.dat of type AUDIO_SOUNDDATA for resource ultra-voltlab

Something about phone
[21:44:22] [ info] [        sd-phone] SCRIPT ERROR: @sd-phone/server/settings/store.lua:2337: sd-phone was unable to execute a query!
Query:         SELECT *,
               hour24             IS NULL AS hour24_unset,
               wallpaper_parallax IS NULL AS parallax_unset,
               caller_id          IS NULL AS caller_id_unset
        FROM phone_settings WHERE citizenid = ? AND device = ?

["sim:6630893051","phone"]
Should not reach here: undefined
> [global chunk]
> InvokeNative
> callbackResponse (ox_lib/imports/callback/server.lua:101)
> [global chunk] (ox_lib/imports/callback/server.lua:122)
> [global chunk]
> pcall
> nonpromisecb (deferred.lua:78)
> promise (deferred.lua:57)
> fire (deferred.lua:66)
> [global chunk] (deferred.lua:112)
> finish (deferred.lua:24)
> nonpromisecb (deferred.lua:102)
> promise (deferred.lua:57)
> nonpromisecb (deferred.lua:97)
> promise (deferred.lua:57)
> fire (deferred.lua:66)
> [global chunk] (deferred.lua:112)
> [global chunk] (scheduler.lua:365)
> pcall
> [global chunk] (scheduler.lua:364)
> CreateThreadNow
> [global chunk] (scheduler.lua:363)

Received non-vehicle model hash 0x6dbcfc99. Can't create the vehicle.

When deleting
[22:54:54] [ info] [         oxmysql] Error: qbx_core was unable to complete a transaction!
DELETE FROM properties WHERE owner = 'ST99X98P'
Unknown column 'owner' in 'WHERE'

[00:29:07] [fatal] [ qbx_mechanicjob] @qbx_mechanicjob/server/main.lua:96: table index is nil
> [global chunk] (qbx_mechanicjob/server/main.lua:96)
> [global chunk]
> pcall
> nonpromisecb (deferred.lua:76)
> promise (deferred.lua:57)
> fire (deferred.lua:66)
> [global chunk] (deferred.lua:112)
> finish (deferred.lua:22)
> nonpromisecb (deferred.lua:102)
> promise (deferred.lua:57)
> nonpromisecb (deferred.lua:97)
> promise (deferred.lua:57)
> fire (deferred.lua:66)
> [global chunk] (deferred.lua:112)
> func (oxmysql/lib/MySQL.lua:23)
> [global chunk] (scheduler.lua:365)
> pcall
> [global chunk] (scheduler.lua:364)
> CreateThreadNow
> [global chunk] (scheduler.lua:363)

Command getclothing-ambulance is already registered.

Failed to parse pending replication value for ConfigVar loadscreen:externalShutdown: false

Failed to parse pending replication value for ConfigVar inventory:target: true
Failed to parse pending replication value for ConfigVar inventory:autoreload: false
Failed to parse pending replication value for ConfigVar inventory:screenblur: true
Failed to parse pending replication value for ConfigVar inventory:aimedfiring: false
Failed to parse pending replication value for ConfigVar inventory:giveplayerlist: true
Failed to parse pending replication value for ConfigVar inventory:weaponanims: true
Failed to parse pending replication value for ConfigVar inventory:itemnotify: true
Failed to parse pending replication value for ConfigVar inventory:weaponnotify: true
Failed to parse pending replication value for ConfigVar inventory:dropprops: true