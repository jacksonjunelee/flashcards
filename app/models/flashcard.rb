class Flashcard < ApplicationRecord
  attr_accessor :attempts

  def next
    self.class.where("id > ?", id).first
  end
end
