# COACH PAIR 9 — Warm-ups (every sport) + Sport-Specific Strength Training

Paste the ROUND 1 block into a strong research model. Paste its full output back to Claude Code to encode. Then paste the ROUND 2 block into the SAME conversation and paste that output back too.

This pair is different from the persona pairs: it's CROSS-CUTTING. The output upgrades EVERY persona's workouts (run, bike, swim, tri, ultra, mile, general) rather than adding a new athlete type.

---

## ROUND 1 (new conversation)

You are a world-class strength & conditioning coach and exercise physiologist who specializes in supporting ENDURANCE athletes (runners, cyclists, swimmers, triathletes, ultrarunners, middle-distance runners). I am building an AI coaching app that generates personalized training plans for these athletes, and I need two rigorous, structured references I can encode directly into the AI's rules: (A) the WARM-UP system, and (B) the GYM / STRENGTH session system.

Be specific and quantitative: numbers, durations, sets, reps, loads, progressions, tables — not vague philosophy. Ground it in established sources (Ronnestad & Mujika on strength for endurance; Lauersen on injury-prevention loading; Blagrove on strength for distance runners; McGill on trunk; Boyle / functional training; dynamic-warm-up literature — RAMP protocol, post-activation potentiation; sport-governing-body practice). Key every rule to three experience tiers (beginner / intermediate / advanced) and give a DEFAULT for every range. CRITICAL CONSTRAINTS: most users train alone with little time and little equipment — every warm-up must work with ZERO equipment (or note the optional tool), take the RIGHT amount of time (not 2 minutes, not 25), and use a SMALL number of well-chosen movements (4-7, not 15) that a non-expert can do from a one-line description. Movements must be describable in a few words ("leg swings front-to-back x10 each side"), no obscure exercises.

### PART A — THE WARM-UP SYSTEM (per sport, per session type)

The app currently prescribes workouts with a "Warm-up" section that is usually just "10 min easy jog/spin/swim". That's a missed opportunity: a proper warm-up improves the session, prevents injury, and instantly makes a plan FEEL professionally coached. I need:

1. THE PRINCIPLES — what a warm-up must accomplish (raise temperature, mobilize, activate, potentiate — the RAMP idea), how total duration scales with session intensity (easy session vs intervals vs race) and athlete age (masters need more), and the rule for when a warm-up can be SHORT vs when it must be FULL. Give a duration table: session type × intensity → warm-up length.

2. PER-SPORT WARM-UP PROTOCOLS — for each sport the app prescribes (RUNNING — easy runs, interval/tempo days, long runs; CYCLING — easy rides, interval days, indoor trainer; SWIMMING — pool sessions by type; STRENGTH/GYM sessions; BRICK/triathlon sessions; plus race-day variants by event which my personas already partially cover): give the exact DEFAULT protocol as an ordered list with reps/durations, e.g. "RUN interval day: 8 min easy jog → leg swings 10/side front + side → walking lunges x8 → A-skips 2×15m → 4 strides building to session pace". For each: a 'minimum' version (time-crunched) and the full version. Mark which movements address the sport's top injury sites.

3. NAMING & STRUCTURE FOR THE APP — here's a real confusion to solve: cycling workouts already contain a "Warm-up: 10 min easy spin" section INSIDE the ride. The new pre-session movement work is a DIFFERENT thing (done off the bike, before getting on). Give me a clean two-part naming + structure convention the app can use across all sports (e.g. "Prep" or "Activation" [off-equipment movement work] vs "Warm-up" [the in-sport easy start]) so users never confuse them, with a one-line explanation the app can show. Also: when the session is EASY, is pre-session movement work even needed (give the honest answer + the minimal default)?

4. COOL-DOWNS — same treatment, briefer: what actually matters post-session (and what's myth), per sport, with a short default protocol.

### PART B — GYM / STRENGTH SESSIONS (sport-specific, periodized, injury-adaptive)

The app prescribes "strength" sessions today, but generically. I need the full system:

1. WHY + WHAT BY SPORT — what strength training does for each endurance sport (economy, injury resistance, late-race form), and the sport-specific emphasis: runners (calf/soleus capacity, hip abductors, posterior chain, foot), cyclists (max-strength carryover to FTP per Ronnestad, single-leg, trunk for position), swimmers (shoulder prehab FIRST, catch-supporting lats/serratus, trunk/streamline), ultrarunners (eccentric/downhill durability, carrying posture), middle-distance (power, plyometrics, tendon stiffness), triathletes (the blend, time-efficient), general fitness (balanced). A table: sport → top-3 strength priorities → top injury sites being protected.

2. THE SESSION LIBRARY — concrete sessions the app can prescribe, each with warm-up, 5-8 exercises (sets × reps × load guidance as RPE or %), rest, total duration (30-45 min target), and THREE equipment variants: full gym / minimal (dumbbells + bands) / bodyweight-only. Cover: anatomical adaptation (intro phase), max strength, power/plyometric (where appropriate per sport), maintenance, core/trunk, and the sport-specific prehab blocks (runner's calf-shin block, swimmer's shoulder block, cyclist's hip/trunk block, etc.). Exercises must be common and one-line describable; give a substitution per exercise for no-equipment.

3. PERIODIZATION INTO THE ENDURANCE PLAN — how strength volume changes across Base/Build/Peak/Taper per sport (my personas already define the endurance side; give the strength-side table), the scheduling rules (never <48h before a key session / long run; same-day ordering: endurance first or strength first and when; how many per week by phase and tier), and how strength sessions count toward weekly load.

4. INJURY-ADAPTIVE ADJUSTMENT (the feature I most want) — the athlete tells the coach "my hip has been hurting a bit on the bike" or "knee niggle when running downhill". Give me a CODEABLE mapping: reported niggle (by body site × sport) → (a) what to REMOVE or reduce from training this week, (b) what targeted strength/prehab block to INSERT (exact exercises, sets, frequency, for how many weeks), (c) the check-in cadence ("ask after 1 week: better/same/worse") and the decision tree (better → continue 2 more weeks then return to normal; same → modify; worse → stop and refer out). Cover the common sites: knee (runner's knee, ITB), hip (flexor, glute/lateral), Achilles/calf, shin, plantar, lower back, shoulder (swimmer's), neck, hamstring. Include the HARD rules: what symptoms mean STOP and see a professional (the app must never coach through real injury), and the rule that pain >3/10 or pain that worsens during activity = stop.

5. SAFETY & PROGRESSION GUARDRAILS — load progression caps for strength work (e.g. +2.5-5% per week), plyometric volume ramps (contacts per session by tier), beginner on-ramping (first 3 weeks light/learning), masters modifications, and the DO-NOT list (no max-effort lifts in race week, no new exercises in taper, no heavy eccentric work <14 days pre-race for runners, etc.).

FORMAT: clear headers and bullets, tables for anything numeric (warm-up durations, session templates, periodization, niggle→block mapping), explicit numbers and rules I can turn into code, every rule keyed to beginner/intermediate/advanced WITH a default, movements one-line describable with zero/minimal equipment, thorough but dense, no filler.

---

## ROUND 2 (paste into the SAME conversation)

That reference is excellent and I have already encoded the warm-up protocols (with the Prep-vs-Warm-up naming convention), the per-sport strength session library with equipment variants, the periodization and scheduling rules, and the injury-adaptive niggle→block mapping with its check-in decision tree. Now go deeper and make sure we're not missing anything, because the quality of the coach is everything. Keep everything keyed to beginner/intermediate/advanced with DEFAULTs, movements one-line describable, zero/minimal equipment first.

Two asks first:

A) REVIEW AND EXTEND your own reference. Re-read what you wrote and add anything you left out, glossed over, or could make more precise or codeable. Same style.

B) Give me YOUR expert opinion on what a truly great AI coach should have in this domain that I did not think to ask for. If there is a whole topic missing (mobility/flexibility as its own thread and what's actually evidence-based vs myth, tendon-loading protocols — isometrics for in-season pain management, bone-stress-injury return-to-run protocols, sleep/recovery basics the coach should preach, footwear rotation, female-athlete strength specifics — bone density, postpartum return, youth and masters strength rules, home-equipment recommendations worth suggesting, the psychology of getting endurance athletes to actually DO their strength work — adherence design), add it.

Then go deep on these specific areas, each with hard numbers, tables, and at least one worked example:

1. THE ADHERENCE PROBLEM — endurance athletes skip strength work more than any other session type. Give the evidence-informed playbook for an app: session length sweet spot, scheduling position in the week, "minimum effective dose" sessions for busy weeks (the 15-min version of each block), habit-stacking (attach to an existing session), and the messaging rules (how the coach should react when strength sessions keep getting skipped — when to shrink the ask vs when to push).

2. IN-WEEK ADAPTIVE LOGIC — codeable rules: if the athlete reports DOMS that interferes with a key endurance session, what changes; if a strength session was missed, does it get made up (answer: when yes, when no); how strength volume reacts to a deload week, a race week, an illness week; interference-effect management (the real rules on spacing strength and intensity, what the research actually supports vs gym lore).

3. THE NIGGLE LIBRARY, DEEPER — for each body site in the Part B mapping: the 2-3 most likely culprits by sport, the self-test the coach can ask the athlete to do ("single-leg calf raises: how many before pain?"), the progression metrics that gate return to full training, and 2-3 worked example dialogues (athlete reports X → coach's exact adjustment + check-in plan + the return-to-normal trigger).

4. WARM-UP DEPTH — the race-morning warm-up timeline per sport/event duration (when to finish relative to the gun), cold-weather and early-morning modifications, the indoor-trainer and treadmill variants, and the post-activation potentiation question (when do strides/efforts in a warm-up actually help vs just fatigue — by event).

5. STRENGTH TESTING & PROGRESS — simple no-gym benchmarks the app can track (single-leg calf raise count, wall-sit time, plank time, single-leg balance, push-up count), the cadence to re-test, expected progress rates by tier, and how to surface strength progress to the athlete (endurance athletes never see their strength wins — make them visible).

Format: dense, hard numbers, tables, worked examples, no filler. Give me everything; if in doubt, include it.
