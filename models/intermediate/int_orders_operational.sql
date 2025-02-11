SELECT 
    orders_id
    , date_date
    , ROUND (margin+shipping_fee-logcost-ship_cost,2) AS operational_margin 
FROM {{ ref('stg_raw__ship')}}
LEFT JOIN {{ ref('int_orders_margin')}}
USING (orders_id) 
ORDER BY orders_id DESC