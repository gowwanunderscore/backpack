
==== French / Français ====

Salut, voici un manuel d'instruction afin d'installer ceci sur ton serveur !

Tout d'abord tu auras besoin des ressources suivantes en prérequis:

> ox_lib
> ox_inventory
> es_extended

Note: Cette ressource n'est compatible qu'avec les bibliothèques Ox

IMPORTANT: Placez backpack.png dans ox_inventory/web/images

==== Configuration Inventaire [items.lua] ====

	['backpack'] = {
		label = 'Sac à dos',
		weight = 220,
		stack = false,
		consume = 0,
		description = 'Sac à dos d\'une grande contenance.',
		client = {
			export = 'backpack.openBackpack'
		# Backpack — Inventory Addon

		Multilingual installation instructions for the `backpack` resource.

		---

		## English

		### Description

		This resource adds a backpack item to your server's inventory system.

		### Prerequisites

		- `ox_lib`
		- `ox_inventory`
		- `es_extended`

		> Note: This resource is only compatible with Ox libraries.

		> **IMPORTANT:** Place `backpack.png` in `ox_inventory/web/images`.

		### Inventory configuration (items.lua)

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
		```

		---

		## Français

		### Description

		Ce module ajoute un objet sac à dos au système d'inventaire de votre serveur.

		### Prérequis

		- `ox_lib`
		- `ox_inventory`
		- `es_extended`

		> Remarque : Cette ressource n'est compatible qu'avec les bibliothèques Ox.

		> **IMPORTANT :** Placez `backpack.png` dans `ox_inventory/web/images`.

		### Configuration de l'inventaire (items.lua)

		```lua
		['backpack'] = {
		  label = 'Sac à dos',
		  weight = 220,
		  stack = false,
		  consume = 0,
		  description = 'Sac à dos d\'une grande contenance.',
		  client = {
		    export = 'backpack.openBackpack'
		  }
		},
		```

		---

		## Español

		### Descripción

		Este recurso añade un objeto mochila al sistema de inventario de tu servidor.

		### Requisitos

		- `ox_lib`
		- `ox_inventory`
		- `es_extended`

		> Nota: Este recurso solo es compatible con las bibliotecas Ox.

		> **IMPORTANTE:** Coloca `backpack.png` en `ox_inventory/web/images`.

		### Configuración de inventario (items.lua)

		```lua
		['backpack'] = {
		  label = 'Mochila',
		  weight = 220,
		  stack = false,
		  consume = 0,
		  description = 'Una mochila con gran capacidad.',
		  client = {
		    export = 'backpack.openBackpack'
		  }
		},
		```

		---

		## Deutsch

		### Beschreibung

		Dieses Resource fügt ein Rucksack-Item zum Inventarsystem Ihres Servers hinzu.

		### Voraussetzungen

		- `ox_lib`
		- `ox_inventory`
		- `es_extended`

		> Hinweis: Diese Ressource ist nur mit Ox-Bibliotheken kompatibel.

		> **WICHTIG:** Platziere `backpack.png` in `ox_inventory/web/images`.

		### Inventarkonfiguration (items.lua)

		```lua
		['backpack'] = {
		  label = 'Rucksack',
		  weight = 220,
		  stack = false,
		  consume = 0,
		  description = 'Ein Rucksack mit großer Kapazität.',
		  client = {
		    export = 'backpack.openBackpack'
		  }
		},
		```

		---

		If you want, I can also add a short table of contents, badges, or an example usage snippet.
