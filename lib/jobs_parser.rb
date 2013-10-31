class JobsParser

  def self.parse(jobs)
    jobs.split("\n").map do |job|
      job_array = job.split("=>")
      job_array.each { |j| j.strip! }
      job_array.push nil if job_array.count == 1
      Hash[*job_array]
    end
  end

end