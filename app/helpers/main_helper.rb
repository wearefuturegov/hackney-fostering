module MainHelper
  
  def back_link
    content_tag :div, class: 'other_actions' do
      link_to 'javascript:history.go(-1)', class: 'back' do
        "#{fa_icon 'caret-left'} #{t('back')}".html_safe
      end
    end
  end
  
end
