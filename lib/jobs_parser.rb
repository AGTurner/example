class JobsParser

  def self.parse(jobs)
    jobs.split("\n").map do |job|
      job_array = job.split("=>")
      job_array.push '' if job_array.count == 1
      job_array.each { |j| j.strip! }
      Hash[*job_array]
    end
  end

end