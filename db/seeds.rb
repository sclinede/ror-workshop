puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
SUBJECT_TITLES = [
  "Deleniti excepturi amet",
  "Iusto eligendi alias ut",
  "Vitae omnis voluptatum fugit",
  "Non inventore occaecati",
  "Tempora dolor voluptas"
]
FIRST_NAMES = %w(
  Samanta Autumn Gilda
  Kyler Bethany Leatha
  Pink Tania Idella
  Blaze Matteo Ferne
  Duncan Cordie Viola
  Otilia Lori Elfrieda
  Clarissa Rogers
)
LAST_NAMES = %w(
  Wilderman Witting Beahan Boyer
  Runolfsson Bayer Bechtelar Beatty
  Bradtke Ondricka Marquardt Schaden
  Satterfield Donnelly Goodwin Luettgen
  Bahringer Hirthe Rempel Anderson
)

User.create!(email: 'admin@admin.com', password: 'adminadmin') if User.count == 0

3.times do
  Teacher.create!(
    first_name: FIRST_NAMES.sample,
    last_name: LAST_NAMES.sample,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: SUBJECT_TITLES.sample,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: FIRST_NAMES.sample,
    last_name: LAST_NAMES.sample
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
