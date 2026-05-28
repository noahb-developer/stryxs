-- migrate_v9.sql — persist sent chat photos
-- Adds a column on coach_messages that holds the public URL of an attached
-- photo (uploaded to the chat-photos storage bucket on send), so a sent photo
-- still shows on a fresh chat load instead of being lost as a one-shot vision
-- block. Idempotent. Existing rows just have NULL here (legacy "📷 Photo"
-- markers in `content` keep rendering as text, no migration of history needed).

ALTER TABLE public.coach_messages
  ADD COLUMN IF NOT EXISTS image_url text;

-- Storage bucket setup (DO IN SUPABASE STUDIO, NOT THIS SQL):
--   Storage → New bucket → name: "chat-photos", public: ON (mirrors `avatars`).
--   Policies (the Studio "Public read + per-user write" preset matches):
--     • SELECT  ▸ allow public read (bucket = chat-photos)
--     • INSERT  ▸ allow auth.uid()::text = (storage.foldername(name))[1]
--     • UPDATE  ▸ allow auth.uid()::text = (storage.foldername(name))[1]
--     • DELETE  ▸ allow auth.uid()::text = (storage.foldername(name))[1]
-- Files are written under  <uid>/<uuid>.jpg  so each user only writes their
-- own folder. URLs land in coach_messages.image_url (RLS on coach_messages
-- already restricts who sees which row).
