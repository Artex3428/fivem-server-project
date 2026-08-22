<div align="center">

# ox_inventory

A complete and modern inventory system for FiveM, providing a flexible slot-based inventory with support for shops, stashes, crafting, and vehicle storage.

[![](https://img.shields.io/github/downloads/overextended/ox_inventory/total?style=for-the-badge&logo=github)](https://github.com/overextended/ox_inventory/releases/latest/download/ox_inventory.zip)
[![](https://img.shields.io/github/downloads/overextended/ox_inventory/latest/total?style=for-the-badge&logo=github)](https://github.com/overextended/ox_inventory/releases/latest/download/ox_inventory.zip)
[![](https://img.shields.io/github/v/release/overextended/ox_inventory?style=for-the-badge&logo=github)](https://github.com/overextended/ox_inventory/releases/latest/)\
[![](https://badges.5metrics.dev/ox_inventory/serverRank.svg?style=for-the-badge)](https://5metrics.dev/resource/ox_inventory)
[![](https://badges.5metrics.dev/ox_inventory/servers.svg?style=for-the-badge)](https://5metrics.dev/resource/ox_inventory)
[![](https://badges.5metrics.dev/ox_inventory/players.svg?style=for-the-badge)](https://5metrics.dev/resource/ox_inventory)

Refer to [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution guidelines and to see our Contributor License Agreement.\
Refer to [NOTICE.md](./NOTICE.md) for additional information and legal notices.

</div>

## 📚 Documentation

https://overextended.dev/docs/ox_inventory

## 💾 Download

https://github.com/overextended/ox_inventory/releases/latest/download/ox_inventory.zip

## Supported frameworks

We do not guarantee compatibility or support for third-party resources.

- [ox_core](https://github.com/overextended/ox_core)
- [esx](https://github.com/esx-framework/esx_core)
- [qbox](https://github.com/Qbox-project/qbx_core)
- [nd_core](https://github.com/ND-Framework/ND_Core)

## ✨ Features

- Server-side security ensures interactions with items, shops, and stashes are all validated.
- Logging for important events, such as purchases, item movement, and item creation or removal.
- Supports player-owned vehicles, licenses, and group systems implemented by frameworks.
- Fully synchronised, allowing multiple players to [access the same inventory](https://user-images.githubusercontent.com/65407488/230926091-c0033732-d293-48c9-9d62-6f6ae0a8a488.mp4).

### Items

- Inventory items are stored per-slot, with customisable metadata to support item uniqueness.
- Overrides default weapon-system with weapons as items.
- Weapon attachments and ammo system, including special ammo types.
- Durability, allowing items to be depleted or removed overtime.
- Internal item system provides secure and easy handling for item use effects.
- Compatibility with 3rd party framework item registration.

### Shops

- Restricted access based on groups and licenses.
- Support different currency for items (black money, poker chips, etc).

### Stashes

- Personal stashes, linking a stash with a specific identifier or creating per-player instances.
- Restricted access based on groups.
- Registration of new stashes from any resource.
- Containers allow access to stashes when using an item, like a paperbag or backpack.
- Access gloveboxes and trunks for any vehicle.
- Random item generation inside dumpsters and unowned vehicles.
