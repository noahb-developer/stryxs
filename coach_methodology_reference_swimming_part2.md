# STANDALONE SWIMMER METHODOLOGY, PART 2
## Persona: `swimmer`. Continues Part 1. Adaptation, taper, event-day execution, projection engine, anti-patterns, feasibility. Factor tables scoped to this persona only.

---

## 5. ADAPTATION TO THE ATHLETE

### 5.1 Days-per-week templates (which sessions get priority)

Priority order when slots are scarce: (1) the goal's key session (CSS set [DISTANCE], race-pace set [SPEED], drill session [TECHNIQUE]), (2) long or aerobic backbone swim, (3) second quality or second aerobic, (4) recovery/technique, (5) extras.

| Days/wk | Slot 1 | Slot 2 | Slot 3 | Slot 4 | Slot 5 |
|---|---|---|---|---|---|
| 2 | Key session | Long/aerobic with drill block | | | |
| 3 | Key session | Long/aerobic | Recovery/technique | | |
| 4 | Key session | Long/aerobic | 2nd quality (VO2 or 2nd CSS) | Recovery/technique | |
| 5 | Key session | Long/aerobic | 2nd quality | Pull or kick emphasis aerobic | Recovery/technique |

Spacing rules: key session earliest in the week when freshest; never key session the day after the long swim; 48 h between Z4-plus sessions (beginner and intermediate); recovery swim or rest day after the two hardest days.

### 5.2 Scaling by ability and data
- CSS known and fresh (under 6 weeks old): prescribe all paces from the zone table.
- No CSS test but recent steady swims exist: derive provisional CSS = average steady pace − 9 s per 100 m (Part 1, zone fallback), prescribe by pace clock plus RPE, schedule a 400/200 test inside the next 10 days.
- No data at all: prescribe purely by RPE for 2 weeks, then test.
- Stroke metrics gate: if stroke count per 25 m exceeds the tier threshold (beginner 22, intermediate 19, advanced 16, men; add 2 for women due to average height difference; DEFAULT thresholds men) or SWOLF per 25 exceeds 45 / 40 / 35, shift 10 percentage points of weekly volume from aerobic to drill until under threshold.

### 5.3 Injuries
- Shoulder (dominant): apply section 2.2 hard rules. Substitute kick sets and fins-on easy swimming to preserve aerobic volume at low arm load. Reintroduce paddles last, at 25 percent of prior paddle volume.
- Neck (often from poor breathing mechanics or OW sighting): bilateral breathing drills, reduce sighting reps, snorkel sessions.
- Lower back (often over-arched body position): increase kick and core emphasis, pull buoy ONLY short term (it masks the fault).

### 5.4 Equipment adaptation
- Pool only, OW event: all OW skills trained in pool (Part 1, 4.11); add +1 confidence-range penalty step to OW projections (see 8.6).
- No pull buoy / paddles / fins / snorkel: substitute equivalent unequipped drills; never block a plan on missing toys.
- Wetsuit owned and event is wetsuit-legal: minimum 3 wetsuit swims in final 6 weeks, at least 1 at race-pace effort.
- 50 m pool only or 25 m only: apply Part 1 pool-length pace adjustments.

### 5.5 Low-skill swimmer weighting (the technique-first ramp)
While stroke count or SWOLF is above gate: 40 to 50 percent drill, volume frozen (no weekly ramp). Each retest under the gate releases 10 percentage points from drill into aerobic and unlocks the normal 10 percent volume ramp. Rationale (Taormina, Counsilman): fitness built on high-drag mechanics consolidates bad motor patterns and raises shoulder load per meter of speed.

---

## 6. TAPER

| Goal | Taper length | Volume cut (final week vs peak week) | Intensity kept |
|---|---|---|---|
| [DISTANCE] 1500 to 3.8 km | 7 to 10 days | minus 40 to 50 percent | 2 short sessions with 4 to 6 x 100 at race pace |
| [DISTANCE] 5 to 10 km | 10 to 14 days | minus 40 percent week 1, minus 60 percent race week | weekly race-pace touches, last long-ish swim (40 percent of race distance) 10 days out |
| [SPEED] meet peak | 14 to 21 days (advanced), 10 to 14 (others) | minus 50 to 70 percent progressively | race-pace 25s and 50s, starts and turns, full rest |
| [TECHNIQUE] / [FITNESS] | no taper | n/a | n/a |

DEFAULT: 10 days, minus 50 percent. Frequency stays high during taper (Maglischo: swimmers lose feel for the water faster than fitness): cut session LENGTH, not session COUNT, until the final 3 days. Feel-for-water rule: every taper session includes 200 to 400 m of sculling and catch drills. Pre-event activation swim: day before, 800 to 1,200 m as 400 easy, 4x50 build, 2 to 4 x 25 at race pace, easy 200; if morning-of access exists for [SPEED], 600 m activation 2 to 4 hours pre-race.

---

## 7. EVENT-DAY EXECUTION

[DISTANCE] 1500 m pool: target pace per 100 = CSS + tier offset (table 8.2). Even split with the first 100 no more than 2 s faster than goal pace. Why: above-CSS early surges spend D' that cannot be repaid mid-race.
[DISTANCE] open water 1.5 to 10 km: even or slightly negative split at the table 8.2 pace. Position for the start by ability (front only if seeded pace justifies it), settle by 400 m. Sight every 6 to 10 strokes on a fixed landmark pair. Draft on feet or hip whenever a slightly-faster swimmer is available. Why drafting: 5 to 10 percent energy saving at the same speed (well replicated in swimming literature). Fueling: events over 75 minutes, 30 to 60 g carbs per hour at feed stations or with a carried gel under the wetsuit cuff; practice feeds in training. Cold water under 18 C: wetsuit if legal, longer warmup on land, expect plus 1 to 3 s per 100 m. Chop or current: shift to effort-based pacing (RPE 6 to 7), shorten stroke slightly, breathe away from chop.
[SPEED] 100 m: first 50 at 0.5 to 1.0 s slower than an all-out 50, hold stroke length home. 200 m: first 100 at PB100 + 4 to 5 s, even 50s after. 400 m: first 100 no faster than goal pace − 1 s, then lock in. Dive and turns: streamline to 5 m (15 m advanced fly-kick if trained); turns rehearsed at race pace in Peak. Why: every start and turn is free speed unaffected by fitness.
[TECHNIQUE] events or test swims: hold stroke count within plus 1 of fresh-swim count; if count rises 2-plus, shorten the stroke cycle deliberately and re-lengthen. Why: stroke-length decay is the first and largest fatigue signature in amateurs (Maglischo).

---

## 8. EVENT-TIME PROJECTION ENGINE (deterministic, codeable)

Hybrid model: critical-speed (CS, D') for distances 400 m and under; CSS-offset table with tier fade for 800 m and above; then pool-to-open-water conversion layer.

### 8.1 Inputs and derivation
From the 400/200 test: CS m/s = 200 / (t400 − t200); CSS pace s per 100 = (t400 − t200) / 2; D' m = 400 − CS x t400. DEFAULT D' when only CSS is known: beginner 8 m, intermediate 15 m, advanced 25 m.

Short-race solver (d less than or equal to 400): time_s = (d − D') / CS.

### 8.2 Pace-by-distance table, offsets in s per 100 m relative to CSS pace (positive = slower than CSS)

| Distance | Beginner | Intermediate (DEFAULT) | Advanced |
|---|---|---|---|
| 100 m | use CS/D' | use CS/D' | use CS/D' |
| 200 m | use CS/D' | use CS/D' | use CS/D' |
| 400 m | use CS/D' | use CS/D' | use CS/D' |
| 800 m | +2 | +1 | 0 |
| 1500 m | +4 | +2 | +1 |
| 1900 m | +5 | +3 | +1.5 |
| 3800 m | +7 | +4 | +2 |
| 5000 m | +9 | +5 | +3 |
| 10000 m | +13 | +7 | +4 |

Why not raw CS x time for long races: the CS/D' model assumes CS is sustainable indefinitely; in practice swimmers fade above roughly 15 minutes, and the fade scales with tier (better swimmers hold a higher fraction of CS longer). For the example athlete, raw CS/D' gives 1500 m in 24:45, which overpredicts; the offset table corrects this.

### 8.3 Pool-to-open-water conversion (applied to the pool-equivalent pace from 8.2; offsets in s per 100 m). Baseline is 25 m pool pace.

| Factor | Beginner | Intermediate (DEFAULT) | Advanced |
|---|---|---|---|
| No walls plus sighting (calm) | +5 | +4 | +3 |
| Wetsuit benefit | −6 | −4 | −2.5 |
| Rough water / chop | +4 to +8 | +3 to +6 | +2 to +4 |
| Current against (net) | use measured course history, else +3 | +3 | +2 |
| Cold under 18 C, no wetsuit | +3 | +2 | +1 |

DEFAULT unknown conditions: calm, no current, temperature neutral, wetsuit per event legality flag; if legality unknown, project both and label.

### 8.4 Defaults when NO CSS test exists

Provisional CSS from recent data: steady-swim average pace − 9 s per 100 m (cap the inferral at LOW confidence). If no swim data at all, tier-and-sex defaults (CSS s per 100 m):

| Tier | Male | Female |
|---|---|---|
| Beginner | 130 (2:10) | 138 (2:18) |
| Intermediate | 105 (1:45) | 112 (1:52) |
| Advanced | 85 (1:25) | 91 (1:31) |

DEFAULT when sex unknown: midpoint of the row.

### 8.5 Minimum data and confidence

Minimum for any projection: a tier plus either a CSS test or 3 recent swims of 800 m-plus total each.

| Confidence | Criteria (all required) | Range |
|---|---|---|
| HIGH | CSS test under 6 weeks old, 8-plus swims in last 6 weeks, a completed swim of 60 percent-plus of race distance, pool length known; for OW events, 2-plus OW swims logged | plus or minus 3 percent |
| MEDIUM | CSS test under 12 weeks old OR provisional CSS from 6-plus recent swims, longest swim 40 percent-plus of race distance | plus or minus 5 percent |
| LOW | anything less, or tier-default CSS used | plus or minus 8 percent |

Penalty step (section 5.4): OW event with zero logged OW swims drops confidence one level.

### 8.6 WORKED EXAMPLE (unit-test anchors, all values verified by computation)

Athlete: intermediate. Test: 400 m in 6:25 (385 s), 200 m in 3:05 (185 s).
- CS = (400 − 200) / (385 − 185) = 200 / 200 = 1.000 m/s
- CSS pace = (385 − 185) / 2 = 100.0 s per 100 m = 1:40
- D' = 400 − 1.000 x 385 = 15.0 m

Short-race checks (CS/D'): 100 m = (100 − 15) / 1.0 = 85.0 s = 1:25.0. 200 m = 185.0 s = 3:05.0 (matches test). 400 m = 385.0 s = 6:25.0 (matches test).

1500 m pool: intermediate offset +2 -> pace 102.0 s per 100. Time = 102.0 x 15 = 1530.0 s = 25:30.0. Confidence with a fresh test and good volume: HIGH, range plus or minus 3 percent = 24:44 to 26:16.

3.8 km open water, calm, NO wetsuit: pool-equivalent offset (3800 m, intermediate) +4 -> 104.0 s per 100. OW no-walls-plus-sighting +4 -> 108.0 s per 100. Time = 108.0 x 38 = 4104.0 s = 1:08:24. Athlete has only pool swims logged: MEDIUM after the one-level OW penalty from HIGH, range plus or minus 5 percent = 1:05:00 to 1:11:49 (4104 x 0.95 = 3898.8 s, x 1.05 = 4309.2 s).

Same swim WITH wetsuit: 108.0 − 4 = 104.0 s per 100. Time = 104.0 x 38 = 3952.0 s = 1:05:52. Same MEDIUM label, range 1:02:34 to 1:09:10 (3754.4 to 4149.6 s).

Unit-test anchors: CS = 1.000, D' = 15.0, CSS = 100.0, t100 = 85.0 s, t1500 = 1530.0 s, t3800_ow_nowetsuit = 4104.0 s, t3800_ow_wetsuit = 3952.0 s.

---

## 9. ANTI-PATTERNS / SAFETY RULES (hard DO-NOT rules)

1. DO NOT prescribe junk yardage: no week may have more than 20 percent of meters in the Z3 grey zone for [DISTANCE] and [FITNESS] goals (truly easy or truly at pace, per Seiler).
2. DO NOT ramp weekly meters beyond section 2.1 caps, ever, including post-break returns: after 14-plus days off, restart at 60 percent of prior weekly meters.
3. DO NOT let shoulder_load_units rise more than 10 percent per week or paddle volume exceed the tier cap (section 2.2). Swimmer's shoulder is the persona's dominant injury.
4. DO NOT schedule two Z4-plus or two paddle sessions on consecutive days (beginner, intermediate).
5. DO NOT skip the deload: every 3rd or 4th week per section 2.3; a 5th consecutive loading week is a generator validation failure.
6. DO NOT build volume on broken mechanics: drill floor 10 percent always, 40-plus percent while above the stroke-count gate (section 5.5).
7. DO NOT mask a poor catch with fins or paddles: tools cap at the 2.2 percentages, and a swimmer above the stroke-count gate gets zero paddles.
8. DO NOT allow all-sprint (USRPT-only) or all-easy weeks: every week needs at least 50 percent Z1-Z2 and at least one quality touch outside Taper.
9. DO NOT prescribe unilateral breathing as default: bilateral or pattern breathing in all drill and easy work unless an injury dictates otherwise (imbalance drives asymmetric shoulder load and crooked OW swimming).
10. DO NOT exceed ACWR 1.30 (1.20 beginner) on weekly meters or shoulder_load_units; clamp the plan.
11. DO NOT put any Z5-plus work in a swimmer's first 4 weeks back from shoulder injury.
12. DO NOT let the long swim exceed 35 percent of weekly meters or grow more than 500 m per week.

---

## 10. FEASIBILITY / SANITY CHECK

Improvement rates (CSS s per 100 m gained per 6-week block, swimming consistently per plan):

| Tier | Mechanism | Typical gain per 6-wk block | First-year ceiling |
|---|---|---|---|
| Beginner | technique dominant | 4 to 8 s (DEFAULT 5) | 20 to 30 s |
| Intermediate | mixed | 1.5 to 3 s (DEFAULT 2) | 6 to 10 s |
| Advanced | fitness marginal | 0.5 to 1 s (DEFAULT 0.5) | 2 to 4 s |

Feasibility procedure:
1. Project current finish time via section 8 at the event date assuming the improvement rate above times the number of remaining 6-week blocks (cap the projection at the first-year ceiling).
2. Compare against the goal time, or for finish-only goals, against the minimum-readiness table below.
3. Verdict: REALISTIC if projected meets goal within the confidence range; STRETCH if within range x 1.5; UNREALISTIC beyond that.

Minimum readiness to FINISH (must all be true by race week minus 2):

| Event | Weekly meters | Longest single swim | Weeks of consistent training | Key sessions per week |
|---|---|---|---|---|
| 1500 m / 1.5 km OW | 6,000 | 1,800 m | 8 | 1 CSS |
| 3.8 km OW | 10,000 | 3,000 m | 16 | 1 CSS plus 1 long |
| 5 km OW | 12,000 | 4,000 m | 20 | 1 CSS plus 1 long |
| 10 km OW | 20,000 | 7,500 m | 28 | 2 quality plus 1 long |
| 100/200 m meet | 5,000 | n/a | 8 | 2 race-pace |

Every UNREALISTIC verdict must name the binding lever, exactly one primary: (a) more weeks (timeline short), (b) more weekly meters (volume short of the readiness row), (c) more technique (above stroke-count gate, fitness is not the limiter), (d) more race-pace work ([SPEED] goal with no Z6 history), or (e) softer goal (improvement-rate ceiling makes the time goal unreachable at any volume). Phrase per house reality-check rules: tell the truth, then give the smallest change that flips the verdict.

End of Part 2. End of swimmer persona methodology.
