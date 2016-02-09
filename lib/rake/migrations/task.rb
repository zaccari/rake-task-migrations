class Rake::Migrations::Task

  attr_reader :name, :command

  def initialize(name, attrs = {})
    @name      = name
    @command   = attrs[:command]
  end

  def to_h
    {
      name => {
        command: command
      }
    }
  end

  def ==(other)
    name == other.name
  end
  alias_method :equal?, :==

end