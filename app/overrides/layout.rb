# insert loading message
Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
                    :name => 'append_loading_message',
                    :insert_top => "#wrapper",
                    :text => %q{<div id="progress"><%= image_tag 'admin/progress.gif' %> <%= t(:loading) %>...</div>})
