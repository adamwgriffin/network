FriendlyId::Slug.delete_all
User.destroy_all
Company.destroy_all

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
  {
    first_name: "Meredith",
    last_name: "Grey",
    company: seattle_grace,
    credentials: "M.D.",
    about: "A brilliant but emotionally complex surgeon, Meredith is the central " \
      "character of Grey's Anatomy, known for her resilience and leadership."
  },
  {
    first_name: "Derek",
    last_name: "Shepherd",
    nickname: "McDreamy",
    company: seattle_grace,
    credentials: "M.D.",
    about: "Nicknamed \"McDreamy\", Derek is a world-class neurosurgeon and " \
      "Meredith's love interest, admired for his skill and charm."
  },
  {
    first_name: "Cristina",
    last_name: "Yang",
    company: seattle_grace,
    credentials: "M.D.",
    about: "An ambitious and highly skilled cardiothoracic surgeon, Cristina is " \
      "Meredith's best friend and a fan favorite for her wit and drive."
  },
  {
    first_name: "Miranda",
    last_name: "Bailey",
    company: seattle_grace,
    credentials: "M.D.",
    about: "Known for her tough love, Miranda is a dedicated general " \
      "surgeon and mentor to many at Seattle Grace."
  },
  {
    first_name: "Richard",
    last_name: "Webber",
    company: seattle_grace,
    credentials: "M.D.",
    about: "The long-time Chief of Surgery, Richard is a guiding force and father " \
      "figure to the hospital staff."
  },

  # House, M.D.
  {
    first_name: "Gregory",
    last_name: "House",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "A medical genius with a sharp tongue and a troubled soul, House is " \
      "famous for his unconventional diagnostic skills and abrasive personality."
  },
  {
    first_name: "Lisa",
    last_name: "Cuddy",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "The hospital's Dean of Medicine, Cuddy is smart, assertive, and often the " \
      "only one who can stand up to House."
  },
  {
    first_name: "James",
    last_name: "Wilson",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "An oncologist and House's best (and sometimes only) friend, Wilson is " \
      "compassionate and loyal."
  },
  {
    first_name: "Eric",
    last_name: "Foreman",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "A talented neurologist, Foreman is ambitious and often serves as House's " \
      "moral compass."
  },
  {
    first_name: "Robert",
    last_name: "Chase",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "A skilled intensivist and surgeon, Chase is known for his adaptability and " \
      "complex relationship with House."
  },
  {
    first_name: "Allison",
    last_name: "Cameron",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "An idealistic immunologist, Cameron is empathetic and often challenges " \
      "House's cynicism."
  },
  {
    first_name: "Remy",
    last_name: "Hadley",
    nickname: "Thirteen",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "Mysterious and fiercely intelligent, Thirteen is a diagnostician with a " \
      "guarded personal life."
  },
  {
    first_name: "Chris",
    last_name: "Taub",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "A former plastic surgeon, Taub is pragmatic and often brings a skeptical " \
      "perspective to House's team."
  },
  {
    first_name: "Lawrence",
    last_name: "Kutner",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "Known for his creative thinking, Kutner is an enthusiastic and " \
      "unconventional member of House's team."
  },
  {
    first_name: "Amber",
    last_name: "Volakis",
    company: princeton_plainsboro,
    credentials: "M.D.",
    about: "Highly competitive and driven, Amber is known for " \
      "her ruthless ambition."
  },

  # ER
  {
    first_name: "John",
    last_name: "Carter",
    company: county_general,
    credentials: "M.D.",
    about: "Starting as a medical student, Carter grows into a skilled and " \
      "compassionate doctor, beloved by colleagues and patients alike."
  },
  {
    first_name: "Doug",
    last_name: "Ross",
    company: county_general,
    credentials: "M.D.",
    about: "A charismatic pediatrician, Doug is known for his dedication to children " \
      "and his complicated personal life."
  },

  # Scrubs
  {
    first_name: "J.D.",
    last_name: "Dorian",
    company: sacred_heart,
    credentials: "M.D.",
    about: "The quirky and imaginative protagonist of Scrubs, J.D. is known for his " \
      "inner monologues and heartfelt approach to medicine."
  },
  {
    first_name: "Perry",
    last_name: "Cox",
    company: sacred_heart,
    credentials: "M.D.",
    about: "A sarcastic and brilliant attending physician, Dr. Cox is both a mentor " \
      "and tormentor to J.D."
  },
  {
    first_name: "Elliot",
    last_name: "Reid",
    company: sacred_heart,
    credentials: "M.D.",
    about: "A talented but neurotic doctor, Elliot is known for her intelligence, " \
      "insecurity, and evolving confidence."
  },

  # St. Elsewhere
  {
    first_name: "Mark",
    last_name: "Craig",
    company: st_eligius,
    credentials: "M.D.",
    about: "A renowned heart surgeon, Dr. Craig is demanding, brilliant, and often " \
      "difficult, but deeply respected at St. Eligius."
  }
])
