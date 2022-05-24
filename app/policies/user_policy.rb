# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.super_admin?
  end

  def show?
    user.admin? || user.super_admin?
  end

  def new?
    user.admin? || user.super_admin?
  end

  def create?
    user.admin? || user.super_admin?
  end

  def edit?
    user.admin? || user.super_admin?
  end

  def update?
    user.admin? || user.super_admin?
  end

  def destroy?
    user.admin? || user.super_admin?
  end
end
