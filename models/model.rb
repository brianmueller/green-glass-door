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

def find_ex(associations_array)
  ex = ""
    associations_array.each do |word|
      if (ggd_test(word) && is_noun?(word)) # if it passes ggd and is noun
        ex = word
        break
      end
    end
  return ex
end

def find_non_ex(associations)
  non_ex = ""
    associations.each do |word|
      if (!(ggd_test(word)) && is_noun?(word)) # if it fails ggd and is noun
        non_ex = word
        break
      end
    end
  return non_ex
end

def get_opposite(word)
  associations_w_remaining = get_associations(word)
  if ggd_test(word)
    if associations_w_remaining["associations"].nil?
      opposite_word = nil
    else
      opposite_word = find_non_ex(associations_w_remaining["associations"])
    end
    remaining = associations_w_remaining["remaining"]
  else
    if associations_w_remaining["associations"].nil?
      opposite_word = nil
    else
      opposite_word = find_ex(associations_w_remaining["associations"])
    end
    remaining = associations_w_remaining["remaining"]
  end
  return {"opposite_word" => opposite_word, "remaining" => remaining}
end
