json.records @shipments do |shipment|
  json.id shipment.id
  json.name shipment.name

  json.products shipment.shipment_products.each_with_index.to_a do |shipment_product, index|
    json.quantity shipment_product.quantity
    json.id shipment_product.product.id
    json.sku shipment_product.product.sku
    json.description shipment_product.product.description
    json.active_shipment_count (index + 1)
  end
end
