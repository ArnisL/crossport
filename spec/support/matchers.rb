RSpec::Matchers.define :have_enum do |enum|
  match do |subject|
    key = enum.keys.first
    options = enum.values.first
    subject.respond_to?(key) && \
      subject.class.send(key.to_s.pluralize).keys == options
  end
end
