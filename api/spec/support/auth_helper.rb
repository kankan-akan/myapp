module AuthHelper
  HTTP_HELPERS_TO_OVERRIDE = [:get, :post, :patch, :put, :delete]

  HTTP_HELPERS_TO_OVERRIDE.each do |helper|
    define_method(helper) do |path, **args|
      add_auth_headers(args)
      args == {} ? super(path) : super(path, **args)
    end
  end

  def login(admin_range)
    @AdminRange = admin_range
    @auth_token = @AdminRange.create_new_auth_token
  end

  def logout
    @AdminRange = nil
    @auth_token = nil
  end

  def login(user)
    @user = user
    @auth_token = @user.create_new_auth_token
  end

  def logout
    @user = nil
    @auth_token = nil
  end

  private

  def add_auth_headers(args)
    return unless defined? @auth_token
    args[:headers] ||= {}
    args[:headers].merge!(@auth_token)
  end
end