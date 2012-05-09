module LoginHelper
  def login_url
    "/login/#{@user.login}"
  end
end
