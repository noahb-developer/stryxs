-- v15: add profiles.training_zones (jsonb)
-- The frontend has always written to profiles.training_zones (profile edit sheet,
-- swim CSS benchmark = swim_css_per_100m, imported-plan zones) but the column was
-- never actually created. Every save that included it failed with
-- "Could not find the 'training_zones' column of 'profiles' in the schema cache",
-- which silently broke saving a profile description / benchmarks.
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS training_zones jsonb DEFAULT '{}'::jsonb;

-- Tell PostgREST to refresh its schema cache so the new column is usable immediately.
NOTIFY pgrst, 'reload schema';
