SELECT
    date_date
    , ROUND(SUM(operational_margin-ads_cost),2) AS ads_margin
    , avg_basket
    , operational_margin
    , ads_cost
    , ads_impression
    , ads_click
    , quantity
    , revenue
    , purchase_cost
    , margin
    , shipping_fee
    , logcost
    , ship_cost
FROM {{ ref('finance_days')}} 
LEFT JOIN {{ ref('int_campaigns_day')}} 
USING (date_date)
ORDER BY date_date DESC
