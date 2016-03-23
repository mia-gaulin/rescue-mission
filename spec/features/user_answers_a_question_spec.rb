require "rails_helper"

feature "user may answer a question" do
  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "user may answer a question" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdfasdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")

    visit questions_path

    expect(page).to have_link(question1.title)
    click_link question1.title

    expect(page).to have_content "Post an answer to this question"
  end

  scenario "user submits answer" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdfasdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")

    visit questions_path

    expect(page).to have_link(question1.title)
    click_link question1.title
    click_link "Post an answer to this question"

    fill_in "Description", with: "Catch all the pokemon! Here's a list: http://pokemondb.net/pokedex/national"

    click_button "Submit answer"

    expect(page).to have_content "Answer successfully submitted!"
  end

  scenario "user submits answer with incorrect properties" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdfasdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")

    visit questions_path

    expect(page).to have_link(question1.title)
    click_link question1.title
    click_link "Post an answer to this question"

    fill_in "Description", with: "Catch all the pokemon!"

    click_button "Submit answer"

    expect(page).to have_content "Answer was not saved, please check your input."
  end
end
