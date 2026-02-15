-- Migration: Add student_name and institute fields to users table
-- Run this SQL in your Supabase SQL Editor if you already have the users table

-- Add student_name column if it doesn't exist
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'users' AND column_name = 'student_name'
  ) THEN
    ALTER TABLE users ADD COLUMN student_name TEXT;
  END IF;
END $$;

-- Add institute column if it doesn't exist
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'users' AND column_name = 'institute'
  ) THEN
    ALTER TABLE users ADD COLUMN institute TEXT;
  END IF;
END $$;

-- Add comments for documentation
COMMENT ON COLUMN users.student_name IS 'Name of the student';
COMMENT ON COLUMN users.institute IS 'Name of the institute/school where the student is studying';


