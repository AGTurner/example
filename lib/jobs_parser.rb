class JobsParser

  def self.parse(jobs)
    job_with_dep = jobs.split("\n").map do |job|
      split_jobs = job.split("=>")
      split_jobs.each { |j| j.strip! }
      split_jobs.push nil if split_jobs.count == 1
      split_jobs
    end.flatten
    
    Hash[*job_with_dep]
  end

end