
def admin_email
  'test.guru.contact@gmail.com'
end

def print_msg(model, msg)
  puts "-> #{model}: #{msg} (#{model.count})"
end

def data_was_created(model)
  print_msg(model, 'Данные созданы')
end

def data_was_clear(model)
  print_msg(model, 'Данные очищены')
end

def table_empty(model)
  print_msg(model, 'Таблица пуста')
end

def id(model, params)
  model.where(params).pluck(:id).first
end

models = [Role, User, Category, Test, TestPassage, Question, Answer, Setting]
models.each do |model|
  if model.count > 0
    data_was_clear(model) if model.destroy_all
  else
    table_empty(model)
  end
end
puts

Setting.create!([
  {
    name: 'max_answers',
    setting: 'max_answers',
    value: '4'
  },
  {
    name: 'min_answers',
    setting: 'min_answers',
    value: '1'
  }
])
data_was_created(Setting)

Role.create!([
{
  name: 'Администратор',
},
{
  name: 'Пользователь'
}
])
data_was_created(Role)

Admin.create!([
{
  first_name: 'Имя',
  last_name: 'Фамилия',
  email: admin_email,
  email_contactable: true,
  password: '1234567890'
}
])
data_was_created(Admin)

RoleUser.create!([
  {
    user_id: id(User, { email: admin_email }),
    role_id: id(Role, { name: 'Администратор' })
  },
])
data_was_created(RoleUser)

Category.create!([
  { title: 'PHP' },
  { title: 'HTML' },
  { title: 'Ruby' },
])
data_was_created(Category)


Test.create!([
  { title: 'Основы PHP',
    level: 0,
    category_id: id(Category, { title: 'PHP' }),
  },
  {
    title: 'Основы HTML',
    level: 0,
    category_id: id(Category, { title: 'HTML' }),
  },
  {
    title: 'погружение в Ruby',
    level: 1,
    category_id: id(Category, { title: 'Ruby' }),
  },
  {
    title: 'Модели в Ruby',
    level: 0,
    category_id: id(Category, { title: 'Ruby' }),
  }
])
data_was_created(Test)

TestAuthor.create!([
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'Основы PHP' })
  },
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'погружение в Ruby' })
  },
  {
    user_id: id(User, { email: admin_email }),
    test_id: id(Test, { title: 'Модели в Ruby' })
  },
])
data_was_created(TestAuthor)



Question.create!([

  #Вопросы PHP
  {
    body: 'текст',
    level: 0,
    test_id: id(Test, { title: 'Основы PHP' })
  },
  {
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы PHP' })
  },
  {
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы PHP' })
  },

  #Вопросы HTML
  {
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },
  {
    body: 'текст',
    level: 1,
    test_id: id(Test, { title: 'Основы HTML' })
  },

  #Вопросы погружение в Ruby
  {
    body: 'текст',
    level: 0,
    test_id: id(Test, { title: 'погружение в Ruby' })
  },
  {
    body: 'текст',
    level: 0,
    sort: 1,
    test_id: id(Test, { title: 'погружение в Ruby' })
  },
  {
    body: 'текст',
    level: 0,
    sort: 2,
    test_id: id(Test, { title: 'погружение в Ruby' })
  },

  #Вопросы Модели в Ruby
  {
    body: 'текст',
    level: 0,
    sort: 0,
    test_id: id(Test, { title: 'Модели в Ruby' })
  },
  {
    body: 'текст',
    level: 0,
    sort: 1,
    test_id: id(Test, { title: 'Модели в Ruby' })
  },
])
data_was_created(Question)

Answer.create!([
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос"' }),
    correct: false
  },
  {
    body: '+',
    sort: 1,
    question_id: id(Question, { body: 'Вопрос"' }),
    correct: true
  },
  {
    body: '-',
    sort: 2,
    question_id: id(Question, { body: 'Вопрос"' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 1,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '+',
    sort: 2,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 1,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 2,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 3,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 1,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 2,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 1,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 2,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '+',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 0,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '+',
    sort: 1,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: true
  },
  {
    body: '-',
    sort: 2,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  },
  {
    body: '-',
    sort: 3,
    question_id: id(Question, { body: 'Вопрос' }),
    correct: false
  }
])
data_was_created(Answer)

puts "\nСоздана болочка данных"
