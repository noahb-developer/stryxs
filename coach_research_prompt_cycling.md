# COACH PAIR 5 — Standalone Cycling (road)

Paste the ROUND 1 block into a strong research model. Paste its full output back to Claude Code to encode. Then paste the ROUND 2 block into the SAME conversation and paste that output back too.

---

## ROUND 1 (new conversation)

You are a world-class cycling coach and exercise physiologist specializing in road cycling for amateur through competitive cyclists. I am building an AI coaching app that (a) generates personalized, periodized training plans and (b) predicts event finish times from a cyclist's real training data. I need a rigorous, structured reference I can encode directly into the AI's rules.

This persona is the STANDALONE CYCLIST (NOT triathlon — no swim, no run). Cover the spectrum of road-cycling goals and mark where they diverge:
- [ENDURANCE] long-distance events — century (160 km / 100 mi), 100 km, gran fondo / sportive / audax.
- [PERFORMANCE] threshold & power development — raising FTP, road race / criterium fitness, time trial.
- [CLIMBING] climbing-focused (W/kg, sustained climbs).
- [FITNESS] general aerobic fitness riding (no event), for completeness.

Be specific and quantitative: numbers, ranges, formulas, tables — not vague philosophy. Ground it in and cite the established methodologies (Andrew Coggan & Hunter Allen — Training and Racing with a Power Meter; Joe Friel — The Cyclist's Training Bible; Stephen Seiler — polarized; sweet-spot training / Frank Overton — FasCat; Tim Cusick — WKO; British Cycling). Key every rule to three experience tiers (beginner / intermediate / advanced) and give a DEFAULT value for every range. CRITICAL: many riders have NO power meter — every power-based rule must have an HR (from bike LTHR) and an RPE fallback.

Reminder of the athlete data the app has, so every rule keys off real fields: bike FTP (watts), bike LTHR, body weight (for W/kg), recent rides with average power / normalized power / average HR / distance / duration / average speed / elevation gain, experience tier, available training days, weekly hours, equipment (road bike, indoor / smart trainer, power meter yes-no, gym), age / sex, injuries, and a live training-load model (CTL fitness, ATL fatigue, TSB form, ACWR), plus per-session HR drift % and completed-vs-planned sessions.

Produce these sections:

1. PERIODIZATION MODEL — phase structure (Base -> Build -> Peak -> Taper -> Event); typical phase durations and how they scale with weeks-to-event (table for 8, 12, 16, 24, 36 weeks); how to set phase boundaries purely from weeks-to-event; minimum viable build for a first event. Mark how the mix differs [ENDURANCE vs PERFORMANCE vs CLIMBING]. For [FITNESS] give a sustainable rolling structure with periodic build blocks (no event date).

2. WEEKLY STRUCTURE & PROGRESSION RULES (most important, hard numbers) — max safe week-to-week volume increase (% per week, in hours or TSS) by tier; recovery/deload cadence and how much to cut; min and typical REST days/week by tier and phase; when a two-a-day is OK vs harmful; how a weekly HOURS budget (give typical ranges by tier and goal) maps to ride count and durations; intensity distribution by phase (address the polarized vs sweet-spot debate — give the actual % of weekly time per zone, by phase and by goal); the role and weekly dose of the long ride (% of weekly hours + absolute caps by goal). Give explicit guardrail rules (with numbers) that keep week-to-week load smooth and always include adequate rest — the app must NEVER spike from several rest days one week to zero rest and multiple rides/day the next.

3. ZONES — the Coggan 7-zone power model as % of FTP (Z1 active recovery ... Z7 neuromuscular) in a table, with each zone's purpose; the matching HR zones from bike LTHR (for no-power riders); and an RPE anchor for each. Define FTP and how to estimate it (20-min test x 0.95, ramp test, and from a hard ~40-60 min effort). Define sweet spot (88-94% FTP) precisely.

4. SESSION LIBRARY — every standard ride type: recovery, endurance / Zone 2 (the backbone), tempo, sweet spot, threshold / FTP intervals (e.g. 2x20, 3x12, 4x8 at %FTP), VO2max (e.g. 5x4, 30/30), anaerobic / sprints, over-unders, big-gear / low-cadence torque, hill repeats, the long endurance ride, the opener. For each: target power %FTP AND HR zone, typical duration/structure by phase, and purpose. Give a warmup / main set / cooldown template per session type (these become the workout-description strings the app displays). Mark which are emphasized [ENDURANCE vs PERFORMANCE vs CLIMBING]. Cover indoor-trainer / ERG execution.

5. ADAPTATION TO THE ATHLETE — scale to available days/week, weekly hours, tier, current fitness (FTP / W/kg / bike LTHR / recent ride data), injuries, and equipment (no power meter -> HR/RPE prescription; indoor trainer vs road; gym access). How to place the long ride, the key threshold/VO2 sessions, and recovery across a 7-day week. How body weight / W/kg changes the climbing prescription.

6. TAPER — length and the volume/intensity changes for an endurance event vs a performance/race peak; how much to cut, what intensity to keep, the pre-event opener.

7. EVENT-DAY EXECUTION — pacing strategy by goal: [ENDURANCE] target Intensity Factor / %FTP / normalized power for a century / fondo and how to avoid blowing up, fueling (carbs/hr — 60-90+ g/hr — fluid, sodium), pacing climbs vs flats, drafting / group riding; [PERFORMANCE] TT pacing (%FTP by duration), crit / road-race surges; [CLIMBING] pacing a long climb at %FTP / target W/kg. Give one credible one-line "why" per strategy.

8. EVENT-TIME / PERFORMANCE PROJECTION METHODOLOGY (most important for me — be exact) — my engine predicts an event finish (or a target-distance time) DETERMINISTICALLY from training data, and I need the codeable cycling model:
- The power-duration relationship: the % of FTP a rider can sustain for a given event duration (give a table, e.g. ~1 h ~= 100% FTP, 2 h ~= 85-90%, 3 h ~= ~80%, 4-5 h ~= 70-75%, 6+ h ~= ~65%), by tier (trained riders hold a higher % longer).
- Power -> speed: give a usable model to convert sustainable power to average speed on a given course, EITHER (a) the simplified physics equation P = 0.5*rho*CdA*v^3 + Crr*m*g*v + m*g*grade*v with sensible DEFAULT CdA / Crr / rho / system-mass values and how to solve for v, OR (b) a tier-and-terrain average-speed lookup (flat / rolling / hilly) with a power-to-weight adjustment — give whichever is most robust to encode, WITH the constants.
- A DEFAULT FTP, W/kg, and average speed by tier when the rider has NO power data (so we can still project), and a default course terrain when unknown.
- The MINIMUM data for a credible projection; concrete LOW / MEDIUM / HIGH confidence criteria (data thresholds); the +/- % range per level.
- WORKED EXAMPLE, step by step: an intermediate rider, FTP 250 W, weight 75 kg (3.33 W/kg), recent long ride 3 h at ~30 km/h on rolling terrain — project a 100 km gran fondo on rolling terrain AND a flat 40 km TT: show the sustainable power for each duration, the power->speed step with the numbers, the time, the confidence label, and the range. Keep every number internally consistent — I will unit-test the code against them.

9. ANTI-PATTERNS / SAFETY RULES — explicit DO-NOT rules with numbers, cycling-specific: the "grey zone" trap (endless tempo, never truly easy or truly hard), too much intensity / not enough Z2 base, neglecting recovery, ramping FTP test-to-test too fast, ignoring fueling on long rides (bonking), saddle / contact-point and knee-overuse issues from rapid load or poor bike fit, over-relying on the indoor trainer. Include load-spike / ACWR / no-deload guardrails.

10. FEASIBILITY / SANITY CHECK — given a goal (finish a century, a sub-X TT, a target FTP or W/kg, a gran fondo time) + weeks-to-event + current fitness, judge whether it is realistic and the minimum training (weekly hours, longest ride, weeks, key sessions/wk) it requires; how fast FTP and W/kg realistically improve for a beginner vs a trained rider (give rates). Pair any "unrealistic" verdict with the specific lever (more weeks, more volume, more intensity, weight, or a softer goal).

FORMAT: clear headers and bullets, tables for anything numeric (zone %FTP, phase durations, hours->rides maps, power-duration %, speed-by-terrain, confidence thresholds, W/kg norms by tier/sex), explicit numbers and rules I can turn into code, mark every [ENDURANCE vs PERFORMANCE vs CLIMBING vs FITNESS] divergence, every rule keyed to beginner/intermediate/advanced WITH a default, thorough but dense, no filler.

---

## ROUND 2 (paste into the SAME cycling conversation)

That reference is excellent and I have already encoded the periodization, the Coggan zones and FTP math, the intensity mix by phase, the progression/deload guardrails, and the deterministic event projection (power-duration % of FTP plus the power->speed model with the worked example) into the app. Now I want to go deeper and make sure we are not missing anything, because for this app the quality of the coach is everything. Keep covering the standalone cyclist across [ENDURANCE vs PERFORMANCE vs CLIMBING vs FITNESS], mark every divergence, stay dense and numeric, ground it in Coggan/Allen, Friel, Seiler, FasCat, WKO, and give a DEFAULT for every range. Keep the HR and RPE fallbacks for no-power riders in every section.

Two asks first:

A) REVIEW AND EXTEND your own reference. Re-read what you wrote and add anything you left out, glossed over, or could make more precise or codeable. Same style.

B) Give me YOUR expert opinion on what a truly great AI cycling coach should have that I did not think to ask for. Do not hold back. If there is a whole topic we are missing (cadence / pedaling efficiency development, durability / "fatigue resistance" and repeatability of efforts late in long rides, female-athlete physiology and cycle-based adjustments, masters cyclists, bike fit and contact-point comfort, indoor-vs-outdoor power discrepancy, fasted / fueled riding and carb periodization, gravel / ultra-endurance), add it.

Then go deep on these specific areas. For each give hard numbers, formulas, tables, and at least one worked example:

1. ADAPTIVE ADJUSTMENT (the most important gap). Given a completed week of real data (HR drift % per ride, actual power/speed vs target, normalized power and IF, sessions completed vs missed, RPE and felt-tags easy/hard/sore/sick, the CTL/ATL/TSB/ACWR load model, and the 2-3 week trend), give explicit rules for how to adjust NEXT week. For example: "if drift > X% on most endurance rides, cut volume Y%"; "if the key long ride was missed, do not stack it, do Z"; "if threshold power is fading at equal HR over 2 sessions, back off INTENSITY (not volume) by X"; "if RPE is consistently high or sore/sick logged, trigger an early deload". Plus overtraining / under-recovery red flags with the ACWR / TSB / drift thresholds that trigger them and the response to each.

2. IN-SESSION STRUCTURE. For each ride type, a warmup / main set / cooldown template with durations and targets, and how to SCALE the reps/volume by phase (show a threshold session and a VO2max session growing Base -> Build -> Peak), so a workout description is concrete and prescriptive. Include the ERG-mode / indoor variant.

3. WEEKLY TEMPLATES. Ready-to-use 7-day layouts for 3-, 4-, 5-, 6-, and 7-day availability, for an [ENDURANCE] block and a [PERFORMANCE] block, in Base / Build / Peak, showing exact placement of the long ride, the key threshold/VO2 days, easy/recovery, and rest, with the spacing rules baked in.

4. PROJECTION DEPTH. More worked examples using realistic cases: a strong-but-heavy rider (high FTP, low W/kg) on a hilly fondo vs a flat century; a no-power rider projected from average speed + HR only; how to UPDATE the projection as FTP changes mid-block; and a flat-TT vs hilly-TT comparison. Keep every number internally consistent so I can unit-test it.

5. RECOVERY & READINESS. How to read fatigue from resting HR / HRV / sleep / mood when available, and from training data (power at fixed HR, RPE creep, drift, TSB) when not; concrete thresholds for inserting unplanned rest or pulling back.

6. ENVIRONMENT & LOGISTICS. Heat / cold / wind / altitude adjustments (numbers), long-climb and descent pacing, indoor-trainer power and heat offset, and an event-week + event-morning checklist (fueling, warm-up that matters, pacing plan).

7. STRENGTH PROGRESSION across a season (sets / reps / load by phase, as a table), and the injury-prevention + mobility + bike-fit essentials for a cyclist (knees, lower back, neck, hands/saddle).

8. PROACTIVE COACHING. The specific situations a good cycling coach should NOTICE from the data and message the rider about unprompted (for example: every ride drifting into tempo grey-zone, missed long rides, threshold stalling at equal HR, an ACWR spike, a new FTP / power PB, taper anxiety, event week), each with the trigger condition (the data threshold) and the intent of the message.

Format: dense, hard numbers, tables, formulas, worked examples, divergences marked, no filler. Give me everything; if in doubt, include it.
