class AddGitInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :git_home_page, :string
    add_column :users, :public_repos, :integer
    add_column :users, :private_repos, :integer
  end
end
