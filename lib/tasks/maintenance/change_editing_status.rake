namespace :maintenance do
  desc "Change editing status"
  task :change_editing_status => :environment do
    Document.over_ten_minutes.matching.update_all(status: 'editing')
  end
end