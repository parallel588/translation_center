module ActsAsTranslator
  def acts_as_translator
    has_many :translations, foreign_key: :translator_id, class_name: 'TranslationCenter::Translation'
    acts_as_voter

    include InstanceMethods
  end

  module InstanceMethods
    # returns the translation a user has made for a certain key in a certain language
    def translation_for(key, lang)
      options = { translation_key_id: key.id, lang: lang.to_s, translator_type: self.class.name }
      self.translations.find_by(options) || self.translations.new(options)
    end

    # returns true if the user can admin translations
    def can_admin_translations?
      true
    end
  end
end

ActiveRecord::Base.extend ActsAsTranslator
