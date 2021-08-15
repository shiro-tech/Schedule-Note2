json.array! @events, partial: "events/event", as: :event

#url指定、読み込めるデータの指定
json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :project_id, :title, :description
  json.start event.start_date
  json.end event.end_date
  json.url event_url(event, format: :html)
end
