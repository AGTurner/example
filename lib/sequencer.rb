require_relative 'jobs_parser'

class Sequencer

  def initialize(jobs)
    @jobs = jobs.empty? ? nil : JobsParser.new(jobs).parse
    @sorted_jobs = []
  end

  def sequence
    return '' if @jobs.nil?
    @jobs.each do |job, dep|
      while !sorted(job)
        resolve_dependencies(job)
      end
    end
    @sorted_jobs
  end

  def resolve_dependencies(job)
    if sorted(job)
      return
    elsif dep = @jobs[job]
      if sorted(dep)
        @sorted_jobs << job
      else
        resolve_dependencies(dep)
      end
    else
      @sorted_jobs << job
    end
  end

  def sorted(job)
    @sorted_jobs.any? { |member| member == job }
  end

end