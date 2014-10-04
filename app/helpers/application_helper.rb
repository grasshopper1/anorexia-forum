module ApplicationHelper
	def bootstrap_devise_error_messages!
		return '' if resource.errors.empty?

		messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
		sentence = I18n.t('errors.messages.not_saved',
		                  count: resource.errors.count,
		                  resource: resource.class.model_name.human.downcase)

		html = <<-HTML
	<div class="alert alert-danger alert-block">
	   <button type="button" class="close" data-dismiss="alert">x</button>
	   <h5>#{sentence}</h4>
	   #{messages}
	</div>
		HTML

		html.html_safe
	end

	def bootstrap_devise_messages!
		classes = %w(alert-block)
		if notice
			classes << 'alert'
			classes << 'alert-info'
			message = notice
		elsif alert
			classes << 'alert'
			classes << 'alert-warning'
			message = alert
		else
			return ''
		end

		html = <<-HTML
	<div class="#{classes.join(' ')}">
	   <button type="button" class="close" data-dismiss="alert">x</button>
	   #{message}
	</div>
		HTML

		html.html_safe
	end
end
