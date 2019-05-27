namespace :db do
    desc "更新投票數"
    task :update_vote => :environment do
        puts "開始！"
        Candidate.all.each do |candidate|
            Candidate.reset_counters(candidate.id, :votes)
            print "."
        end
        puts "完成！"
    end
end

