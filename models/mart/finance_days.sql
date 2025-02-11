SELECT 
    opm.date_date 
    , COUNT (opm.orders_id) AS nb_transaction
    , ROUND(SUM(om.revenue),2) AS revenue 
    , ROUND(AVG(revenue),2) AS avg_basket
    , ROUND(SUM(opm.operational_margin),2) AS operational_margin
    , ROUND(SUM(om.purchase_cost),2) AS purchase_cost
    , ROUND(SUM (opm.shipping_fee),2) AS shipping_fee
    , ROUND(SUM (opm.logcost),2) AS logcost
    , ROUND(SUM(om.quantity),2) AS quantity 
FROM {{ ref('int_orders_operational')}} AS opm
JOIN {{ ref('int_orders_margin')}} AS om
USING (orders_id) 
GROUP BY date_date 