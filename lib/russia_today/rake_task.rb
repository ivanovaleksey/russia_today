require 'date'
require 'russia_today/calendar_generator'

module RussiaToday
  class RakeTask < Rake::TaskLib
    def initialize(name = :generate_calendar)
      @name = name
      define
    end

    private

    attr_reader :name

    def define
      desc 'Generate calendar file'
      task name, [:year] do |_, args|
        year = args[:year] || Date.today.year
        generator = CalendarGenerator.new(year.to_i)
        generator.call
      end
    end
  end
end
