module CharactersHelper
  def planet_image(planet_name)
    # Hash associant les planètes à leurs fichiers image
    planet_images = {
      "Earth (Replacement Dimension)" => "earth_c137.png",
      "Abadango" => "abadango.png",
      "Citadel of Ricks" => "citadel_of_ricks.png",
      "Worldender's Lair" => "worldenders_lair.png",
      "Anatomy Park" => "anatomy_park.png",
      "Interdimensional Cable" => "interdimensional_cable.png",
      "Immortality Field Resort" => "immortality_field_resort.png",
      "Post-Apocalyptic Earth" => "post_apocalyptic_earth.png",
      "Purge Planet" => "purge_planet.png",
      "Testicle Monster Dimension" => "testicle_monster_dimension.png"
    }
    planet_images[planet_name] || "default_planet.png"

  end
end
