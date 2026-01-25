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
require "marcel" if defined?(Marcel)
# Departments & Programs
if defined?(Department) && defined?(Program)
  safe_reset_and_seed(Department) do

    # pkk_dept = Department.create!(name: "1041.01.5 «Փոխադրումների կազմակերպում և կառավարում երկաթուղային տրանսպորտում»", description: "Ծրագրավորում, ցանցեր, վեբ և կիբեր անվտանգություն")
    # rail_dept = Department.create!(name: "Երկաթուղային Տրանսպորտ", description: "Երկաթուղագծի համակարգեր և ենթակառուցվածքներ")
    # mech_dept = Department.create!(name: "Մեքենաշինություն", description: "Արդյունաբերական մեքենաներ, ավտոմատացում ու 3D մոդելավորում")
    #
    # Program.create!(name: "Վեբ Ծրագրավորում", description: "HTML, CSS, JS, Ruby", department: it_dept)
    # Program.create!(name: "Կիբերհոգեվորություն", description: "Հիմունքներ և անվտանգություն", department: it_dept)
    # Program.create!(name: "Երկաթուղային էլեկտրիֆիկացում", description: "Էլեկտրական համակարգեր", department: rail_dept)
    # Program.create!(name: "3D մոդելավորում", description: "Տեխնիկական գծագրություն", department: mech_dept)
    puts "Seeding programs and creating departments from program titles..."

 programs = [
   {
     code: "1041.01.5",
     title: "Փոխադրումների կազմակերպում և կառավարում երկաթուղային տրանսպորտում",
     education_basis: "Հիմնական ընդհանուր կրթության հիմքով",
     qualification: "Տեխնիկ-շահագործող՝ երկաթուղային տրանսպորտում փոխադրումների կազմակերպման և կառավարման",
     duration: "3 տարի 6 ամիս"
   },
   {
     code: "0714.11.5",
     title: "Ավտոմատիկան, հեռամեխանիկան և կապը երկաթուղային տրանսպորտում",
     education_basis: "Հիմնական ընդհանուր կրթության հիմքով",
     qualification: "Տեխնիկ՝ տրանսպորտային միջոցների հեռամեխանիկայի, կապի և ավտոմատ համակարգերի շահագործման և տեխնիկական սպասարկման",
     duration: "4 տարի"
   },
   {
     code: "0716.12.5",
     title: "Երկաթուղու էլեկտրաքարշի տեխնիկական շահագործում",
     education_basis: "Հիմնական ընդհանուր կրթության հիմքով",
     qualification: "Էլեկտրատեխնիկ՝ երկաթուղու էլեկտրաքարշի շահագործման և տեխնիկական սպասարկման",
     duration: "4 տարի"
   },
   {
     code: "0411.01.5",
     title: "Հաշվապահական հաշվառում",
     education_basis: "Հիմնական ընդհանուր կրթության հիմքով",
     qualification: "Հաշվապահ",
     duration: "4 տարի"
   },
   {
     code: "0612.02.5",
     title: "Հաշվողական տեխնիկայի միջոցներ և համակարգչային ցանցերի տեխնիկական սպասարկում",
     education_basis: "Հիմնական ընդհանուր կրթության հիմքով",
     qualification: "Տեխնիկ՝ հաշվողական տեխնիկայի և համակարգչային ցանցերի տեխնիկական սպասարկման",
     duration: "4 տարի"
   },
   # Mid-level (complete secondary) basis programs
   {
     code: "1041.01.5",
     title: "Փոխադրումների կազմակերպում և կառավարում երկաթուղային տրանսպորտում",
     education_basis: "Միջնակարգ (լրիվ) ընդհանուր կրթության հիմքով",
     qualification: "Տեխնիկ-շահագործող՝ երկաթուղային տրանսպորտում փոխադրումների կազմակերպման և կառավարման",
     duration: "3 տարի 6 ամիս"
   },
   {
     code: "0714.11.5",
     title: "Ավտոմատիկան, հեռուստամեխանիկան և կապը երկաթուղային տրանսպորտում",
     education_basis: "Միջնակարգ (լրիվ) ընդհանուր կրթության հիմքով",
     qualification: "Տեխնիկ՝ տրանսպորտային միջոցների հեռամեխանիկայի, կապի և ավտոմատ համակարգերի շահագործման և տեխնիկական սպասարկման",
     duration: "4 տարի"
   },
   {
     code: "0716.12.5",
     title: "Երկաթուղու էլեկտրաքարշի տեխնիկական շահագործում",
     education_basis: "Միջնակարգ (լրիվ) ընդհանուր կրթության հիմքով",
     qualification: "Էլեկտրատեխնիկ՝ երկաթուղու էլեկտրաքարշի շահագործման և տեխնիկական սպասարկման",
     duration: "4 տարի"
   },
   {
     code: "0716.13.5",
     title: "Երկաթուղային շարժակազմի տեխնիկական շահագործում",
     education_basis: "Միջնակարգ (լրիվ) ընդհանուր կրթության հիմքով",
     qualification: "Տեխնիկ՝ վագոնների տեխնիկական շահագործման",
     duration: "4 տարի"
   },
   {
     code: "0732.02.5",
     title: "Երկաթուղիների շինարարություն, երկաթգծի և գծային տնտեսության սպասարկում",
     education_basis: "Միջնակարգ (լրիվ) ընդհանուր կրթության հիմքով",
     qualification: "Տեխնիկ՝ երկաթգծի և գծային տնտեսության սպասարկման",
     duration: "4 տարի"
   }
 ]


  images_dir = Rails.root.join("db", "seeds", "images")
  supported_exts = %w[jpg jpeg png webp]

  programs.each_with_index do |p, idx|
    # Derive department name from program title (strip parentheses)
    dept_name = p[:title].split('(').first.strip

    department = Department.find_or_create_by!(name: dept_name) do |d|
      d.description = ""
    end

    prog_name = "#{p[:code]} — #{p[:title]} (#{p[:education_basis]})"

    desc_parts = []
    desc_parts << "Որակավորում՝ #{p[:qualification]}" if p[:qualification].present?
    desc_parts << "կրթության հիմք՝ #{p[:education_basis]}" if p[:education_basis].present?
    desc_parts << "Տևողություն՝ #{p[:duration]}" if p[:duration].present?
    description = desc_parts.join(" | ")

    program = Program.find_or_initialize_by(name: prog_name, department: department)

    program.description = description
    program.code = p[:code] if Program.column_names.include?("code")
    program.duration = p[:duration] if Program.column_names.include?("duration")
    program.qualification = p[:qualification] if Program.column_names.include?("qualification")

    saved = false
    if program.new_record? || program.changed?
      program.save!
      saved = true
    end

    # Attach image if program responds to ActiveStorage and no image attached
    if program.respond_to?(:image) && program.image.attached? == false
      attached = false

      # Try by code: e.g. 1041.01.5.jpg
      supported_exts.each do |ext|
        candidate = images_dir.join("#{p[:code]}.#{ext}")
        if File.exist?(candidate)
          content_type = (defined?(Marcel) ? Marcel::MimeType.for(Pathname.new(candidate)) : nil)
          program.image.attach(io: File.open(candidate), filename: File.basename(candidate), content_type: content_type)
          attached = true
          puts "  - Attached image by code for program #{program.name}: #{candidate}"
          break
        end
      end

      # Try slugified title (replace spaces and slashes with underscores)
      unless attached
        slug = p[:title].gsub(/[^\p{Alnum}\p{Blank}]+/u, "").gsub(/\s+/, "_")
        supported_exts.each do |ext|
          candidate = images_dir.join("#{slug}.#{ext}")
          if File.exist?(candidate)
            content_type = (defined?(Marcel) ? Marcel::MimeType.for(Pathname.new(candidate)) : nil)
            program.image.attach(io: File.open(candidate), filename: File.basename(candidate), content_type: content_type)
            attached = true
            puts "  - Attached image by slug for program #{program.name}: #{candidate}"
            break
          end
        end
      end

      # Fallback: try index-based filename like program_1.jpg
      unless attached
        supported_exts.each do |ext|
          candidate = images_dir.join("program_#{idx + 1}.#{ext}")
          if File.exist?(candidate)
            content_type = (defined?(Marcel) ? Marcel::MimeType.for(Pathname.new(candidate)) : nil)
            program.image.attach(io: File.open(candidate), filename: File.basename(candidate), content_type: content_type)
            attached = true
            puts "  - Attached image by index for program #{program.name}: #{candidate}"
            break
          end
        end
      end

      puts "  - No image found for program #{program.name}" unless attached
    else
      puts "  - Program already has image attached (skipping attach)" if program.respond_to?(:image)
    end

    action = saved ? "created/updated" : "ensured"
    puts "#{idx + 1}. #{action.capitalize}: #{program.name} (dept: #{department.name}, id: #{program.id})"
  end
end
  puts "Seeding complete."
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
