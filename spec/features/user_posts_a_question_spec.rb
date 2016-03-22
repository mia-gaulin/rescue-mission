require "rails_helper"

feature "user may post a question" do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "user may post a question" do
    visit questions_path

    expect(page).to have_link "Post a question"
  end

  scenario "user successfully posts a question" do
    visit questions_path
    click_link "Post a question"

    fill_in "Title", with: "This is a fake questionnnnnnnnnnnnnnnnnn"
    fill_in "Description", with: "HERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERPHERPDERP"
    click_button "Submit question"

    expect(page).to have_content "Questions"
    expect(page).to have_content "This is a fake questionnnnnnnnnnnnnnnnnn"
    expect(page).to have_content "Question created!"
  end

  scenario "user submits a question with incorrect data" do
    visit questions_path
    click_link "Post a question"

    fill_in "Title", with: "This question will not pass validation"
    fill_in "Description", with: "herp"
    click_button "Submit question"

    expect(page).to have_content "Question not created, please check your input."
  end
end
