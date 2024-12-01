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
-> Nested loop inner join  (cost=8.3 rows=7) (actual time=0.0678..0.222 rows=7 loops=1)
    -> Nested loop inner join  (cost=5.85 rows=7) (actual time=0.0601..0.182 rows=7 loops=1)
        -> Nested loop inner join  (cost=3.4 rows=7) (actual time=0.0522..0.136 rows=7 loops=1)
            -> Filter: ((booking.property_id is not null) and (booking.user_id is not null))  (cost=0.95 rows=7) (actual time=0.0297..0.0386 rows=7 loops=1)
                -> Table scan on booking  (cost=0.95 rows=7) (actual time=0.0287..0.0358 rows=7 loops=1)
            -> Single-row index lookup on payment using booking_id (booking_id=booking.booking_id)  (cost=0.264 rows=1) (actual time=0.0133..0.0133 rows=1 loops=7)
        -> Single-row index lookup on property using PRIMARY (property_id=booking.property_id)  (cost=0.264 rows=1) (actual time=0.0062..0.00624 rows=1 loops=7)
    -> Single-row index lookup on user using PRIMARY (user_id=booking.user_id)  (cost=0.264 rows=1) (actual time=0.0051..0.00514 rows=1 loops=7)
