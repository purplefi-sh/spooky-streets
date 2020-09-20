# == Schema Information
#
# Table name: tweets
#
#  id              :bigint           not null, primary key
#  location_point  :geometry         point, 0
#  location_string :string
#  text            :string
#  twitter_id      :string
#
class Tweet < ApplicationRecord
end
