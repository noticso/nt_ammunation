1) In server.cfg insert "ensure nt_ammunation"
2) In config.lua change TextLoc and Location (same vector, TextLoc needs to be a just a little bit higher)
3) In config.lua insert weapon object in Items following this syntax:
    {
      hash = 'Hash of the weapon that you want to give',
      name = 'Name that you want to display (If the name has space put an underscore)',
      img = "Directory of the image",
      id="w84" In ascending order,
      price= price in number,
    },
4) If you want to style the menu, go to nui/css/style.css