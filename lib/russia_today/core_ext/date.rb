require 'date'

class Date
  def holiday?
    manager = RussiaToday::Manager.instance
    manager.holiday?(self)
  end
end
