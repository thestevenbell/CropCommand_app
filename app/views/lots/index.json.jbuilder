json.array!(@lots) do |lot|
  json.extract! lot, :id, :lot_code, :event_made, :event_shake, :event_chill, :event_remove, :cycle_weeks, :units_type, :units_number, :active
  json.url lot_url(lot, format: :json)
end
