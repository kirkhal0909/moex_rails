class ApplicationSerializer
  class_attribute :attribute_names
  attr_accessor :input, :object, :pos

  def initialize(input)
    @input = input
  end

  def self.attributes(*names)
    self.attribute_names = names.map(&:to_sym)
    attribute_names.each do |attribute|
      define_method(attribute) do
        object[attribute] || object[attribute.to_s]
      end
    end
  end

  def to_hash
    if input.is_a?(Hash)
      @object = input
      return serialize_object
    end

    input.each_with_object([]) do |element, objects|
      @object = element
      objects << serialize_object
    end
  end

  def to_json
    to_hash.to_json
  end

  def as_json
    to_hash.as_json
  end

  def serialize_object
    serialized_object = {}
    attribute_names.each do |attribute|
      serialized_object[attribute.to_sym] = send(attribute)
    end
    serialized_object
  end
end
