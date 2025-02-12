SELECT
    date_date
    , ROUND(SUM(f.operational_margin-c.ads_cost),2) AS ads_margin
    , ROUND(SUM(f.avg_basket),2) AS avg_basket
    , ROUND(SUM(f.operational_margin),2) AS operational_margin
    , ROUND(SUM(c.ads_cost),2) AS ads_cost
    , ROUND(SUM(c.ads_impression),2) AS ads_impression
    , ROUND(SUM(c.ads_click),2) AS ads_click
    , ROUND(SUM(f.quantity),2) AS quantity
    , ROUND(SUM(f.revenue),2) AS revenue
    , ROUND(SUM(f.purchase_cost),2) AS purchase_cost
    , ROUND(SUM(f.margin),2) AS margin
    , ROUND(SUM(f.shipping_fee),2) AS shipping_fee
    , ROUND(SUM(f.logcost),2) AS logcost
    , ROUND(SUM(f.ship_cost),2) AS ship_cost
FROM {{ ref('finance_days')}} AS f
LEFT JOIN {{ ref('int_campaigns_day')}} AS c
USING (date_date)
GROUP BY date_date
ORDER BY date_date DESC
