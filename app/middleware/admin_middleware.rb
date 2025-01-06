class AdminMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    user = warden_user(env)

    if request.path.start_with?("/admin") && (!user || !user.isAdmin)
      return redirect_to_root
    end

    @app.call(env)
  end

  private

  def warden_user(env)
    env["warden"]&.user
  end

  def redirect_to_root
    [ 302, { "Location" => "/", "Content-Type" => "text/html" }, [ "Access denied" ] ]
  end
end
