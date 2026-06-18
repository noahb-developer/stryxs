-- migrate_v14.sql — profile-page fields.
-- The avatar/photo button now opens a dedicated Strava-style profile page (split
-- from Settings). These columns back the editable identity fields shown there.
--   profiles.location      — free-text place ("Lyon, France")
--   profiles.primary_sport — the athlete's headline sport (run/bike/swim/tri/...)
--   athlete_intake.birth_date — optional DOB (age still drives coaching maths)
-- Idempotent.

ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS location text;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS primary_sport text;
ALTER TABLE public.athlete_intake ADD COLUMN IF NOT EXISTS birth_date date;
