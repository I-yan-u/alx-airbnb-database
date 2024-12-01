## Optimization report

```sql
EXPLAIN ANALYZE SELECT * FROM booking
JOIN user ON booking.user_id = user.user_id
JOIN property ON booking.property_id = property.property_id
JOIN payment ON booking.booking_id = payment.booking_id;
```

- Before Optimization: 
-> Nested loop inner join  (cost=8.3 rows=7) (actual time=0.0678..0.222 rows=7 loops=1)
    -> Nested loop inner join  (cost=5.85 rows=7) (actual time=0.0601..0.182 rows=7 loops=1)
        -> Nested loop inner join  (cost=3.4 rows=7) (actual time=0.0522..0.136 rows=7 loops=1)
            -> Filter: ((booking.property_id is not null) and (booking.user_id is not null))  (cost=0.95 rows=7) (actual time=0.0297..0.0386 rows=7 loops=1)
                -> Table scan on booking  (cost=0.95 rows=7) (actual time=0.0287..0.0358 rows=7 loops=1)
            -> Single-row index lookup on payment using booking_id (booking_id=booking.booking_id)  (cost=0.264 rows=1) (actual time=0.0133..0.0133 rows=1 loops=7)
        -> Single-row index lookup on property using PRIMARY (property_id=booking.property_id)  (cost=0.264 rows=1) (actual time=0.0062..0.00624 rows=1 loops=7)
    -> Single-row index lookup on user using PRIMARY (user_id=booking.user_id)  (cost=0.264 rows=1) (actual time=0.0051..0.00514 rows=1 loops=7)

- After Optimization:
-> Nested loop inner join  (cost=1.41 rows=1) (actual time=0.0421..0.0462 rows=1 loops=1)
    -> Nested loop inner join  (cost=1.06 rows=1) (actual time=0.0337..0.0375 rows=1 loops=1)
        -> Filter: (booking.property_id is not null)  (cost=0.71 rows=1) (actual time=0.02..0.0235 rows=1 loops=1)
            -> Index range scan on booking using idx_booking_user_start over (user_id = '0003' AND '2024-01-01' < start_date), with index condition: ((booking.user_id = '0003') and (booking.start_date > DATE'2024-01-01'))  (cost=0.71 rows=1) (actual time=0.0192..0.0227 rows=1 loops=1)
        -> Single-row index lookup on payment using booking_id (booking_id=booking.booking_id)  (cost=0.35 rows=1) (actual time=0.0124..0.0124 rows=1 loops=1)
    -> Single-row index lookup on property using PRIMARY (property_id=booking.property_id)  (cost=0.35 rows=1) (actual time=0.008..0.0081 rows=1 loops=1)

