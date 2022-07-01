class AddRoleToUser2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth_token, :string
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :dob, :date
    add_column :users, :otp, :integer
    add_column :users, :otp_generated_at, :datetime
  end
end
