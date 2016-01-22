class Rake::Migrations::Task

  RUN_ONCE       = :once
  RUN_EVERY_TIME = :every

  attr_reader :name, :command, :frequency

  def initialize(name, attrs = {})
    @name      = name
    @command   = attrs[:command]
    @frequency = attrs[:frequency] || RUN_ONCE
  end

  def run_every_time?
    frequency == RUN_EVERY_TIME
  end

  def run_once?
    frequency == RUN_ONCE
  end

  def to_h
    {
      name => {
        command: command,
        frequency: frequency
      }
    }
  end

  def ==(other)
    name == other.name
  end
  alias_method :equal?, :==

end