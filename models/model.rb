def ggd_test(item)
  !(/(.)\1/ !~ item)
end

def ggd_can(item)
  ggd_test(item) ? "CAN" : "CAN'T"
end

def ggd_color(item)
  ggd_test(item) ? "green" : "red"
end