require "sortable_record/version"
require "active_support"

module SortableRecord
  extend ActiveSupport::Concern

  included do
    cattr_accessor :position_source_attr
    cattr_accessor :parent_source_attr
    before_create :set_default_position

    # -- Scopes --
    default_scope order(position_source_attr)
    scope :ordered, order(position_source_attr)
  end

  module ClassMethods
    def is_sortable(position_attr, parent_attr)
      self.position_source_attr = position_attr
      self.parent_source_attr = parent_attr
    end
  end

  def next
    sortable_scope.ordered.where("#{position_source_attr} > ?", send(position_source_attr)).first
  end

  def prev
    sortable_scope.ordered.where("#{position_source_attr} < ?", send(position_source_attr)).last
  end

private

  # Called before validation
  # sets the position to the next highest position for the scope
  def set_default_position
    unless send(position_source_attr)
      position = if parent
        sortable_scope.maximum(position_source_attr).to_i + 1
      else
        1
      end
      send("#{position_source_attr}=", position)
    end
  end

  # Scope for the list
  def sortable_scope
    parent.send(self.class.to_s.pluralize.downcase)
  end

  # Parent for the scope
  def parent
    self.send(parent_source_attr)
  end

end

ActiveRecord::Base.extend SortableRecord
