json.array!(@client_orders) do |client_order|
  json.extract! client_order, :id
  json.url client_order_url(client_order, format: :json)
end