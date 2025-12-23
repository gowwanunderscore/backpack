
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
		}
	},

==============================================

==== English ====

Hi there, this is a manual to install resources to your server!

First, you will need the following resources as prerequisites:

> ox_lib
> ox_inventory
> es_extended

Note: This resource is only compatible with Ox libraries

IMPORTANT: Place backpack.png in ox_inventory/web/images

==== Inventory Configuration [items.lua] ====

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

==============================================

==== Spanish / Español ====

¡Hola, este es un manual para instalar recursos en tu servidor!

Primero, necesitarás los siguientes recursos como requisitos previos:

> ox_lib
> ox_inventory
> es_extended

Nota: Este recurso solo es compatible con las bibliotecas Ox

IMPORTANTE: Coloque backpack.png en ox_inventory/web/images

==== Configuración de Inventario [items.lua] ====

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

==============================================

==== German / Deutsch ====

Hallo, dies ist eine Anleitung zur Installation von Ressourcen auf Ihrem Server!

Zunächst benötigen Sie die folgenden Ressourcen als Voraussetzungen:

> ox_lib
> ox_inventory
> es_extended

Hinweis: Diese Ressource ist nur mit Ox-Bibliotheken kompatibel

WICHTIG: Platzieren Sie backpack.png in ox_inventory/web/images

==== Bestandskonfiguration [items.lua] ====

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

==============================================
