class Article < ActiveRecord::Base
  #acts_as_content_block
  #has_many_attachments :avatars, :styles => { :ava => "140x90#", :thumb => "100x100#", :preview => "440x440#" }

  has_one :page, as: :custom_page, dependent: :destroy
  accepts_nested_attributes_for :page
  attr_accessible :page, :page_attributes

  attr_accessible :name, :description, :short_descr
  attr_accessible :published, :deleted, :archived, :created_by, :updated_by, :version, :lock_version

  attr_accessible :avatar
  mount_uploader :avatar, ArticleAvatarUploader
  attr_accessible :remove_avatar, :avatar_cache

  translates :name, :short_descr, :description
  accepts_nested_attributes_for :translations
  attr_accessible :translations, :translations_attributes

  class Translation
    attr_accessible :locale, :name, :short_descr, :description
    belongs_to :article, class_name: Article

    rails_admin do
      edit do

      end

      nested do
        field :locale, :hidden
        field :name
        field :short_descr
        field :description

      end
    end
  end

  before_save :init_page

  def init_page
    if !page
      build_page
    end

    I18n.available_locales.each do |locale|
      I18n.with_locale locale do
        page.path = name.parameterize
        page.name = name.parameterize

      end
      page.save
    end


  end

  after_save :check_page, :reload_routes_if_published_changed

  def reload_routes_if_published_changed
    if self.published_changed?
      DynamicRouter.reload
    end
  end

  def check_page
    if !page
      p = Page.new
      p.controller ||= 'articles'
      p.action ||= 'item'
      #p.layout ||= 'application'
      p.save
      self.page = p
    end

    p = self.page



    self.translations_by_locale.keys.each do |locale|

      translation = self.translations_by_locale[locale]

      if translation.name.nil? || translation.name.length == 0

        translation.name = "article-#{id}"
        translation.save
      end



      t = p.translations_by_locale[locale]
      if !t
        t = p.translations.new(locale: locale)
      end

      if t.path.nil? || t.path.length == 0
        t.path = "#{translation.name.parameterize}"
        #translation.save
        p.translations.push(t)
        p.save
        t.save
      end

      I18n.with_locale locale do
        # if p.path.nil? || p.path.length == 0
        #   p.path = "/#{locale.to_s}/appartments/#{self.name.parameterize}"
        # end


      end
    end


    p.save
  end


  rails_admin do
    edit do
      field :published
      field :avatar
      #field :deleted
      #field :archived
      #field :created_by
      #field :updated_by
      #field :version
      #field :lock_version

      field :translations, :globalize_tabs


      field :page
    end

    list do
      field :published
      field :name
      field :short_descr
      field :description
    end
  end

end
