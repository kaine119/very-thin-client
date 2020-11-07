class Counter < ApplicationRecord
  after_initialize :init

  def init
    self.count ||= 0
  end
end
