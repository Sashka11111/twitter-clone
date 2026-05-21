# Очищення бази даних
User.destroy_all
Post.destroy_all
Follow.destroy_all

puts "Creating users..."
# Створення тестових користувачів
u1 = User.create!(
  username: "sashka",
  email: "sashka@example.com",
  password: "password",
  password_confirmation: "password",
  bio: "Розробник цього Twitter Clone. Люблю Ruby on Rails та сучасний дизайн.",
  avatar_url: "https://api.dicebear.com/7.x/avataaars/svg?seed=sashka"
)

u2 = User.create!(
  username: "rails_guru",
  email: "guru@example.com",
  password: "password",
  password_confirmation: "password",
  bio: "Ruby on Rails Evangelist. Будую майбутнє вебу крок за кроком.",
  avatar_url: "https://api.dicebear.com/7.x/avataaars/svg?seed=guru"
)

u3 = User.create!(
  username: "design_master",
  email: "design@example.com",
  password: "password",
  password_confirmation: "password",
  bio: "UI/UX Designer. Створюю інтерфейси, які змушують серце битися частіше.",
  avatar_url: "https://api.dicebear.com/7.x/avataaars/svg?seed=design"
)

puts "Creating posts..."
# Пости для розробника
Post.create!(user: u1, content: "Привіт усім! Мій Twitter Clone нарешті працює на Rails 8! 🚀 #RoR #WebDev")
Post.create!(user: u1, content: "Glassmorphism — це справді круто виглядає. Що думаєте про дизайн?")

# Пости для гуру
Post.create!(user: u2, content: "Rails 8 приносить стільки нових можливостей! Solid Cache та Solid Queue — це зміна правил гри.")
Post.create!(user: u2, content: "Хто ще любить писати код на Ruby так само, як я? ❤️")

# Пости для дизайнера
Post.create!(user: u3, content: "Колірна палітра в цьому проекті дуже збалансована. Блакитний #1d9bf0 — це класика.")

puts "Setting up follows..."
# Підписки
u1.follow(u2)
u1.follow(u3)
u2.follow(u1)
u3.follow(u1)

puts "Seeds created successfully!"
