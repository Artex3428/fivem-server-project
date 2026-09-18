# Installing with txAdmin

This project includes a custom txAdmin recipe for automated installation.

The txAdmin installation downloads a complete packaged version of the server, including all Git submodule resources, configures the database, generates the private server configuration and prepares the server for use.

## Requirements

Install or have access to MariaDB/MySQL before beginning the deployment.

You will also need a valid Cfx.re/FiveM server license key.

The FiveM server itself should be running through txAdmin using FiveM Enhanced artifacts.

## Recipe URL

Use the following recipe URL:

```text
https://raw.githubusercontent.com/Artex3428/fivem-server-project/main/recipe.yaml
```

## Installation

Open the txAdmin setup wizard.

Choose **Remote URL Template**.

Paste the recipe URL shown above.

Choose the destination for the server data.

Enter your FiveM server license key when requested.

Enter your MariaDB/MySQL connection information when requested.

Run the deployment.

txAdmin will automatically download the complete server package, create/configure the selected database, import the included database schema/data and generate `server-private.cfg`.

After deployment finishes, review `server.cfg` and start the server through txAdmin.

## Development Version

The current recipe installs the latest development package generated from the `main` branch.

The deployment package is automatically rebuilt after changes are pushed to `main`.

This means the recipe is intended to follow the current development state of the project until stable versioned releases are introduced.

## Developing the Server

The txAdmin installation is intended primarily for running or customizing an installed server.

If you want to contribute to or develop the original repository while retaining its Git submodule structure, clone it using:

```bash
git clone --recurse-submodules https://github.com/Artex3428/fivem-server-project.git
```

If the repository was already cloned without submodules, run:

```bash
git submodule update --init --recursive
```

## Manual Installation

Manual installation remains supported. See the main `README.md` for the normal development/manual installation process.