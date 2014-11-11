class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create

    x = !!(params[:user][:email] =~ /[@]+/)
    if x
      super
    else
      pawprint= params[:user][:email]
      password = params[:user][:password]
      string = "https://djgwdb.babbage.cs.missouri.edu/ldap_test/ldap.php?user=#{pawprint}&popcorn=#{password}"
      response = HTTParty.get("https://djgwdb.babbage.cs.missouri.edu/ldap_test/ldap.php?user=#{pawprint}&popcorn=#{password}")
      if response.body == "false\n"
        redirect_to new_user_session_url, :flash => { :sign_in_errors => "Incorrect Pawprint/Password Combination" }
      else
        body = JSON.parse(response.body)
        result_bool = body["result"]
        pawprint = body["user"]["username"]
        full_name = body["user"]["fullname"]
        p "Full name! " * 15
        p body

        x = full_name.scan(/([a-zA-Z]*)\b/)

        p "one! " * 100
        last_name = x[0][0]
        first_name =  x[2][0]
              # p five
        email = body["user"]["emails"][0]
        user = User.find_by_pawprint(pawprint)
        #if user exists in DB -> sign_in(@user)
        if user
          sign_in(user)
          redirect_to root_url
        #else create a new user and then sign_in(@user)
        else
          user = User.create(pawprint: pawprint, email: email, password: "password", first_name: first_name, last_name: last_name)
          sign_in(user)
          redirect_to root_url
        end
      end
    end
    #how does new go to create? post create, what are params and how does http party use them? maybe p perams here to find out, create some sort of interrupt. without super you should be able to get in between
    #http party the params to php site
    #save response
    #parse response
    #search for user
    #if exists -> sign_in(@user)

    #redirect to wherever, have that page check that all paramaters are filled out, etc, etc

    #uncomment super to go back to email, password
    # super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
