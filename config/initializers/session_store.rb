if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_fridgy", domain: "fridgy.com"
else
    Rails.application.config.session_store :cookie_store, key: "_fridgy"
end