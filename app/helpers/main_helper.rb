module MainHelper
  
  def back_link
    content_tag :div, class: 'other_actions' do
      link_to 'javascript:history.go(-1)', class: 'back' do
        "#{fa_icon 'caret-left'} #{t('back')}".html_safe
      end
    end
  end
  
  def tracking_code
    return unless tracking_id
    
    tracking_output.html_safe
  end
  
  def tracking_output
    <<~HEREDOC
      <script type="text/javascript">
        var ssaUrl = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'clickserv.basis.net/conv/#{tracking_id}';
        new Image().src = ssaUrl;
        (function(d) {
          var syncUrl = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'pixel-a.basis.net/dmp/asyncPixelSync';
          var iframe = d.createElement('iframe');
          (iframe.frameElement || iframe).style.cssText = "width: 0; height: 0; border: 0;";
          iframe.src = "javascript:false";
          d.body.appendChild(iframe);
          var doc = iframe.contentWindow.document;
          doc.open().write('<body onload="window.location.href=\\'+syncUrl+\\'">');
          doc.close();
        })(document);
      </script>
    HEREDOC
  end
  
  def tracking_id
    return unless params[:id]
    
    {
      'be_in_touch' => 'fd3ca6713f47cf71',
      'what_is_your_name' => '9f600b9f7710506a',
      'thank_you' => '96d06be7bcd81d07'
    }[params[:id]]
  end
  
end
