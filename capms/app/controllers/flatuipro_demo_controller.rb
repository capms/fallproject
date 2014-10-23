class FlatuiproDemoController < ApplicationController
  def index
    x =User.find_by_email("djglover00@gmail.com")
    p "!" *200
    p x
    sign_in(x)
  end
end
