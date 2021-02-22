class ApplicationController < ActionController::Base
  before_action :basic_auth                                         #privateメソッド先にbasic認証を導入する記述


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_2"] && password == ENV["BASIC_AUTH_PASSWORD_2"]  # 環境変数を読み込む記述に変更
    end
  end
end
