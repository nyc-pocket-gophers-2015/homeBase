# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'Member'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

Merit::Badge.create!(
  id: 1,
  name: "Responsible",
  description: "Did 5 tasks in one day"
)
Merit::Badge.create!(
  id: 2,
  name: "Little Helper",
  description: "Did 5 unassigned tasks"
)
Merit::Badge.create!(
  id: 3,
  name: "Saver",
  description: "Saved 100 points"
)
Merit::Badge.create!(
  id: 4,
  name: "The Kid With Everything",
  description: "Bought the most expensive prize available"
)
