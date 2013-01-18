module ApplicationHelper
    def app_id
        ENV['APP_ID']
    end

    def title_for(title)
        if(title.empty?)
            "Facebook Likes"
        else
            title
        end
    end
end
