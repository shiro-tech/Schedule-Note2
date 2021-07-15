json.array! @events, partial: "events/event", as: :event

#url指定、読み込めるデータの指定
json.array!(@events) do |event|
  json.extract! evebt, :id, :title, :description
  json.start event.start_date
  json.end evebt.end_date
  json.url event/url(event, format: :html)
end
