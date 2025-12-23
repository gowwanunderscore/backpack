# 🎒 Backpack — Inventory Addon

### Description

This resource adds a **backpack item** to your server’s inventory system, allowing players to carry more items.

### Requirements

- `ox_lib`
- `ox_inventory`
- `es_extended`

> ⚠️ **Note:** This resource is only compatible with **Ox libraries**.

> ❗ **IMPORTANT:** Place `backpack.png` in  
> `ox_inventory/web/images`

### Inventory Configuration (`items.lua`)

```lua
['backpack'] = {
  label = 'Backpack',
  weight = 220,
  stack = false,
  consume = 0,
  description = 'A backpack with great capacity.',
  client = {
    export = 'backpack.openBackpack'
  }
},
