class AddTimestampsToArticles < ActiveRecord::Migration[6.1]
  def change
    # method, table where we adding a column, column name, column datatype
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
