# Coach research prompt — Ironman (140.6) + Half-Ironman (70.3)

Paste the block below into a strong research model (Claude, GPT, Perplexity, etc.).
Then paste the model's full output back to Claude Code so it can be encoded into the
`coach` edge function (persona system prompt + plan-generation guardrails + projection logic).

Do ONE coach pair at a time. This first prompt covers Ironman + 70.3 (they share Friel
methodology). Later pairs: marathon + half-marathon, 5K/10K + general fitness, sprint/olympic tri.

---

You are a world-class endurance coach and exercise physiologist specializing in triathlon, specifically Ironman (140.6) and Half-Ironman (70.3). I am building an AI coaching app that (a) generates personalized, periodized training plans and (b) predicts race finish times from an athlete's real training data. I need a rigorous, structured reference I can encode directly into the AI's rules.

Cover BOTH Ironman (140.6) and Half-Ironman (70.3). Whenever the two differ, say so explicitly. Be specific and quantitative: give numbers, ranges, formulas, and tables — not vague philosophy. Cite the methodology/source (Joe Friel, Jack Daniels, Brett Sutton, Stephen Seiler, Andrew Coggan, Matt Dixon, etc.) where relevant. Every rule I should be able to turn into code.

Produce these sections:

1. PERIODIZATION MODEL
- The macro / meso / micro structure (Base → Build → Peak → Taper → Race). Typical phase durations, and how they scale with weeks-to-race (give a table for 16, 24, 36, and 52-week plans).
- How to set phase boundaries purely from the athlete's time-to-race.

2. WEEKLY STRUCTURE & PROGRESSION RULES — MOST IMPORTANT, give hard numbers
- Max safe week-to-week volume increase (% per week), and how it differs by experience level.
- Recovery / deload week cadence (e.g., every 3rd or 4th week) and how much to cut volume.
- Minimum and typical REST days per week, by experience level and phase.
- Max sessions per day; when a "double" day is appropriate vs harmful.
- How a weekly HOURS budget maps to number of sessions and their durations.
- Intensity distribution (e.g., polarized ~80/20): % of weekly time per zone, by phase.
- IMPORTANT: I have a bug where generated plans jump from several rest days one week to zero rest days and 3-4 sessions/day the next. Give explicit guardrail rules (with numbers) that make week-to-week load smooth and always include adequate rest.

3. ZONES
- HR zones from LTHR (run and bike separately) and swim zones from CSS. Give the % ranges for Z1–Z5 in a table.

4. SESSION LIBRARY (per sport)
- For swim, bike, run: every standard session type (easy/endurance, tempo, threshold, VO2/intervals, long, recovery, technique/drills), each with target zone, typical duration/distance by phase, and its purpose.
- Brick workouts: when, how long, structure.
- Strength: how much, what type, where in the week, what to avoid near key sessions.

5. ADAPTATION TO THE ATHLETE
- How to scale the plan to: available training days/week, weekly hours budget, experience level (beginner / intermediate / advanced), current fitness (LTHR / swim CSS / recent PBs), injuries/limiters, and equipment (pool access, indoor trainer, etc.).
- How to place the long ride, long run, and key swim across a 7-day week given the athlete's available days, while protecting recovery.

6. TAPER
- Taper length and the volume/intensity changes, for Ironman vs 70.3.

7. RACE-DAY EXECUTION (we display per-leg pacing)
- Target pacing for each leg (swim, bike, run) relative to threshold/zones, for Ironman vs 70.3. For EACH leg give a single credible one-line rationale ("why") a smart athlete would respect.
- Fueling and hydration guidelines per leg (carbs/hr, fluid, sodium).

8. RACE-TIME PROJECTION METHODOLOGY (we predict finish times from training data)
- How to project an Ironman / 70.3 finish from recent benchmarks (e.g., 5K/10K PB → marathon-equivalent), training volume, and threshold values. Give the actual formulas/standard models you'd use (Riegel exponent, Daniels VDOT, critical power/speed, etc.).
- The MINIMUM data needed for a credible projection, and what specifically raises or lowers confidence.
- Concrete LOW / MEDIUM / HIGH confidence criteria — define the data thresholds that justify each level.
- How to communicate uncertainty honestly while still being useful.

9. ANTI-PATTERNS / SAFETY RULES — explicit "never do this"
- The top mistakes that make a plan dangerous or ineffective (load spikes, missing recovery weeks, too much intensity, no rest, unrealistic ramp), written as explicit DO-NOT rules WITH numbers.

10. FEASIBILITY / SANITY CHECK
- Given a goal time + weeks-to-race + current fitness, how to judge whether the goal is realistic, and the minimum training (weekly volume, number of weeks, longest sessions) a given goal requires.

FORMAT: clear headers and bullets. Use TABLES for anything numeric (zone %, phase durations, hours→sessions maps, confidence thresholds). Give explicit numbers and rules I can turn into code, not general advice. Mark every Ironman-vs-70.3 difference. Be thorough but dense — no filler, no motivational fluff.

---

# Round 2 follow-up (paste into the SAME conversation as round 1)

That reference is excellent and I have already encoded the periodization, the R1-R10 guardrails, the zones, and the progression caps into the app. Now I want to go deeper and make sure we are not missing anything, because for this app the quality of the coach is everything. Keep covering BOTH Ironman (140.6) and Half-Ironman (70.3), mark every difference, stay dense and numeric.

Two asks first:

A) REVIEW AND EXTEND your own reference. Re-read what you wrote and add anything you left out, glossed over, or could make more precise or more codeable. Same style.

B) Give me YOUR expert opinion on what a truly great AI triathlon coach should have that I did not think to ask for. Do not hold back. If there is a whole topic we are missing, add it.

Then go deep on these specific areas. For each, give hard numbers, formulas, tables, and at least one worked numeric example:

1. ADAPTIVE ADJUSTMENT (the most important gap). Given a completed week of real data (HR drift per session, actual pace/power vs target, sessions completed vs missed, RPE and how it felt: easy/hard/sore/sick, and the trend over 2-3 weeks), give explicit rules for how to adjust NEXT week. For example: "if cardiac drift > X% on most aerobic runs, cut volume Y%"; "if the key long ride was missed, do not add it on top, do Z"; "if RPE is consistently high or the athlete logs sore/sick, trigger an early deload"; plus overtraining / under-recovery red flags and the response to each. This is how the coach tracks the athlete, so be thorough.

2. IN-SESSION STRUCTURE. For each session type per sport, a warmup / main set / cooldown template with durations and targets, so a workout description is concrete and prescriptive instead of vague.

3. KEY-SESSION PLACEMENT across the week. Exact rules for spacing hard sessions: what counts as the same energy system, the minimum gap between two hard same-system sessions, and ready-to-use 7-day weekly templates for 5-, 6-, and 7-day availability, for IM and HALF, in Base / Build / Peak, showing where rest and deload sit.

4. PROJECTION ENGINE, worked end to end. Take a concrete athlete (5K PB 21:12, bike FTP ~210 W or avg ~26 km/h, swim CSS 1:56/100m, 12 weeks consistent) and project a full IM and a full 70.3 finish step by step: swim split, T1, bike split (show how you get bike speed and time from FTP / NP), T2, run split (show the open-marathon prediction and the tri fatigue factor applied), and total. Then show how to phrase a one-line, data-grounded "why" for each leg's target pace, and how the confidence label and range come out for that data.

5. RECOVERY AND READINESS. How to read fatigue from resting HR / HRV / sleep / mood when available, and from training data when not; concrete thresholds for inserting unplanned rest or pulling back.

6. ENVIRONMENT AND LOGISTICS. Heat / altitude / travel adjustments, hilly-course pacing, and a race-week plus race-morning checklist.

7. STRENGTH PROGRESSION across a season (sets / reps / load by phase), and the injury-prevention and mobility essentials per sport.

8. PROACTIVE COACHING. The specific situations a good coach should NOTICE and message the athlete about unprompted (for example: missed 3 swims in a row, easy runs creeping into Z3, two weeks of high drift), each with the trigger condition and the intent of the message.

Format: dense, hard numbers, tables, formulas, worked examples, IM-vs-HALF marked, no filler. Give me everything; if in doubt, include it.

---

# COACH PAIR 2 — Marathon + Half-Marathon (round 1; new conversation)

You are a world-class distance-running coach and exercise physiologist specializing in the Marathon (42.2 km) and Half-Marathon (21.1 km). I am building an AI coaching app that (a) generates personalized, periodized training plans and (b) predicts race finish times from an athlete's real training data. I need a rigorous, structured reference I can encode directly into the app's rules.

Cover BOTH the Marathon and the Half-Marathon. Whenever they differ, mark it [MAR vs HALF]. Be specific and quantitative: numbers, ranges, formulas, tables, not vague philosophy. Ground it in the established methodologies and cite which one (Jack Daniels / VDOT, Pete Pfitzinger / Advanced Marathoning, Hal Higdon, Renato Canova, Stephen Seiler / polarized, Pete Riegel / endurance time model). Every rule should map to a constant, lookup, or validator.

Produce these sections:

1. PERIODIZATION MODEL — phase structure (Base/foundation -> Build/specific -> Peak/sharpen -> Taper -> Race); typical phase durations and how they scale with weeks-to-race (table for 12, 16, 18, 24 weeks); how to set phase boundaries from time-to-race; minimum viable build.

2. WEEKLY STRUCTURE & PROGRESSION (most important, hard numbers): max safe weekly MILEAGE increase (% per week) by experience; cutback/down-week cadence and how much to cut; rest/recovery days per week by level; when doubles are appropriate for runners; how a weekly mileage (or hours) budget maps to number of runs and their lengths; the long run as a % of weekly mileage and its absolute caps [MAR vs HALF]; intensity distribution (polarized ~80/20) by phase. Give explicit guardrail rules (with numbers) that keep week-to-week load smooth, always include easy/rest, and never spike the long run.

3. ZONES & PACES — Daniels VDOT and the 5 training paces E / M / T / I / R: define each, its purpose, and how to compute the pace from a recent race (give the VDOT formula). Also HR zones from LTHR (Z1-Z5 ranges). Worked example for a runner with a 21:12 5K.

4. SESSION LIBRARY — every standard run session (recovery, easy, steady, long run, marathon-pace long run [Pfitz], medium-long, tempo/threshold (cruise intervals), VO2 intervals, strides, hill reps, progression run, fast finish long run), each with target pace/zone, typical duration/distance by phase, and purpose. Include warmup/main/cooldown structure.

5. ADAPTATION TO THE ATHLETE — scale to available days/week, weekly mileage budget, experience (beginner/intermediate/advanced), current fitness (recent PBs, LTHR), injuries/limiters; how to place the long run, the quality (tempo/interval) days, and easy days across a 7-day week protecting recovery; treadmill/heat substitutions.

6. TAPER — length and volume/intensity changes [MAR vs HALF]; how much to cut, what to keep.

7. RACE-DAY EXECUTION — pacing strategy [MAR vs HALF] (even vs slight negative split, the marathon "wall" and how pacing avoids it, what % of goal pace the first km/mile should be); carbohydrate loading pre-race and in-race fueling (carbs/hr, fluid, when to take gels); the one-line "why" for the goal pace a smart runner would respect.

8. RACE-TIME PROJECTION METHODOLOGY — how to predict a marathon / half finish from a recent 5K/10K (Riegel exponent for runners, Daniels VDOT equivalency); a marathon-specific fade/endurance factor and how training volume affects it (a runner on low mileage fades more than Riegel predicts); MINIMUM data for a credible projection; concrete LOW/MEDIUM/HIGH confidence criteria (data thresholds); how to communicate uncertainty as a range. Worked example: project a marathon and a half for a runner with a 21:12 5K on ~50 km/week.

9. ANTI-PATTERNS / SAFETY — explicit DO-NOT rules with numbers (too much too soon, the 10% rule, easy days not easy, long run too long or too fast, too much intensity, skipping cutback weeks, racing the workouts). Running injuries are common, so be specific (cadence, surface, shoe rotation, bone-stress risk).

10. FEASIBILITY / SANITY CHECK — given a goal time + weeks-to-race + current fitness, judge if it's realistic; the minimum weekly mileage and longest run a given goal time requires (e.g., a sub-3 marathon vs a sub-4 marathon vs a sub-1:45 half). Pair any "unrealistic" verdict with the specific lever (more weeks, more mileage, or a softer goal).

FORMAT: clear headers and bullets, tables for anything numeric (paces by VDOT, phase durations, mileage->runs maps, confidence thresholds, min-mileage-by-goal), explicit numbers and rules I can turn into code, mark every Marathon-vs-Half difference, dense, no filler.

---

# Coach pair 2 round 2 follow-up (paste into the SAME marathon conversation)

That reference is excellent and I have already encoded the periodization, the VDOT pace math, the mileage fade factor for projections, and the long-run/progression caps into the app. Now I want to go deeper and make sure we are not missing anything, because for this app the quality of the coach is everything. Keep covering BOTH the Marathon and the Half-Marathon, mark every [MAR vs HALF] difference, stay dense and numeric, ground it in Daniels / Pfitzinger / Canova / Seiler.

Two asks first:

A) REVIEW AND EXTEND your own reference. Re-read what you wrote and add anything you left out, glossed over, or could make more precise or codeable. Same style.

B) Give me YOUR expert opinion on what a truly great AI running coach should have that I did not think to ask for. Do not hold back. If there is a whole topic we are missing (gut training, RED-S / energy availability, female-athlete physiology, masters runners, downhill-course quad prep, etc.), add it.

Then go deep on these specific areas. For each give hard numbers, formulas, tables, and at least one worked example:

1. ADAPTIVE ADJUSTMENT (most important). Given a completed week of real data (actual pace vs target on each run, HR drift on easy/long runs, sessions completed vs missed, RPE and felt-tags easy/hard/sore/sick, cadence, the 2-3 week trend), give explicit rules for adjusting NEXT week. For example: "if the long run was missed, do NOT stack it"; "if easy runs are drifting into Z3, do X"; "if a key tempo was >5% slow at the right HR, do Y"; "if sore/sick logged, do Z"; plus overtraining / bone-stress early-warning flags and the response to each.

2. IN-SESSION STRUCTURE. For every run session type, a warmup / main set / cooldown template with how to SCALE the reps and volume by VDOT and by phase, so a description is concrete and prescriptive (e.g. how a threshold session grows from Base to Peak).

3. WEEKLY TEMPLATES. Ready-to-use 7-day layouts for 4-, 5-, 6-, and 7-day availability, for MAR and HALF, in Base / Build / Peak, showing exact placement of the long run, the quality days, easy days, and rest, with the spacing rules baked in.

4. PROJECTION DEPTH. More worked examples: a faster runner (sub-3 marathon type), a runner with ONLY a recent 10K, and a half-to-marathon step-up. How to update the projection as fitness changes mid-block, and how cadence/efficiency or a recent long-run pace can adjust it.

5. RECOVERY & READINESS. How to read fatigue from resting HR / HRV / sleep when available, and from training data (pace at fixed HR, RPE creep, drift) when not; concrete thresholds for inserting unplanned rest or cutting a week short.

6. ENVIRONMENT & LOGISTICS. Heat / cold / altitude pace adjustments (numbers), net-downhill and hilly courses (e.g. Boston quad prep, downhill-running adaptation), treadmill equivalence, and a marathon race-week + race-morning checklist.

7. STRENGTH & INJURY PREVENTION (runners get injured constantly, go deep). Season strength phases (sets/reps/load), key lifts + plyometrics for runners, the injury triad and mitigations, cadence/form cues, shoe rotation/replacement, surface management, and return-to-run protocols after a layoff or niggle.

8. PROACTIVE COACHING. The specific situations a good running coach should NOTICE and message about unprompted (mileage spike, easy runs creeping hard, long run skipped, niggle/sore reported, plateau at fixed HR, taper anxiety, race week, new PB), each with the trigger condition and the message intent.

Format: dense, hard numbers, tables, formulas, worked examples, [MAR vs HALF] marked, no filler. Give me everything; if in doubt, include it.

---

# COACH PAIR 3 — 5K/10K racing + General fitness/health (round 1; NEW conversation)

You are a world-class coach and exercise physiologist. I'm building an AI coaching app and need a rigorous, encodable reference for TWO related but distinct personas:
- **[5K10K]** Short-distance running performance: the 5K, 10K, and mile. Methodology: Jack Daniels (VDOT), with Seiler (polarized) and some Canova. Goal: race a specific time.
- **[GENERAL]** General fitness & health (NO race). Methodology: Peter Attia (longevity, Zone 2, VO2max, strength, stability) + Stephen Seiler. Goal: get and stay fit and healthy, improve aerobic base, VO2max, and strength, often across mixed modalities (run/bike/row/etc.).

Cover BOTH. Mark every divergence [5K10K vs GENERAL]. Be specific and quantitative: numbers, ranges, formulas, tables. Cite methodology. Every rule should map to a constant, lookup, or validator.

Produce these sections:

1. PERIODIZATION / PROGRAM STRUCTURE. [5K10K] phase model (base -> build -> peak -> short taper -> race) and how it scales with weeks-to-race (tables for 8, 12, 16 weeks); the 5K/10K is more VO2max/speed-driven than the marathon, so show how the intensity mix shifts. [GENERAL] there's usually NO race: give an ongoing, sustainable structure (e.g. rolling base + periodic VO2max blocks + continuous strength), how to cycle stimulus to avoid staleness, and how to set 8-12 week "health goals" instead of a race date.

2. WEEKLY STRUCTURE & PROGRESSION. Volume/load progression caps, deload cadence, rest days, sessions/week by experience. [5K10K] mileage-based with quality emphasis; [GENERAL] the Attia template (multiple Zone 2 sessions/week totalling a target, e.g. ~3 hrs/wk Zone 2; 1 VO2max session/wk; 2-4 strength sessions/wk; stability/mobility), with concrete weekly hour/session targets by fitness level and by available time.

3. ZONES & PACES. [5K10K] Daniels VDOT E/M/T/I/R (reuse the VDOT formulas) with emphasis on I and R for 5K/10K; HR zones from LTHR. [GENERAL] define Zone 2 precisely (the "can hold a conversation / nasal-breathing / ~lactate 2 mmol / talk test" + %LTHR or %max HR bands), the VO2max zone, and how to find Zone 2 without a lab (talk test, HR, RPE). Give the standard 5-zone model and where Zone 2 and VO2max sit.

4. SESSION LIBRARY. [5K10K] easy, long (shorter than marathon), tempo/threshold, VO2max intervals (the key session: e.g. 5-6x3 min, 1km reps, 400-800m reps), R/speed, strides, hills. [GENERAL] Zone 2 steady (any modality, 30-60+ min), the canonical VO2max session (e.g. 4x4 min @ ~90-95% max HR, Norwegian protocol), strength sessions (compound lifts, sets/reps for health vs hypertrophy vs strength), stability/mobility, and "rucking/incline walk" as a Zone 2 option. WU/main/CD for each.

5. ADAPTATION. Scale to days/week, experience (beginner/intermediate/advanced), age (Attia cares a lot about masters/older adults, falls, bone density, stability), injuries, and EQUIPMENT/modality (general fitness people use bikes, rowers, treadmills, weights, not just running). How to substitute modalities while keeping the Zone 2 / VO2max / strength stimulus.

6. TAPER / PEAKING. [5K10K] short taper (about 1 week) for a goal race. [GENERAL] usually none; how to "test" fitness (a VO2max test, a Zone 2 benchmark, a strength test) periodically instead.

7. RACE-DAY / TEST-DAY. [5K10K] 5K and 10K pacing strategy (these are run much closer to threshold/VO2, so pacing differs from the marathon), warmup protocol (proper WU matters far more for short races), and fueling (minimal for 5K/10K). [GENERAL] how to run a periodic fitness test safely and what to measure.

8. PROGRESS / PROJECTION. [5K10K] predict 5K/10K/mile times from a recent race (VDOT + Riegel), confidence + range. [GENERAL] there's no finish time — define how to MEASURE and PROJECT progress instead: estimated VO2max (give the formulas, e.g. from a race, from HR, from the Cooper/Rockport tests), Zone 2 pace/power at a fixed HR improving over time, resting HR trend, strength benchmarks, "fitness age." What to show a general user as their "are you getting fitter" signal.

9. ANTI-PATTERNS / SAFETY. [5K10K] too much intensity (5K/10K runners over-race workouts), neglecting easy volume, spiking speedwork. [GENERAL] the big one: people do everything at moderate intensity ("grey zone") and never truly easy or truly hard; also neglecting strength, neglecting Zone 2 for only-HIIT, ego-lifting, ignoring recovery. Explicit DO-NOT rules with numbers.

10. FEASIBILITY / GOAL-SETTING. [5K10K] min training for a goal 5K/10K time (VDOT-based). [GENERAL] realistic health-improvement timelines (how fast VO2max, Zone 2, and strength actually improve for a beginner vs trained person), and how to set a motivating but realistic 8-12 week goal when there's no race.

FORMAT: clear headers and bullets, tables for anything numeric (VDOT paces, zone definitions, weekly hour targets, VO2max norms by age/sex, progression rates), explicit numbers and rules I can turn into code, mark every [5K10K vs GENERAL] difference, dense, no filler.

---

# COACH PAIR 4 — Sprint + Olympic triathlon (round 1; NEW conversation)

You are a world-class triathlon coach and exercise physiologist specializing in SHORT-COURSE racing: the Sprint triathlon (750 m swim / 20 km bike / 5 km run) and the Olympic / standard triathlon (1500 m swim / 40 km bike / 10 km run). I am building an AI coaching app that (a) generates personalized, periodized training plans and (b) predicts race finish times from an athlete's real training data. I need a rigorous, structured reference I can encode directly into the app's rules.

Cover BOTH the Sprint and the Olympic. Whenever they differ, mark it [SPRINT vs OLY]. Be specific and quantitative: numbers, ranges, formulas, tables, not vague philosophy. Ground it in the established methodologies and cite which one (Joe Friel / Triathlete's Training Bible — short course, Brett Sutton, Matt Dixon / Fast-Track Triathlete, Stephen Seiler / polarized, Andrew Coggan / power, Jack Daniels & Pete Riegel for the run projection). Critical framing: unlike Ironman, short course is raced AT or ABOVE threshold, so the training is more intensity-driven — make every section reflect that. Every rule should map to a constant, lookup, or validator.

Produce these sections:

1. PERIODIZATION MODEL — phase structure (Base -> Build -> Peak -> short Taper -> Race); typical phase durations and how they scale with weeks-to-race (table for 8, 12, 16, and 24 weeks); how to set phase boundaries purely from time-to-race; the minimum viable build for a first-timer [SPRINT vs OLY]. Show how the short-course intensity mix shifts vs Ironman.

2. WEEKLY STRUCTURE & PROGRESSION (most important, hard numbers): max safe week-to-week volume increase (% per week) by experience; deload/recovery-week cadence and how much to cut; minimum and typical REST days per week by level and phase; max sessions/day and when a double is appropriate for a short-course athlete; how a weekly HOURS budget (Sprint ~5-9 h, Olympic ~7-12 h — confirm or correct) maps to number of sessions per sport and their durations; intensity distribution by phase (short course runs hotter than IM's 80/20 — give the actual % of weekly time per zone, by phase, and the sport-by-sport split for SPRINT and OLY). Give explicit guardrail rules (with numbers) that keep week-to-week load smooth, always include adequate rest, and never spike.

3. ZONES — HR zones from LTHR (run and bike separately) and swim zones from CSS; Z1-Z5 % ranges in a table; and the specific RACE zone each leg is held at for Sprint vs Olympic (these are well above Ironman effort).

4. SESSION LIBRARY (per sport) — for swim, bike, run: every standard session type (easy/endurance, tempo, threshold, VO2/intervals, speed, long, recovery, technique/drills), each with target zone, typical duration/distance by phase, and purpose, emphasizing the THRESHOLD and VO2max work that short course depends on. BRICKS are central here, so go deep: optimal frequency, length, structure, and the race-pace brick simulation [SPRINT vs OLY], plus the bike-to-run "jelly legs" adaptation. TRANSITIONS (T1/T2): how to train them and how much time they cost. Strength: how much, what type, where in the week, what to avoid near key sessions. Open-water vs pool swim skills (sighting, drafting, mass start).

5. ADAPTATION TO THE ATHLETE — scale to available training days/week, weekly hours budget, experience (beginner/intermediate/advanced), current fitness (run LTHR / bike LTHR or FTP / swim CSS / recent run PB), injuries/limiters, and equipment (pool vs open water, trainer, etc.). How to place the key swim, the threshold bike, the brick, and the long sessions across a 7-day week while protecting recovery. Draft-legal (ITU-style) vs non-draft age-group racing — how it changes bike training, if at all.

6. TAPER — taper length and the volume/intensity changes for Sprint vs Olympic (short races over-taper easily — give the numbers); how much to cut, what intensity to keep.

7. RACE-DAY EXECUTION (we display per-leg pacing) — target pacing for each leg (swim, bike, run) relative to threshold/zones, for Sprint vs Olympic (these are raced much closer to or above threshold than IM). For EACH leg give a single credible one-line rationale ("why") a smart athlete would respect, including how hard to push the bike while still being able to run fast off it. Transition strategy. Fueling/hydration (minimal for sprint, modest for olympic — give carbs/hr and fluid numbers).

8. RACE-TIME PROJECTION METHODOLOGY (we predict finish times from training data) — how to project a Sprint / Olympic finish from recent benchmarks: run split from a recent 5K/10K PB (Riegel exponent + a SHORT-COURSE tri fatigue factor that is MUCH smaller than Ironman's because the run leg is short — give the actual multipliers for Sprint and Olympic by ability); bike split from FTP/NP or average aerobic speed times a short-course race factor (these are ridden well above Z2 — give the factors); swim split from CSS plus a buffer; plus T1/T2 time estimates. Give the actual formulas. State the MINIMUM data needed for a credible projection, what raises/lowers confidence, and concrete LOW/MEDIUM/HIGH confidence criteria (data thresholds). Show how to communicate the result as a range. WORKED EXAMPLE: project a full Sprint and a full Olympic finish, step by step, for an athlete with a 5K PB 21:12, bike ~26 km/h aerobic / FTP ~210 W, swim CSS 1:56/100m, ~10 weeks consistent — swim split, T1, bike split (show how you get speed/time), T2, run split (open-5K/10K prediction then the short-course fatigue factor applied), and total, with the confidence label and range.

9. ANTI-PATTERNS / SAFETY — explicit DO-NOT rules with numbers. The short-course-specific mistakes: too much slow aerobic volume and not enough threshold/VO2 (the opposite of the IM mistake); OR all intensity and no aerobic base; neglecting the swim because it's "only 10-15% of the race"; never practicing bricks or transitions; over-tapering a short race; load spikes / no recovery week / unrealistic ramp.

10. FEASIBILITY / SANITY CHECK — given a goal time + weeks-to-race + current fitness, judge whether the goal is realistic, and the minimum training (weekly hours, number of weeks, key sessions, longest brick) a given Sprint or Olympic goal requires. Pair any "unrealistic" verdict with the specific lever (more weeks, more volume/intensity, or a softer goal).

FORMAT: clear headers and bullets, tables for anything numeric (zone %, phase durations, hours->sessions maps, fatigue/race factors, confidence thresholds), explicit numbers and rules I can turn into code, mark every [SPRINT vs OLY] difference, dense, no filler.

---

# Coach pair 4 round 2 follow-up (paste into the SAME sprint/olympic conversation)

That reference is excellent and I have already encoded the periodization, the short-course intensity mix, the brick rules, the race-pace targets, and the deterministic projection (run PB + short-course fatigue factor, bike speed times a race factor, swim from CSS) into the app. Now I want to go deeper and make sure we are not missing anything, because for this app the quality of the coach is everything. Keep covering BOTH Sprint and Olympic, mark every [SPRINT vs OLY] difference, stay dense and numeric, ground it in Friel / Sutton / Dixon / Seiler / Coggan.

Two asks first:

A) REVIEW AND EXTEND your own reference. Re-read what you wrote and add anything you left out, glossed over, or could make more precise or codeable. Same style.

B) Give me YOUR expert opinion on what a truly great AI short-course triathlon coach should have that I did not think to ask for. Do not hold back. If there is a whole topic we are missing (open-water race craft, drafting tactics, transition speed, fast-twitch/run-speed development for the 5K off the bike, female-athlete physiology, masters athletes, youth/draft-legal development), add it.

Then go deep on these specific areas. For each give hard numbers, formulas, tables, and at least one worked example:

1. ADAPTIVE ADJUSTMENT (most important). Given a completed week of real data (HR drift per session, actual pace/power/speed vs target, sessions completed vs missed, RPE and felt-tags easy/hard/sore/sick, the 2-3 week trend), give explicit rules for adjusting NEXT week — including the short-course-specific case where the athlete is hitting volume but the QUALITY/threshold sessions are fading (the signal to back off intensity, not volume). Overtraining / under-recovery red flags and the response to each.

2. IN-SESSION STRUCTURE. For each session type per sport (and the brick), a warmup / main set / cooldown template with durations and targets, and how to SCALE reps/volume by phase, so a description is concrete and prescriptive instead of vague. Show how a threshold bike and a VO2max run session grow from Base to Peak.

3. KEY-SESSION PLACEMENT across the week. Exact spacing rules for hard sessions (what counts as the same energy system across swim/bike/run, the minimum gap), and ready-to-use 7-day weekly templates for 5-, 6-, and 7-day availability, for SPRINT and OLY, in Base / Build / Peak, showing where the brick, the key swim, rest, and deload sit.

4. PROJECTION DEPTH. More worked examples: a swim-limited athlete, a strong cyclist / weak runner, a draft-legal vs non-draft Olympic athlete, and a Sprint-to-Olympic step-up. How to update the projection as fitness changes mid-block, and how a recent brick-run pace can sharpen the run split estimate.

5. RECOVERY & READINESS. How to read fatigue from resting HR / HRV / sleep / mood when available, and from training data (pace/power at fixed HR, RPE creep, drift) when not; concrete thresholds for inserting unplanned rest or cutting a week short.

6. ENVIRONMENT & LOGISTICS. Heat / cold-water / wetsuit-legal temperature / altitude adjustments, hilly-bike and hot-run pacing, and a race-week + race-morning checklist specific to short course (transition setup, warm-up that actually matters for a 5K-off-the-bike, etc.).

7. STRENGTH PROGRESSION across a season (sets / reps / load by phase) and the injury-prevention + mobility essentials per sport for a triathlete.

8. PROACTIVE COACHING. The specific situations a good short-course coach should NOTICE and message about unprompted (missed bricks, easy sessions creeping into the grey zone, threshold sessions stalling, neglected swim, taper anxiety, race week, new PB), each with the trigger condition and the message intent.

Format: dense, hard numbers, tables, formulas, worked examples, [SPRINT vs OLY] marked, no filler. Give me everything; if in doubt, include it.
