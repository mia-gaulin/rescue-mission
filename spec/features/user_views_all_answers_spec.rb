require "rails_helper"

feature "user may view all answers to a question" do
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last

  scenario "user visits question detail page and can see all answers" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdfasdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    answer1 = Answer.create(description: "Bacon ipsum dolor amet brisket pork belly venison leberkas, prosciutto landjaeger pastrami ", question: question1)

    visit questions_path

    expect(page).to have_link(question1.title)
    click_link question1.title
    click_link "Post an answer to this question"

    fill_in "Description", with: "Catch all the pokemon! Here's a list: http://pokemondb.net/pokedex/national"

    click_button "Submit answer"

    expect(page).to have_content "Catch all the pokemon!"
    expect(page).to have_content "Bacon"
  end

  scenario "only answers to selected question are posted" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdfasdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    question2 = Question.create(title: "This is a fake question to test that I haven't messed up routing", description: "herpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderpherpderp")
    answer1 = Answer.create(description: "Bacon ipsum dolor amet brisket pork belly venison leberkas, prosciutto landjaeger pastrami ", question: question1)
    answer2 = Answer.create(description: "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.", question: question2)

    visit questions_path

    expect(page).to have_link(question1.title)
    click_link question1.title

    expect(page).to have_content "Bacon"
    expect(page).to_not have_content "That show's called a pilot."
  end

  scenario "answers are ordered by most recent last" do
    question1 = Question.create(title: "How can I be the very best like no one ever was?",
    description: "asdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdfasdkljfalksjdfkajsdklfjhaleuhfkahdfkahusdfhasdkfhaejfaljsef;ajsfo;aisfjaldskfjkasjdf")
    answer1 = Answer.create(description: "Bacon ipsum dolor amet brisket pork belly venison leberkas, prosciutto landjaeger pastrami ", question: question1)
    answer2 = Answer.create(description: "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing.", question: question1)
    answer3 = Answer.create(description: "Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.", question: question1)

    visit questions_path

    expect(page).to have_link(question1.title)
    click_link question1.title
    click_link "Post an answer to this question"

    fill_in "Description", with: "Catch all the pokemon! Here's a list: http://pokemondb.net/pokedex/national"

    click_button "Submit answer"

    expect(page).to_not have_content "Catch all the pokemon!"
    expect(page).to have_content "Bacon"
  end
end
