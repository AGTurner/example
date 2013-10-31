require_relative 'jobs_parser'

class Sequencer

  def sequence(jobs)
    return '' if jobs.empty?
    sorted_jobs = []
    jobs_array = JobsParser.parse(jobs)
    jobs_array.each { |job_hash| job_hash.each { |job, dep| sorted_jobs << job } }
    sorted_jobs
  end

end