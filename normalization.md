# AirBnB clone database normalization

## Objective: 
- Apply normalization principles to ensure the database is in the third normal form (3NF).

## Instructions:
- Review your schema and identify any potential redundancies or violations of normalization principles.
- Adjust your database design to achieve 3NF, if necessary.
- Provide an explanation of your normalization steps in a Markdown file.

## Answer:
- User table is normalized to the 3rd form
- Property table is normalized to the 3rd form
- Booking table is normalized to the 3rd form
- Payment table is normalized to the 3rd form
- Review table is normalized to the 3rd form
- Message table is normalized to the 3rd form

## Conclusion
Firstly, each table has an associative `primary_key` and each column is atomized i.e they are not grouped or contain multiple data types.
Also, each table has a `primary_key` and the other non-key attributes are all dependent on the complete `primary_key`.
Finally, the none-key attributes are also directly dependent on the `primary_key` and there are no indirect dependencies in all the table.
Hence all the tables satisfy the requirements of 3NF (3rd form Normalization).