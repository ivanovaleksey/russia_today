require 'singleton'
require 'russia_today/calendar'

module RussiaToday
  class Manager
    include Singleton

    def initialize
      @calendars = {}
    end

    def holiday?(date)
      calendar = pick_calendar(date.year)
      calendar.holiday?(date)
    end

    private

    def pick_calendar(year)
      if @calendars.has_key?(year)
        @calendars[year]
      else
        @calendars[year] = load_calendar(year)
      end
    end

    def load_calendar(year)
      Calendar.new(year)
    end
  end
end
