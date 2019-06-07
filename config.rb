require 'govuk_tech_docs'
require 'find'

GovukTechDocs.configure(self)

class CreativeCommonsFooter < ::Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  def after_build(builder)
    build_dir = app.config[:build_dir]
    Find.find(build_dir) do |f|
      if f.end_with? '.html'
        content = File.read(f)
        patched_content = content.gsub(
          'https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/',
          'https://creativecommons.org/licenses/by-nc/4.0/',
        ).gsub(
          'Open Government Licence v3.0',
          'Creative Commons CC BY-NC-SA 4.0 Licence',
        )
        File.write(f, patched_content)
      end
    end
  end
end

Middleman::Extensions.register :creative_commons_footer do
  CreativeCommonsFooter
end

activate :creative_commons_footer
