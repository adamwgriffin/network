Company.destroy_all
User.destroy_all

seattle_grace = Company.create!(name: "Seattle Grace Hospital")
princeton_plainsboro = Company.create!(name: "Princeton-Plainsboro Teaching Hospital")
county_general = Company.create!(name: "County General Hospital")
sacred_heart = Company.create!(name: "Sacred Heart Hospital")
st_eligius = Company.create!(name: "St. Eligius Hospital")

User.create!([
  # Grey's Anatomy
  { first_name: "Meredith", last_name: "Grey", company: seattle_grace },
  { first_name: "Derek", last_name: "Shepherd", company: seattle_grace },
  { first_name: "Cristina", last_name: "Yang", company: seattle_grace },
  { first_name: "Miranda", last_name: "Bailey", company: seattle_grace },
  { first_name: "Richard", last_name: "Webber", company: seattle_grace },

  # House, M.D.
  { first_name: "Gregory", last_name: "House", company: princeton_plainsboro },
  { first_name: "Lisa", last_name: "Cuddy", company: princeton_plainsboro },
  { first_name: "James", last_name: "Wilson", company: princeton_plainsboro },
  { first_name: "Eric", last_name: "Foreman", company: princeton_plainsboro },
  { first_name: "Robert", last_name: "Chase", company: princeton_plainsboro },
  { first_name: "Allison", last_name: "Cameron", company: princeton_plainsboro },
  { first_name: "Remy", last_name: "Hadley", company: princeton_plainsboro }, # "Thirteen"
  { first_name: "Chris", last_name: "Taub", company: princeton_plainsboro },
  { first_name: "Lawrence", last_name: "Kutner", company: princeton_plainsboro },
  { first_name: "Amber", last_name: "Volakis", company: princeton_plainsboro },

  # ER
  { first_name: "John", last_name: "Carter", company: county_general },
  { first_name: "Doug", last_name: "Ross", company: county_general },

  # Scrubs
  { first_name: "J.D.", last_name: "Dorian", company: sacred_heart },
  { first_name: "Perry", last_name: "Cox", company: sacred_heart },
  { first_name: "Elliot", last_name: "Reid", company: sacred_heart },

  # St. Elsewhere
  { first_name: "Mark", last_name: "Craig", company: st_eligius }
])
