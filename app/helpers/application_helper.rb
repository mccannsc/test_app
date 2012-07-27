module ApplicationHelper                              # Modules give us a way to package together related methods, which can 
                                                      # then be mixed in to Ruby classes using include. 

#returns the full title on a per-page basis. 
def full_title(page_title)                            # Method Definition
  base_title = "Ruby on Rails Tutorial Test App"      # Variable Assignment
    if page_title.empty?                              # boolean test
      base_title                                      # Implicit return
      else
      "#{base_title} | #{page_title}"                 # String interpolation
      
     end
    end
end
