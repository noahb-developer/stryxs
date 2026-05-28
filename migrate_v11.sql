-- migrate_v11.sql — bike FTP for power-based TSS in the training-load model
-- Adds an optional bike FTP (watts) on profiles so cycling sessions with avg
-- or normalized power can be scored with the more accurate power-based TSS
-- (TSS = hours * (NP/FTP)^2 * 100) instead of the HR-based fallback. hrTSS
-- still applies for users who haven't set FTP, so this is purely additive.
-- Idempotent.

ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS bike_ftp integer;

-- No RLS change needed: profiles is already user-scoped.
