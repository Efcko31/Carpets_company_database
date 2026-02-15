ALTER TABLE returns_of_customers DROP CONSTRAINT IF EXISTS returns_of_customers_realisation_id_fkey;
ALTER TABLE returns_of_customers 
ADD CONSTRAINT returns_of_customers_realisation_id_fkey 
FOREIGN KEY (realisation_id) REFERENCES fitting_or_delivery(id);

COMMENT ON COLUMN returns_of_customers.realisation_id IS 'Ссылка на доставку/примерку, по которой оформлен возврат';
