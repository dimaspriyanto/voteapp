class CreateVotings < ActiveRecord::Migration
  def self.up
    create_table :votings do |t|
      t.belongs_to :vote
      t.belongs_to :user
      t.string :choice

      t.timestamps
    end
  end

  def self.down
    drop_table :votings
  end
end
