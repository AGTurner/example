require_relative 'jobs_parser'

class Sequencer

  def sequence(jobs)
    return '' if jobs.empty?
    sorted_jobs = []
    jobs_array = JobsParser.parse(jobs)
    jobs_array.each do |job_hash|
      job_hash.each do |job, dep|
        unless sorted_jobs.any? { |member| member == job }
          if dep.nil?
            sorted_jobs << job
          else
            sorted_jobs << dep << job
          end
        end
      end
    end
    sorted_jobs
  end

end