require 'net/http'
require 'json'

module RussiaToday
  class OfficialCalendar
    URL = 'http://basicdata.ru/api/json/calend'

    def initialize(year)
      @year = year
    end

    def holiday?(date)
      type = calendar.dig(date.month.to_s, date.day.to_s, 'isWorking')

      case type
      when nil
        date.saturday? || date.sunday?
      when 2
        true
      else
        false
      end
    end

    private

    attr_reader :year

    def calendar
      @calendar ||= begin
        resp = Net::HTTP.get(URI(URL))
        json = JSON.parse(resp)
        json.dig('data', year.to_s)
      end
    end
  end
end
