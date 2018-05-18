# frozen_string_literal: true

module AdminHelper
  def render_box_header(records, options = { title: nil, button: nil, icon: nil })
    render(
      "admin/component/box_header", records: records, title: options[:title],
      button: options[:button], icon: options[:icon]
    )
  end
end
