module ApplicationHelper
	def link_to_submit(*args, &block)
  	link_to_function (block_given? ? capture(&block) : args[0]), "$(this).closest('form').submit()", args.extract_options!
	end

	def states(country)
    Carmen::Country.coded(country).subregions.map { |s| [s.name, s.code] }
  end

  def country
    Carmen::Country.all.map { |s| [s.name, s.code] }
  end
end
