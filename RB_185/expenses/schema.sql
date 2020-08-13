CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount decimal(6, 2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL
);

ALTER TABLE expenses ADD CONSTRAINT amount_positive CHECK(amount >= 0);

ALTER TABLE expenses
  ALTER COLUMN created_on
  SET DEFAULT NOW();

INSERT INTO expenses (amount, memo, created_on) VALUES (14.56, 'Pencils', NOW());
INSERT INTO expenses (amount, memo, created_on) VALUES (3.29, 'Coffee', NOW());
INSERT INTO expenses (amount, memo, created_on) VALUES (49.99, 'Text Editor', NOW());
