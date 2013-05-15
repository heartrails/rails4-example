class UrlFormatValidator < ActiveModel::EachValidator
  def self.valid?(value)
    URI.parse(value).kind_of?(URI::HTTP) rescue false
  end
  def validate_each(object, attribute, value)
    object.errors[attribute] << (options[:message] || I18n.t("errors.messages.invalid")) unless UrlFormatValidator.valid?(value)
  end
end
