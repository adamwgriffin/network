Company.destroy_all
User.destroy_all

seattle_grace = Company.create!(
  name: "Seattle Grace Hospital",
  headquarters: "Seattle, Washington",
  description: "A renowned teaching hospital featured in Grey's Anatomy, " \
               "known for its high-stakes surgeries and dramatic staff relationships."
)
princeton_plainsboro = Company.create!(
  name: "Princeton-Plainsboro Teaching Hospital",
  headquarters: "Princeton, New Jersey",
  description: "The primary setting of House, M.D., famous for its diagnostic medicine " \
               "department led by Dr. Gregory House."
)
county_general = Company.create!(
  name: "County General Hospital",
  headquarters: "Chicago, Illinois",
  description: "The central hospital in ER, a busy urban medical center dealing with a " \
               "wide range of emergencies and personal stories."
)
sacred_heart = Company.create!(
  name: "Sacred Heart Hospital",
  headquarters: "San DiFrangeles, California",
  description: "The quirky hospital from Scrubs, known for its comedic staff " \
               "and heartfelt moments."
)
st_eligius = Company.create!(
  name: "St. Eligius Hospital",
  headquarters: "Boston, Massachusetts",
  description: "The setting for St. Elsewhere, a teaching hospital with a reputation " \
               "for both medical innovation and personal drama."
)

User.create!([
  # Grey's Anatomy
  { first_name: "Meredith", last_name: "Grey", company: seattle_grace, credentials: "M.D." },
  { first_name: "Derek", last_name: "Shepherd", company: seattle_grace, credentials: "M.D." },
  { first_name: "Cristina", last_name: "Yang", company: seattle_grace, credentials: "M.D." },
  { first_name: "Miranda", last_name: "Bailey", company: seattle_grace, credentials: "M.D." },
  { first_name: "Richard", last_name: "Webber", company: seattle_grace, credentials: "M.D." },

  # House, M.D.
  { first_name: "Gregory", last_name: "House", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Lisa", last_name: "Cuddy", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "James", last_name: "Wilson", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Eric", last_name: "Foreman", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Robert", last_name: "Chase", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Allison", last_name: "Cameron", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Remy", last_name: "Hadley", nickname: "Thirteen", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Chris", last_name: "Taub", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Lawrence", last_name: "Kutner", company: princeton_plainsboro, credentials: "M.D." },
  { first_name: "Amber", last_name: "Volakis", company: princeton_plainsboro, credentials: "M.D." },

  # ER
  { first_name: "John", last_name: "Carter", company: county_general, credentials: "M.D." },
  { first_name: "Doug", last_name: "Ross", company: county_general, credentials: "M.D." },

  # Scrubs
  { first_name: "J.D.", last_name: "Dorian", company: sacred_heart, credentials: "M.D." },
  { first_name: "Perry", last_name: "Cox", company: sacred_heart, credentials: "M.D." },
  { first_name: "Elliot", last_name: "Reid", company: sacred_heart, credentials: "M.D." },

  # St. Elsewhere
  { first_name: "Mark", last_name: "Craig", company: st_eligius, credentials: "M.D." }
])
