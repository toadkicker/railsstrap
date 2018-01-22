module Railsstrap
  module IconHelper
    # ==== Examples
    # icon(:share_alt)
    # # => <i class="far fa-share-alt"></i>
    # icon(:lock, :white)
    # # => <i class="far fa-lock fa-white"></i>
    # icon(:thumbs_up, :fas)
    # # => <i class="fas fa-thumbs-up"></i>
    # icon(:lock, library: :far, tag: :span)
    # # => <span class="far fa-lock"></span>
    def icon(*names)
      defaults = {library: :far, tag: :i}.freeze

      options = (names.last.kind_of?(Hash)) ? names.pop : {}
      opts = defaults.merge options

      names.map! {|name| name.to_s.gsub('_', '-')}
      names.map! do |name|
        name =~ /pull-(?:left|right)/ ? name : "fa-#{name}"
      end
      names.insert(0, opts[:library].to_s)

      content_tag opts[:tag], nil, :class => names
    end
  end
end