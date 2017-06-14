require 'date'
require 'yaml'
require 'russia_today/official_calendar'

module RussiaToday
  class CalendarGenerator
    def initialize(year)
      @year = year
    end

    def call
      beginning_of_year = Date.new(year, 1, 1)
      end_of_year = Date.new(year, 12, 31)

      calendar = (beginning_of_year..end_of_year).select do |date|
        official_calendar.holiday?(date)
      end.map { |date| [date, true] }.to_h

      dump_calendar(calendar)
    end

    private

    attr_reader :year

    def official_calendar
      @official_calendar ||= OfficialCalendar.new(year)
    end

    def dump_calendar(calendar)
      filepath = File.join('lib', 'russia_today', 'calendars', "#{year}.yml")
      File.open(filepath, 'w') do |file|
        file << YAML.dump(calendar)
      end
    end
  end
end
