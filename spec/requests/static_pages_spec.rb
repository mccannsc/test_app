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

  
