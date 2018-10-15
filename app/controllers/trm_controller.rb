class TrmController < ApplicationController

def nuevo
@trm = Trm.new
@trm.dollar = 1
@trm.save
end

end
