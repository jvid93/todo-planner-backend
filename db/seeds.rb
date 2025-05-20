# Kategorien erstellen
work = Category.create!(name: 'Arbeit')
personal = Category.create!(name: 'Persönlich')
einkauf = Category.create!(name: 'Einkauf')

# Todos erstellen
Todo.create!(
  title: 'Bericht fertigstellen',
  description: 'Quartalsbericht für das Management fertigstellen',
  due_date: Date.today + 3.days,
  priority: 'High',
  category: work
)

Todo.create!(
  title: 'Lebensmittel einkaufen',
  description: 'Milch, Brot, Eier, Gemüse',
  due_date: Date.today,
  priority: 'Medium',
  category: einkauf
)

Todo.create!(
  title: 'Sporttraining',
  description: 'Joggen im Park',
  due_date: Date.today + 1.day,
  priority: 'Low',
  category: personal
)

puts 'Seed-Daten wurden erstellt!'
