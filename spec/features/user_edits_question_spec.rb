require "rails_helper"

feature "user may edit a question" do
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates
  #
  # Acceptance Criteria
  #
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

  scenario "user can edit a question" do
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
    expect(page).to have_link "Edit question"
  end

  scenario "user successfully edits a question" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    click_link question3.title
    click_link "Edit question"

    fill_in "Title", with: "The quick, brown fox jumps over a lazy cat"
    click_button "Update"
    expect(page).to have_content "Question updated!"
    expect(page).to have_content "The quick, brown fox jumps over a lazy cat"
  end

  scenario "user edits a question with invalid info" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "HerpderpHerpderpHerpderpHerpderpHerpderpHerpderp",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question3 = Question.create(title: "The quick, brown fox jumps over a lazy dog", description: "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs")
    question4 = Question.create(title: "Sed ut perspiciatis unde omnis iste natus", description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veri")

    visit questions_path
    click_link question3.title
    click_link "Edit question"

    fill_in "Title", with: "lol"
    click_button "Update"
    expect(page).to have_content "Question not updated, please check your input."
  end
end
