-- migrate_v10.sql — persist onboarding/UX flags across devices
-- Adds a jsonb column on profiles that mirrors localStorage-resident
-- onboarding flags (tour seen, activation checklist dismissed, visited
-- plan/trends/upload tabs, PWA install dismissed, welcomed-at). Without this,
-- deleting the PWA and logging back in via the website shows the tour offer
-- and resets the checklist because localStorage is per-device. With this,
-- those flags follow the USER, not the device. Idempotent.

ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS client_state jsonb;

-- No RLS change needed: profiles is already user-scoped (each user can read +
-- update their own row), so the new column rides on those policies.
