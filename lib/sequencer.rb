require_relative 'jobs_parser'
require_relative 'exceptions'

class Sequencer

  def initialize(jobs)
    @jobs = jobs.empty? ? nil : JobsParser.new(jobs).parse
    @sorted_jobs = []
  end

  def sequence
    return '' if @jobs.nil?
    @jobs.each do |job, dep|
      while !sorted(job)
        @circular_check = {}
        resolve_dependencies(job)
      end
    end
    @sorted_jobs
  end

  def get_dependency(job)
    if @jobs[job] == job
      raise SelfDependentException, "Jobs can't depend on themselves"
    else
      @jobs[job]
    end
  end

  def resolve_dependencies(job)
    if @circular_check[job]
      raise CircularDependenceException, "Jobs can't have circular dependencies"
    end
    @circular_check[job] = true

    if sorted(job)
      return
    elsif dep = get_dependency(job)
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