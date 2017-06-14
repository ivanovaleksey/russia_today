require 'yaml'

module RussiaToday
  class Calendar
    def initialize(year)
      @year = year
    end

    def holiday?(date)
      calendar.fetch(date, false)
    end

    private

    attr_reader :year

    def calendar
      @calendar ||= begin
        filepath = File.join('lib', 'russia_today', 'calendars', "#{year}.yml")
        YAML.load(File.read(filepath))
      end
    end
  end
end
