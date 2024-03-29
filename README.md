
<a name="readme-top"></a>




<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/github_username/repo_name">
    <img src="https://github.com/noticso/nt_ammunation/assets/76558194/4804ee90-846b-45bc-be97-33cfe917e27d" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">nt_ammunation</h3>

  <p align="center">
    Un semplice shop delle armi con delle fantastiche features, aggiornato constanemente!
    <br />
    <a href="https://github.com/noticso/nt_ammunation"><strong>Esplora le docs »</strong></a>
    <br />
    <br />
    <a href="https://streamable.com/cbmavc">Guarda la demo</a>
    ·
    <a href="https://github.com/noticso/nt_ammunation/issues">Segnala Bug</a>
    ·
    <a href="https://github.com/noticso/nt_ammunation/issues">Richiedi Features</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Tabella dei contenuti</summary>
  <ol>
    <li>
      <a href="#progetto">A proposito del progetto...</a>
      <ul>
        <li><a href="#costruito-con">Costruito con</a></li>
      </ul>
    </li>
    <li>
      <a href="#inizia">Inizia</a>
      <ul>
        <li><a href="#pre-requisiti">Pre-requisiti</a></li>
        <li><a href="#installazione">Installazione</a></li>
      </ul>
    </li>
    <li><a href="#utilizzo">Come utilizzarlo</a></li>
    <li><a href="#contribuire">Contribuire</a></li>
    <li><a href="#contact">Contatti</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## Progetto

![weaponshop](https://github.com/noticso/nt_ammunation/assets/76558194/9c0a7ce4-eb71-46d2-9821-6ff8cf2f8551)



<p align="right">(<a href="#readme-top">torna all'inizio</a>)</p>



### Costruito con 

* [![Next][Next.js]][Next-url]
* [![React][React.js]][React-url]

<p align="right">(<a href="#readme-top">torna all'inizio</a>)</p>



<!-- GETTING STARTED -->
## Inizia

Per iniziare dovrai:

### Pre-requisiti
1. Avere una base FiveM con le ox resources [(ox_inventory, ox_lib, ox_mysql)](https://overextended.dev/)
2. Installare il [(gridsystem)](https://github.com/Profex1999/gridsystem)

### Installazione


1. Clona la repository
   ```sh
   git clone https://github.com/noticso/nt_crafting.git
   ```
2. Inserisci la tua location in `client.lua`
   ```lua
   local location = vector3(x,y,z)
   ```
3. Configura il tuo marker in `client.lua`
   ```lua
    TriggerEvent('gridsystem:registerMarker', {
		name = "MarkerName",
		pos = location,
		size = vector3(1.2, 1.2, 1.2),
		scale = vector3(0.8, 0.8, 0.8),
		control = 'E',
		rotate = 0.0,
		rotate2 = 0.0,
		shouldBob = false,
		shouldRotate = true,
		color =  { r = R , g = G, b = B },
		trasparent = 255,
		type = -1, -- se hai una texture lascia -1, altrimenti cambia il numero
		texture = "TextureName",
		msg = 'Weapon Shop',
		action = function()
			CreateThread(function()
				TriggerEvent('nt_crafting:SetDisplay', true)
				while display do 
					DisableControlAction(0,1, display)
    				DisableControlAction(0,142, display)
    				DisableControlAction(0,18, display)
    				DisableControlAction(0,322, display)
    				DisableControlAction(0,2, display)
    				DisableControlAction(0,106, display)
					Wait(0)
				end
			end)
		end
	})
   ```
4. Configura il tuo menu in `config.lua`
   ```lua
    {
        hash = 'WEAPON_HASH',
        name = 'Weapon_Name',
        img = "./img/WEAPON_HASH.png",
        ammoname = 'ammo-weapon',
        id = "wNUMBER",
        price = PRICE,
    },
   ```

<p align="right">(<a href="#readme-top">torna all'inizio</a>)</p>



<!-- USAGE EXAMPLES -->
## Utilizzo

Guarda questo video per vedere l'utilizzo di questo script di FiveM

[Link Video](https://streamable.com/cbmavc)



<!-- CONTRIBUTING -->
## Contribuire

Se vuoi contribuire a questo script segui questo passaggi

1. Fai un Fork del Progetto
2. Crea il tuo branch delle feature (`git checkout -b feature/FeatureStupende`)
3. Conferma le tue modifiche (`git commit -m 'Add some FeatureStupende'`)
4. Invia il branch (`git push origin feature/FeatureStupende`)
5. Apri una Pull Request

<p align="right">(<a href="#readme-top">torna all'inizio</a>)</p>




<!-- CONTACT -->
## Contact

[Discord](https://discord.gg/uY9agGndYs) - @noticso

Project Link: [https://github.com/noticso/nt_ammunation](https://github.com/noticso/nt_ammunation)

<p align="right">(<a href="#readme-top">torna all'inizio</a>)</p>




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Next.js]: https://img.shields.io/badge/lua-007bff?style=for-the-badge&logo=lua&logoColor=white
[Next-url]: https://www.lua.org/
[React.js]: https://img.shields.io/badge/javascript-000000?style=for-the-badge&logo=javascript&logoColor=yellow
[React-url]: https://javascript.info/
