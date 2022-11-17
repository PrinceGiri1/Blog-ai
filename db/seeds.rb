require 'faker'
  puts "Start Createing Seed Data."

10.times do
  user = User.create(
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   about:  Faker::Lorem.paragraphs,
   avatar: Faker::Avatar.image,
   email: Faker::Internet.email,
   password: "12345")

  post = Post.create(
    title: Faker::Job.title,
    content: Faker::Lorem.sentences,
    is_publish: [true, false].sample,
    user_id: user.id,
    intro: Faker::Lorem.paragraph_by_chars(number: 120, supplemental: false)
  )
  tag = Tag.create(
    name: Faker::Books::CultureSeries.book
  )
  posttag = PostTag.create(
    post_id: post.id,
    tag_id: tag.id
  )
   @comment = Comment.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    message: Faker::Lorem.sentence,
    status: [true, false].sample,
    post_id: post.id)

    @message = Message.create(
      full_name: Faker::Name.name,
      email: Faker::Internet.email,
      content: Faker::Lorem.sentence
    )
    notif = [@commment, @message].sample
    @notification = Notification.create(notifiable: notif, notifiable_type: notif.class.name )
    puts "Succesfully Create"

end
  Setting.create!(
    blog_name: "Blog AI",
    post_per_page: 5,
    if_maintenance: false,
    about: "Blog AI is most famous and tranding website for fresher, Here you can learn Mechine Learning, Data Science, Data visualization and etc...")
    puts "Done"
