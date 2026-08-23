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
npm ci
npm run build

or
bun install --forzen-lockfile
bun run build

all depending on what resource it is aobut and resources




Use the startwithouttxadmin.bat if you don't want to use txadmin otherwise run the exe in the root




notes to remember
Make sure sim card and phone are sold somewhere

might have to temp use pma-voice since fivem integrated voice might not work for phones etc
configure adminmenu to use right fuel system, and also to use right garage etc
remember to get a boss panel job panel for companies and police etc to manage employes
add nozzle script to the fuel script from nd_fuel to ox_fuel that we use
add report system if the current adminmenu don't have that
add bank card incase bank system don't include it as item in inventory