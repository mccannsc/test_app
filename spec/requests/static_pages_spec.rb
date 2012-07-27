require 'spec_helper'

describe "StaticPages" do #The comments after the describe means nothing to RSpec - it is for human use.  
 
 let(:base_title) { "Ruby on Rails Tutorial Test App" }
 
  describe "Home page" do
  
    it "should have the h1 'Test App'" do                     # This is also for human use and doesnt do anything
      visit '/static_pages/home'                              # This uses Capybara to say visit the Home page at /static_pages/home 
      page.should have_selector('h1', :text => 'Test App')     # This uses the page variable (provided by Capybara) to test ... 
      end                                                     # ... the resulting page has the right content
      
      it "should have the base title" do
        visit '/static_pages/home'
        page.should have_selector('title', :text => "Ruby on Rails Tutorial Test App")
     end
     
     it "should not have a custom page title" do
       visit '/static_pages/home'
       page.should_not have_selector('title', :text => '| Home')
     end
    end
    
  describe "Help page" do
  
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
   end
      
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                            :text => "#{base_title} | Help")
    end
  end  

  describe "About page" do
  
    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end
    
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', 
                            :text => "#{base_title} | About Us")
   end
  end
  
  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title', 
                            :text => "#{base_title} | Contact")
    end
  end
end