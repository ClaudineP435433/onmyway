class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  config.action_view.embed_authenticity_token_in_remote_forms = true
end
