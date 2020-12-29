class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.kind == 'salesman'
        # https://stackoverflow.com/questions/44497687/a-gem-cancan-access-denied-maincontroller-dashboard?answertab=votes#tab-top
        can :dashboard, :all
        can :access, :rails_admin
        can :read, :dashboard
        can :manage, Client, user_id: user.id
        can :manage, Sale, user_id: user.id
        can :read, Product, status: :active
        can :read, Discount, status: :active
        can :read, Comission, user_id: user.id
        can :manage, ProductQuantity, user_id: user.id
        can :manage, Address, user_id: user.id
        can :manage, Company
        can :manage, CompanyUser
        can :read, User
        # can :manage, :all
      elsif user.kind == 'manager'
        can :manage, :all
      end
    end
  end
end
