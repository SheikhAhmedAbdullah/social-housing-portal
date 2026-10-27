-- Add status and move_out columns to tenants table
ALTER TABLE tenants ADD COLUMN IF NOT EXISTS status text DEFAULT 'active';
ALTER TABLE tenants ADD COLUMN IF NOT EXISTS move_out date;
