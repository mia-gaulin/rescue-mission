require "rails_helper"

feature "user may delete a question" do
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions
  #
  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted

  scenario "user can access delete page from question details page" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    click_link question3.title

    expect(page).to have_button "Delete question"
  end

  scenario "user can access delete page from question edit page" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    click_link question3.title
    click_link "Edit question"

    expect(page).to have_button "Delete question"
  end

  scenario "question is successfully deleted" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    click_link question3.title
    click_button "Delete question"

    expect(page).to_not have_content question3.title
    expect(page).to have_content question4.title
  end
end
