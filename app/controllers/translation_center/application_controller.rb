module TranslationCenter
  class ApplicationController < ActionController::Base
    before_filter :translation_langs_filters
    before_filter :authenticate_translator_user!
    helper_method :translator_current_user

    if Rails.env.development?

      # if an exception happens show the error page
      rescue_from Exception do |exception|
        @exception = exception
        @path = request.path

        render "translation_center/errors/exception"
      end

    end

    # defaults
    def translation_langs_filters
      session[:current_filter] ||= 'untranslated'
      session[:lang_from] = :en
      session[:lang_to] = app_params[:lang_to] || session[:lang_to] || :en
      I18n.locale = session[:lang_from] || I18n.default_locale
    end

    protected

    def authenticate_translator_user!
      send(TranslationCenter::CONFIG['authentication_method'] || 'authenticate_user!')
    end

    def translator_current_user
      @translator_current_user ||= send((TranslationCenter::CONFIG['current_user_method'] || 'current_user').to_sym)
    end




    def can_admin?
      translator_current_user.can_admin_translations?
    end

    def set_page_number
      app_params[:page] ||= 1
      @page = app_params[:page].to_i
    end

    def app_params
      params.permit!
    end

  end
end
