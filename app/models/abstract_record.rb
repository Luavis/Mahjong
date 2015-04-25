class AbstractRecord < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = "mh_"
end
