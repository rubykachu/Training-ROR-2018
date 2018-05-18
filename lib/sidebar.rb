# frozen_string_literal: true

class Sidebar < ActionView::Base
  include ActionView::Helpers::TagHelper
  include Rails.application.routes.url_helpers

  def render
    content_tag :ul, class: "nav" do
      list_items.each do |item|
        value = item.last
        klass_selected = value[:selected] ? "current" : ""
        concat(
          "<li class='#{klass_selected}'>
            <a href='#{value[:link]}'>
              <i class='glyphicon glyphicon-#{value[:icon]}'></i> #{value[:text]}
            </a>
          </li>".html_safe
        )
      end
    end
  end

  private

    def list_items
      {
        dashboard: {
          text: 'Dashboard',
          link: admin_path,
          icon: 'dashboard',
          selected: true
        },
        taxonomy: {
          text: 'Taxonomies',
          link: taxonomies_path,
          icon: 'inbox',
        },
        product: {
          text: 'Products',
          link: products_path,
          icon: 'gift'
        },
        user: {
          text: 'Users',
          link: users_path,
          icon: 'user',
        },
      }
    end
end
