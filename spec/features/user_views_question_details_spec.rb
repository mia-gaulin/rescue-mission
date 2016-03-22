require "rails_helper"

feature "user may view the details of a question" do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario "user may click individual question page" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    
    expect(page).to have_link(question3.title)
  end

  scenario "user views individual question page" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    click_link question3.title

    expect(page).to have_content(question3.title)
    expect(page).to have_content(question3.description)
  end
end
