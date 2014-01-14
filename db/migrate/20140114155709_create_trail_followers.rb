class CreateTrailFollowers < ActiveRecord::Migration
  def change
    create_table :trail_followers do |t|
      t.belongs_to :trail
      t.belongs_to :follower
    end
  end
end
