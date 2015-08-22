class AddLinkToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :link, :string
  end
end
