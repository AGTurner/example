require_relative 'jobs_parser'

class Sequencer

  def sequence(jobs)
    return '' if jobs.empty?
    sorted_jobs = []
    JobsParser.parse(jobs).each do |job, dep|
      unless sorted_jobs.any? { |member| member == job }
        if dep.nil?
          sorted_jobs << job
        else
          sorted_jobs << dep << job
        end
      end
    end
    sorted_jobs
  end

end