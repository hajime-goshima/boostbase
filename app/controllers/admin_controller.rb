class AdminController < ApplicationController

  # 管理者ページにフィルタ（Admin/Users以外）
  before_action :authenticate_admin_user!

end