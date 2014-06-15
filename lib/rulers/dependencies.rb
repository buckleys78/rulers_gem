class Object
  def self.const_missing(c)
    return nil if @calling_const_missing
    @calling_const_missing = true
    require Rulers.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @calling_const_missing = false
    klass
  end
end

# class Object
#   def self.const_missing(c)
#     return nil if 'found in hash'
#     'add to hash'
#     require Rulers.to_underscore(c.to_s)
#     klass = Object.const_get(c)
#     'remove from hash'
#     klass
#   end
# end
