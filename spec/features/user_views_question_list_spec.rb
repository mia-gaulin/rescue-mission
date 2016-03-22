require "rails_helper"

feature "user views list of questions" do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  # Acceptance Criteria
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  scenario "see all the questions" do
    question = Question.create(title: "Trouble Configuring Capybara/R Spec For Rescue Mission", description: "I'm trying to get feature tests set up for use with the rescue_mission challenge, but am getting a slew of errors. I assume I'm not requiring everything I should be, but am lost as to what I'm missing.
    irb(main):003:1
    irb(main):004:1 My most recent error looks like this:
    irb(main):005:1
    irb(main):006:1 /Users/Misigno/.gem/ruby/2.2.3/gems/capybara-2.6.2/lib/capybara/rails.rb:5:in block (2 levels) in <top (required)>: uninitialized constant Rails (NameError)")

    visit questions_path
    expect(page).to have_content(question.title)
  end

  scenario "most recent question is listed first" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    expect(page).to_not have_content(question1.title)
  end
end
