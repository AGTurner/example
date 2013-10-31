require_relative 'jobs_parser'

class Sequencer

  def initialize(jobs)
    @jobs = jobs
    @sorted_jobs = []
  end

  def sequence
    return '' if @jobs.empty?
    JobsParser.new(@jobs).parse.each do |job, dep|
      unless @sorted_jobs.any? { |member| member == job }
        if dep.nil? || @sorted_jobs.any? { |member| member == dep }
          @sorted_jobs << job
        else
          @sorted_jobs << dep << job
        end
      end
    end
    @sorted_jobs
  end

end