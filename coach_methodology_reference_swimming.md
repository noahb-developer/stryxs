# STANDALONE SWIMMER METHODOLOGY, PART 1
## Persona: `swimmer` (pool racing, open water, technique, swim fitness). NOT triathlon. No bike, no run. Factor tables in this document are scoped to this persona only and must never leak into triathlon personas.

Sources: Paul Newsome and Adam Young (Swim Smooth, Critical Swim Speed system), Ernest Maglischo (Swimming Fastest, energy system training), Jan Olbrecht (The Science of Winning), James Counsilman (The Science of Swimming), Brent Rushall (USRPT), USA Swimming and British Swimming zone frameworks, Sheila Taormina (Swim Speed Secrets, catch mechanics), Stephen Seiler (intensity distribution), Tim Gabbett (ACWR load management).

Goal flags used throughout: [DISTANCE] = 1500 m pool and open water 1.5 km / 3.8 km / 5 km / 10 km. [SPEED] = pool 50 / 100 / 200 / 400 m, masters meets. [TECHNIQUE] = efficiency-limited swimmer. [FITNESS] = no event, general aerobic swim fitness.

Core principle (Swim Smooth, Taormina): swimming is the one endurance sport where TECHNIQUE, not fitness, is usually the primary lever below intermediate level. Drag rises with the square of velocity, and propulsion efficiency in poor swimmers can be under 50 percent of trained swimmers. A beginner gains far more from 10 seconds per 100 m of drag reduction than from any fitness block. Every rule below encodes this: technique volume is a first-class budget line, not a warmup garnish.

Currency: PACE per 100 m anchored on CSS, plus stroke metrics (stroke count, SWOLF). HR is a secondary, often-absent signal in water. Every prescription carries an RPE fallback and a pace-clock fallback.

---

## 1. PERIODIZATION MODEL

Phase sequence: Base -> Build -> Peak -> Taper -> Event. Linear periodization per Maglischo and Counsilman; Olbrecht's capacity-before-power ordering governs what goes in each phase (aerobic and anaerobic CAPACITY early, POWER and race pace late).

Phase purposes:

| Phase | Purpose | Dominant zones | Technique share of volume |
|---|---|---|---|
| Base | Aerobic capacity, stroke mechanics, build weekly meters | Z1 to Z3, drills | 20 to 30 percent |
| Build | Threshold (CSS) and event-specific endurance or speed | Z3 to Z4, plus Z5 [SPEED] | 15 to 20 percent |
| Peak | Race-pace specificity, sharpen, hold volume slightly down | Z4 plus race pace | 10 to 15 percent |
| Taper | Shed fatigue, keep intensity touches, maximize feel for water | Reduced volume, race-pace touches | 10 percent, feel-based |

### Phase durations by weeks-to-event

Boundaries are set purely from weeks-to-event. Taper is fixed-ish; Base absorbs the slack.

| Weeks to event | Base | Build | Peak | Taper |
|---|---|---|---|---|
| 8 | 3 | 3 | 1 | 1 |
| 12 | 5 | 4 | 2 | 1 |
| 16 | 7 | 5 | 2 | 2 |
| 24 | 12 | 7 | 3 | 2 |
| 36 | 20 | 10 | 4 | 2 |

DEFAULT if weeks-to-event is between rows: interpolate Base; Build max 10 weeks; Peak max 4; Taper per section 6 of Part 2 (1 week [DISTANCE] short, 2 weeks [DISTANCE] long and [SPEED] meet peak).

Goal divergences:
- [DISTANCE] longer Base share (60 percent of available weeks at 24-plus weeks), Build emphasizes CSS and over-distance, Peak adds open-water specificity (sighting, drafting, wetsuit swims).
- [SPEED] shorter Base, longer Peak. At 16 weeks: Base 6, Build 5, Peak 3, Taper 2. Peak is race-pace heavy (Rushall USRPT logic: specificity of velocity and stroke rate).
- [TECHNIQUE] a 4 to 8 week TECHNIQUE block REPLACES Base for low-skill swimmers. Rule: if stroke count per 25 m exceeds 22 (beginner male) or 24 (beginner female), or SWOLF per 25 m exceeds 45, technique block is mandatory before any fitness build. DEFAULT technique block: 6 weeks, 40 to 50 percent of volume as drill and technique work.
- [FITNESS] no event date. Rolling structure: 3 weeks progressive load plus 1 deload week, repeating. Every third cycle, swap one aerobic session for a CSS development block of 4 weeks to nudge threshold. No taper ever; volume oscillates between 85 and 100 percent of sustainable weekly meters.

Minimum viable build for a first event:
- First 1500 m pool or 1.5 km open water: 8 weeks, 3 swims per week, reaching 6,000 m per week with a longest swim of 1,800 m continuous.
- First 3.8 km open water: 16 weeks, 3 to 4 swims per week, reaching 10,000 m per week with a longest swim of 3,000 m.
- First 5 km open water: 20 weeks, 4 swims per week, 12,000 m per week, longest swim 4,000 m.
- First 10 km: 28 weeks, 5 swims per week, 20,000 m per week, longest swim 7,500 m.
- First masters 100 m race: 8 weeks, 3 swims per week, 5,000 m per week, with 2 race-pace sessions weekly in the final 4 weeks.

---

## 2. WEEKLY STRUCTURE AND PROGRESSION RULES

### 2.1 Volume ramp guardrails (weekly meters)

| Tier | Max week-over-week increase | Absolute cap per week added | ACWR ceiling |
|---|---|---|---|
| Beginner | 10 percent | 1,000 m | 1.20 |
| Intermediate | 10 percent | 1,500 m | 1.30 |
| Advanced | 12 percent | 2,500 m | 1.30 |

DEFAULT: 10 percent. Apply the SMALLER of the percent rule and the absolute cap. ACWR computed on weekly meters (acute 7-day vs chronic 28-day rolling). If ACWR would exceed the ceiling, clamp the planned week down to the ceiling. Gabbett sweet spot 0.8 to 1.3 applies.

### 2.2 Shoulder load cap (this is the swimming-specific guardrail, dominant overuse injury)

Shoulder load is not just meters. Weight it:

shoulder_load_units = meters_freestyle x 1.0 + meters_paddles x 1.6 + meters_pull_buoy x 1.1 + meters_band_only x 1.8 + meters_fins x 0.8 + meters_kick x 0.3

Rules:
- Shoulder_load_units may rise max 10 percent per week regardless of raw meters (DEFAULT, all tiers).
- Paddle volume: max 10 percent of weekly meters (beginner: 0 percent until stroke count per 25 m is under 22), 15 percent intermediate, 20 percent advanced. DEFAULT 10 percent.
- Never schedule two paddle or high-shoulder-stress sessions on consecutive days.
- Any reported shoulder pain (injury flag): drop paddles and band to zero, cut weekly meters 30 percent, add fins to easy swims (fins reduce per-stroke arm load), re-evaluate in 7 days.
- Sprint sessions (Z6) count x1.3 on shoulder_load_units for their meters.

### 2.3 Deload cadence

| Tier | Cadence | Volume cut in deload week | Intensity in deload |
|---|---|---|---|
| Beginner | every 3rd week | minus 40 percent | keep 1 short CSS touch |
| Intermediate | every 4th week | minus 35 percent | keep 1 CSS session at half size |
| Advanced | every 4th week | minus 30 percent | keep key sessions at 60 percent size |

DEFAULT: every 4th week, minus 35 percent. Masters athletes age 50 plus: force every 3rd week.

### 2.4 Sessions per week, rest days, weekly meters by tier and goal

| Tier | Sessions/wk min | Sessions/wk typical | Full rest days min | Weekly meters typical |
|---|---|---|---|---|
| Beginner | 2 | 3 | 2 | 4,000 to 7,000 |
| Intermediate | 3 | 4 | 1 to 2 | 8,000 to 15,000 |
| Advanced | 4 | 5 to 6 | 1 | 16,000 to 30,000 |

Goal adjustments to typical weekly meters: [DISTANCE 3.8 km plus] add 20 percent; [10 km] add 50 percent; [SPEED] subtract 20 percent but add one session (shorter, more intense); [TECHNIQUE] meters do not matter, sessions do, minimum 3 per week for motor learning frequency (Counsilman: skill consolidation requires frequent short exposures, not rare long ones); [FITNESS] 2 to 4 sessions, 4,000 to 10,000 m.

Hours-to-meters conversion when the athlete gives an hours budget: meters_per_hour = 3600 / (CSS_seconds_per_100m x 1.45) x 100. The 1.45 factor covers rest intervals, drills, and easy share. DEFAULT for unknown CSS: beginner 1,800 m/h, intermediate 2,300 m/h, advanced 2,800 m/h.

Distance-to-sessions map (how a weekly meter budget splits):

| Weekly meters | Sessions | Per-session distance |
|---|---|---|
| 4,000 to 6,000 | 3 | 1,400 to 2,000 m |
| 6,000 to 10,000 | 3 to 4 | 2,000 to 2,500 m |
| 10,000 to 15,000 | 4 to 5 | 2,500 to 3,000 m |
| 15,000 to 22,000 | 5 to 6 | 3,000 to 3,800 m |
| 22,000 plus | 6 to 9 | 3,500 to 4,500 m |

Rule: per-session distance should stay within 0.75x to 1.5x of the athlete's average session; never create a single session above 2x the athlete's recent longest swim.

### 2.5 Intensity distribution (percent of weekly METERS per zone, by phase and goal)

The aerobic-base vs USRPT debate, resolved for the app: Seiler-style polarized aerobic base wins for [DISTANCE] and for all beginners (aerobic capacity and technique under low fatigue). Rushall's USRPT race-pace specificity wins a larger share in [SPEED] Build and Peak, but never the whole week: full USRPT discards aerobic maintenance and overloads shoulders with daily high-velocity work. The app blends: polarized base, race-pace sharpening.

[DISTANCE]:

| Phase | Z1-Z2 easy aerobic | Z3 steady | Z4 CSS | Z5 VO2 | Z6 sprint | Drill/technique |
|---|---|---|---|---|---|---|
| Base | 55 | 10 | 8 | 2 | 0 | 25 |
| Build | 50 | 12 | 18 | 4 | 1 | 15 |
| Peak | 45 | 12 | 22 | 6 | 2 | 13 |

[SPEED]:

| Phase | Z1-Z2 | Z3 | Z4 CSS | Z5 VO2 | Z6 race pace/sprint | Drill/technique |
|---|---|---|---|---|---|---|
| Base | 50 | 10 | 12 | 3 | 5 | 20 |
| Build | 42 | 8 | 15 | 10 | 10 | 15 |
| Peak | 40 | 5 | 10 | 12 | 20 | 13 |

[TECHNIQUE]: 45 drill, 45 Z1-Z2, 10 Z4 touches (pace work only to test whether efficiency holds at speed).

[FITNESS]: 65 Z1-Z2, 10 Z3, 10 Z4, 0 to 2 Z5, 15 drill.

DEFAULT when goal unknown: use [FITNESS] table.

### 2.6 Long swim and technique dose

- Long continuous or over-distance swim [DISTANCE]: one per week, 25 to 35 percent of weekly meters, capped at 4,500 m (intermediate) or 7,500 m (advanced, 10 km goal). Grows max 500 m per week. DEFAULT 30 percent.
- Technique work: never below 10 percent of weekly meters in any phase for any goal. Beginner floor: 20 percent. The app must treat a week with under 10 percent drill volume as a validation failure.
- Guardrail set (hard rules the generator must satisfy every week): (1) ramp rules 2.1 and 2.2 pass, (2) at least the minimum rest days, (3) no two Z4-plus sessions on consecutive days for beginner and intermediate (advanced may stack two if one is short), (4) deload on schedule, (5) drill floor met, (6) long swim not on the day after the hardest CSS session.

---

## 3. ZONES (CSS-anchored)

### CSS definition and test

CSS approximates the speed at maximal metabolic steady state, the swimming analog of FTP or threshold pace (Newsome and Young, after Wakayoshi et al). Protocol: in one session, after full warmup, swim a 400 m time trial from a push, rest 8 to 10 minutes easy, then a 200 m time trial from a push.

- CS (m/s) = (400 − 200) / (t400 − t200)
- CSS pace per 100 m (seconds) = (t400 − t200) / 2
- D' (anaerobic distance capacity, meters) = 400 − CS x t400 (equivalently 200 − CS x t200)

Alternative tests: (a) 1000 m time trial, CSS pace = t1000 / 10 x 0.97 (the 3 percent correction maps a 1000 effort back to true CSS); (b) 30-minute T-time test (Maglischo style), CSS pace = pace per 100 of the 30-min swim x 0.99. DEFAULT test: 400/200. Retest cadence: every 6 weeks in Base and Build, not in the final 3 weeks before an event. Beginners retest every 4 weeks (faster technique-driven change).

### Zone table (paces as offsets from CSS pace per 100 m)

| Zone | Name | Pace vs CSS | RPE (1-10) | Send-off feel | Stroke-rate / HR note | Purpose |
|---|---|---|---|---|---|---|
| Z1 | Recovery | CSS + 12 to +20 s | 2 to 3 | continuous, no clock pressure | SR minus 6 to 8 spm vs race; HR under 70 percent max if worn | Flush, technique under zero fatigue |
| Z2 | Aerobic A1-A2 | CSS + 7 to +12 s | 4 to 5 | rest 10 to 20 s per 100 | SR minus 4 to 6 spm | Aerobic capacity backbone (Olbrecht capacity) |
| Z3 | Aerobic threshold A3 | CSS + 4 to +6 s | 6 | rest 10 to 15 s per 100 | SR minus 2 to 4 spm | Steady endurance, marathon-swim pace region |
| Z4 | CSS / anaerobic threshold | CSS − 1 to +2 s, DEFAULT exactly CSS | 7 to 8 | rest 5 to 15 s per 100 (tight send-offs) | race SR minus 0 to 2; HR 85 to 92 percent max | Raise threshold, the key Build zone |
| Z5 | VO2max | CSS − 3 to − 6 s | 9 | work:rest about 1:1 | SR at or above race | Aerobic power |
| Z6 | Sprint / race pace | CSS − 7 s and faster, or goal race pace [SPEED] | 10 | full or near-full recovery (USRPT: short rest, stop at failure) | maximal SR with held stroke length | Speed, power, race specificity |

RPE fallback (no clock, no CSS): Z1 "could swim for hours, nose breathing if it were land", Z2 "comfortable, conversation at the wall", Z3 "comfortably hard", Z4 "hard, sustainable about 20 to 30 minutes max", Z5 "very hard, 3 to 8 minutes max", Z6 "maximal". Pace-clock fallback (knows recent average pace but no CSS): treat recent steady-swim average pace as Z2 midpoint and derive CSS = that pace minus 9 s per 100 m, flag LOW confidence.

---

## 4. SESSION LIBRARY

Every session: warmup (WU), pre-set / activation (PS), main set (MS), cooldown (CD). Send-offs are written for a 25 m pool at intermediate CSS near 1:40; the app recomputes send-offs as swim_time_at_target_pace + rest. 50 m pool execution note at the end.

Send-off formula the app uses: sendoff_seconds = ceil((distance/100 x target_pace_per_100 + rest_seconds) / 5) x 5 (round up to the 5-second clock).

### 4.1 Recovery / technique swim. All goals. Z1.
Pace CSS + 12 to 20, RPE 2-3. WU 200 easy. PS 4x50 drill choice, 15 s rest. MS 6 to 10 x 100 as 50 drill / 50 swim, 20 s rest. CD 100 backstroke or choice. Total 1,200 to 1,800 m. Purpose: flush plus motor learning. Phase: constant all phases.

### 4.2 Aerobic endurance (the backbone). All goals, emphasized [DISTANCE] [FITNESS]. Z2.
Pace CSS + 7 to 12, RPE 4-5. WU 300 mixed. PS 4x50 build, 15 s. MS Base: 3x500 at CSS + 10, 30 s rest; Build: 4x600 at CSS + 8, 30 s; Peak [DISTANCE]: 2x1000 at CSS + 7, 45 s. CD 200 easy. Total 2,000 to 3,400 m.

### 4.3 Threshold / CSS sets (the key Build session). All goals, emphasized [DISTANCE]. Z4.
Pace at CSS exactly, RPE 7-8, short rest so aerobic pressure stays on (Swim Smooth signature). Examples with send-offs at CSS 1:40:
- 10x100 at CSS, 15 s rest, send-off 1:55
- 5x200 at CSS, 20 s rest, send-off 3:40
- 3x400 at CSS + 1, 30 s rest, send-off 7:15
WU 400 mixed plus PS 4x50 descend to CSS. CD 200. Total 2,200 to 3,000 m. Progression across Build: hold pace, lengthen reps (100s -> 200s -> 400s) or shrink rest 15 -> 10 s. Phase dose: 1x per week Base, 2x Build and Peak.

### 4.4 VO2max. Emphasized [SPEED], 1x per week Build and Peak for [DISTANCE]. Z5.
Pace CSS − 3 to − 6, RPE 9, work:rest near 1:1. Examples: 8x50 at CSS − 5 on 1:30 (about 45 s swim, 45 s rest); 16x25 fast on 0:50; 6x100 at CSS − 4 on 3:00. WU 400 plus PS 6x25 build. CD 200. Total 1,600 to 2,200 m.

### 4.5 Sprint / race pace, USRPT style. [SPEED] core session. Z6.
Rushall protocol: pick goal race pace for the target event, swim short reps AT that exact pace with about 15 to 20 s rest, STOP the set at second failure to hold pace. Example for a 100 m goal of 1:20 (20 s per 25): 20x25 at 0:20 per 25 on 0:40 send-off, terminate on second miss. For a 200 m goal: 16x50 at race pace on 1:05. WU 400 plus 4x25 build. CD 300 very easy. Purpose: velocity-specific neuromuscular and pacing adaptation. Cap: max 2 USRPT sessions per week, never consecutive days (shoulder rule x1.3 applies).

### 4.6 Over-distance / long continuous. [DISTANCE] signature. Z2-Z3.
Pace CSS + 6 to 10 early phase, CSS + 4 to 6 in Peak. Continuous or minimally broken. Base: 1,500 to 2,500 straight. Build: 3,000 with every 4th 100 at CSS (pace-change rehearsal). Peak for 3.8 km goal: 3,000 to 3,500 at target race pace effort. WU 300, CD 100.

### 4.7 Broken swims (race simulation). [DISTANCE] and [SPEED] Peak.
Race distance broken with tiny rest, at goal pace. 1500 as 5x300 at goal pace, 20 s rest; 400 as 4x100 at goal pace, 10 s rest [SPEED]. Why: rehearses race pace with just enough rest to complete the full distance at target speed.

### 4.8 Pull sets. Intermediate and advanced only. Z2-Z4.
Pull buoy, optional paddles (respect 2.2 caps). 6x200 pull at CSS + 6, 20 s rest. Purpose: body position plus specific arm endurance. Never in the same week's adjacent days as USRPT.

### 4.9 Kick sets. All goals, small dose. Z2-Z3 effort.
With or without board, 8x50 kick, 20 s rest, RPE 5-6. 5 to 10 percent of session volume. Purpose: body position, ankle flexibility, leg conditioning; [SPEED] adds fast 25 kick for starts and underwaters.

### 4.10 Drill / technique sets. All goals, core for [TECHNIQUE].
Z1-Z2 effort. Structure: 8 to 12 x 50 as 25 drill / 25 swim applying the drill's focus, 20 s rest. Drill menu keyed to fault (Swim Smooth and Taormina): catch setup = sculling front, single-arm; rotation = 6-1-6 with fins; alignment = snorkel swimming; breathing = bilateral 3-5-7; stroke length = fist swimming, stroke-count 25s. Use snorkel and fins to isolate (fins lower shoulder load during drills, allowed even for beginners here).

### 4.11 Open-water specific sets. [DISTANCE] with OW event, mandatory in Peak.
In pool: sighting 12x100 with 2 sightings per 25 at Z3; pace-change 6x200 as 150 at CSS + 6 plus 50 at CSS − 2 (surge rehearsal for drafting and buoy turns); deep-water starts. In open water: continuous swims with buoy turns, drafting practice on a partner's feet and hip. 1x per week in Build, 2x in Peak when OW access exists.

### 25 m vs 50 m pool execution
50 m pool: about half the turns, so the same pace is roughly 1 to 2 s per 100 m harder to hold; cut target pace expectations by 1 s per 100 m (intermediate DEFAULT) when prescribing in a 50 m pool, and lengthen minimum rep length to 50 m (no 25 m reps except sprint from a push). 25 m pool: more push-offs inflate fitness signal; CSS tested in 25 m should be adjusted +1.5 s per 100 m before projecting a 50 m pool or open-water event. DEFAULT pool length when unknown: 25 m.

End of Part 1. Part 2 covers adaptation, taper, event-day execution, the projection engine, anti-patterns, and feasibility.
