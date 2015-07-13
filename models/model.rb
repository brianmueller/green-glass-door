require_relative 'associate.rb'

def ggd_test(item)
  !(/(.)\1/ !~ item.downcase)
end

def ggd_can(item)
  ggd_test(item) ? "CAN" : "CAN'T"
end

def ggd_color(item)
  ggd_test(item) ? "green" : "red"
end

def find_ex(associations)
  ex = ""
  while ex == ""
    associations.each do |word|
      if ggd_test(word) # if it passes
        ex = word
        break
      end
    end
  end
  ex
end

def find_non_ex(associations)
  non_ex = ""
  while non_ex == ""
    associations.each do |word|
      if !(ggd_test(word)) # if it fails
        non_ex = word
        break
      end
    end
  end
  non_ex
end

def get_opposite(word)
  ggd_test(word) ? find_non_ex(get_associations(word)) : find_ex(get_associations(word))  
end

# puts get_opposite("mouse")
