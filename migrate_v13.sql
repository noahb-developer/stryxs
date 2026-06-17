-- migrate_v13.sql — add athlete_intake.training_preferences.
-- Free-form standing preferences the athlete tells Coach in chat ("more swimming",
-- "more rest days", "fewer bike sessions", "long run on Sunday"). Stored as a short
-- newest-first bulleted list so the plan generator can honor them on EVERY week
-- (including background auto-extend), not just acknowledge them once. The "adjust"
-- plan_command flow writes here, then rebuilds the plan in place.
-- Idempotent.

ALTER TABLE public.athlete_intake
  ADD COLUMN IF NOT EXISTS training_preferences text;
