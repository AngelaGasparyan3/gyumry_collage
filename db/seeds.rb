# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# db/seeds.rb
# Safe seeding: only attempt to use models if their tables exist.

# Helper: safe destroy_all/create! only if table exists
def safe_reset_and_seed(model_class, &block)
  table = model_class.table_name
  if ActiveRecord::Base.connection.data_source_exists?(table)
    model_class.destroy_all
    yield if block_given?
    puts "Seeded #{model_class.name} (table: #{table})"
  else
    puts "Skipping #{model_class.name} - table #{table} does not exist yet"
  end
end

# Departments & Programs
if defined?(Department) && defined?(Program)
  safe_reset_and_seed(Department) do
    it_dept = Department.create!(name: "Ծրագրավորում և ՏՏ", description: "Ծրագրավորում, ցանցեր, վեբ և կիբեր անվտանգություն")
    rail_dept = Department.create!(name: "Երկաթուղային Տրանսպորտ", description: "Երկաթուղագծի համակարգեր և ենթակառուցվածքներ")
    mech_dept = Department.create!(name: "Մեքենաշինություն", description: "Արդյունաբերական մեքենաներ, ավտոմատացում ու 3D մոդելավորում")

    Program.create!(name: "Վեբ Ծրագրավորում", description: "HTML, CSS, JS, Ruby", department: it_dept)
    Program.create!(name: "Կիբերհոգեվորություն", description: "Հիմունքներ և անվտանգություն", department: it_dept)
    Program.create!(name: "Երկաթուղային էլեկտրիֆիկացում", description: "Էլեկտրական համակարգեր", department: rail_dept)
    Program.create!(name: "3D մոդելավորում", description: "Տեխնիկական գծագրություն", department: mech_dept)
  end
else
  puts "Department/Program models not defined; skipping department seeds"
end

# Contact messages
if defined?(ContactMessage)
  if ActiveRecord::Base.connection.data_source_exists?(ContactMessage.table_name)
    ContactMessage.destroy_all
    # Optionally create an example contact message:
    ContactMessage.create!(name: "Արմեն Օրագիրը", email: "armen@example.com", message: "Բարի գալուստ GSTC քոլեջ!")
    puts "Seeded ContactMessage"
  else
    puts "Skipping ContactMessage seeds - table #{ContactMessage.table_name} missing"
  end
else
  puts "ContactMessage model not defined; skipping"
end
# Create default SiteSetting if absent
if ActiveRecord::Base.connection.data_source_exists?('site_settings')
  SiteSetting.find_or_create_by!(id: 1) do |s|
    s.site_name = "Գյումրու Պետական Տեխնիկական Քոլեջ"
    s.hero_alt  = "Գյումրի բարև"
  end
else
  puts "site_settings table not present; run rails db:migrate"
end

# Create initial locales if they don't exist
Locale.find_or_create_by!(code: 'hy') do |l|
  l.name = 'Հայերեն'
  l.enabled = true
  l.default_locale = true
  l.position = 0
end

Locale.find_or_create_by!(code: 'en') do |l|
  l.name = 'English'
  l.enabled = true
  l.default_locale = false
  l.position = 1
end
