SELECT b.listing_id
 FROM {{ref('dim_listings')}} as a
    INNER JOIN {{ref('fact_reviews')}} as b
 ON a.listing_id = b.listing_id
where b.review_date <= a.created_at
