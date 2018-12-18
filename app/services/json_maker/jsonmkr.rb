module JsonMaker
  class Jsonmkr
    def records(shipments)
      result = Array.new
      shipments.each do |sh|
        result.push("id" => sh.id, "name" => sh.name,"products" => products(sh))
      end
      return result
    end

    def products(sh)
      result2 = Array.new
      sh.shipment_products.each.with_index do |shp, index|
        result2.push(
          {
            "quantity" => shp.quantity,
            "id" => shp.product.id,
            "sku" => shp.product.sku,
            "description" => shp.product.description,
            "active_shipment_count" => index + 1
          }
        )
      end
      return result2
    end

  end
end
