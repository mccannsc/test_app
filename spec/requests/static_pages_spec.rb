require 'spec_helper'

describe "Static pages" do

  subject { page }                                                      # This means that eveything underneath calls the page var

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end
  
  
  describe "Home page" do
    before { visit root_path }                                           # Each test in this block is on the home page and should
                                                                         # call rootpath before it runs the test.
    let(:heading) {'Test App' }                                          # The let command creates a local variable with the given
    let(:page_title)  { '' }                                             # value on demand, in contrast an instant variable is
                                                                        # created upon assignment.
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
    
    describe "for signed-in users" do                                   # To test the display of the status feed. We create a couple of microposts
      let(:user) {FactoryGirl.create(:user) }                           # and then verify that list element (li) appears on the page for each one. 
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      
      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)      # The first # is capybara syntax for CSS id, whereas the second is the beginning of a Ruby string interpolation.
        end
      end
      
    end
  end

  describe "Help page" do
    before { visit help_path }                                          # Same as visit root_path but it calls the help page first. 
    
    let(:heading) {'Help' }                                         
    let(:page_title)  { 'Help' } 
    
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    
    let(:heading) {'About' }                                          # The let command creates a local variable with the given
    let(:page_title)  { '' } 
    
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    
    let(:heading) {'Contact' }                                          # The let command creates a local variable with the given
    let(:page_title)  { 'Contact' } 
    
    it_should_behave_like "all static pages"
  end
end

  
