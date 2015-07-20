require_relative 'associate.rb'
require_relative 'noun.rb'

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
      if (ggd_test(word) && is_noun?(word)) # if it passes ggd and is noun
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
      if (!(ggd_test(word)) && is_noun?(word)) # if it fails ggd and is noun
        non_ex = word
        break
      end
    end
  end
  non_ex
end

def get_opposite(word)
  associations_w_remaining = get_associations(word)
  if ggd_test(word)
    if associations_w_remaining[0].nil?
      opposite_word = nil
    else
      opposite_word = find_non_ex(associations_w_remaining[0])
    end
    remaining = associations_w_remaining[1]
  else
    if associations_w_remaining[0].nil?
      opposite_word = nil
    else
      opposite_word = find_ex(associations_w_remaining[0])
    end
    remaining = associations_w_remaining[1]
  end
  return [opposite_word, remaining]
end
