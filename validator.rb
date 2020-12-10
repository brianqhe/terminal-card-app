module Validators
    def self.validate_input(input)
      # convert input to integer
      num_input = input.to_i
      # if integer == 1..4 return true
      if num_input > 0 && num_input < 6
        return true
      # else return false
      else
        return false
      end
    end

    def self.validate_round2(higher_or_lower)
        if higher_or_lower == 'higher' || higher_or_lower == 'lower'
            return true
        else
            return false
        end
    end

    def self.validate_round1(red_or_black)
        if red_or_black == 'red' || higher_or_lower == 'black'
            return true
        else
            return false
        end
    end

end