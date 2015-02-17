class PostPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user == nil
        scope.none
      elsif user.admin? || user.moderator?
        scope.all
      else
        scope.where(user: user) 
      end
    end
  end

  def index?
    true
  end
end