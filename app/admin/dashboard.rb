ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

   columns do

    div class: "saved_messages" do
        h3 "Welcome text"
        h4 "Hey, it's Votum. Thanks for signing up! Add us to your contacts so you recognize us next time we text you. P.S. If you ever need to unsubscribe just text STOP."
    end

    panel "Send Message" do
        para    # renders app/views/admin/dashboard/_send_first_message.html.erb
                render 'send_a_message', :layout => false

    end

     panel "Send Message" do
        para    # renders app/views/admin/dashboard/_send_message_all.html.erb
                render 'send_message_all', :layout => false

    end

     panel "Show Messages" do
        para    # renders app/views/admin/dashboard/_send_message_all.html.erb
            # ul do
            #     Post.recent(5).map do |post|
            #       li link_to(post.title, admin_post_path(post))
            #     end
            # end   
                render 'lists_responses', :layout => false
    end

   end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
