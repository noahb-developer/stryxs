# ULTRARUNNER METHODOLOGY, PART 1
## Persona: `ultra` (any footrace beyond 42.2 km)
### Scope: 50K, 50MI/100K, 100MI+, across TRAIL/MOUNTAIN, ROAD/FLAT, and TIMED/BACKYARD formats
**Sources:** Jason Koop (Training Essentials for Ultrarunning, 1st and 2nd ed.), Krissy Moehl (Running Your First Ultra), Hal Koerner (Field Guide to Ultrarunning), David Roche (SWAP), Steve House and Scott Johnston (Training for the Uphill Athlete), Phil Maffetone (MAF method), Stephen Seiler (polarized training), Joe Friel (zone architecture), Steve Magness and Samuele Marcora (effort and central governor), Tim Noakes (Lore of Running, central governor), Minetti et al. 2002 (energy cost of graded locomotion), UESCA Ultrarunning Certification, Western States and UTMB community practice, Gabbett (ACWR).
**PERSONA SCOPING RULE (hard):** every factor table in this document (ultra pace multiples, vert-add tables, terrain factors, aid-station tables, taper percentages) belongs to the `ultra` persona ONLY. They must never leak into the `marathon`, `half_marathon`, or `short_run` personas, and the marathon fade-factor and VDOT-pace tables must never leak into this persona. The marathon persona predicts from goal-pace mileage; the ultra persona predicts from time-on-feet, vertical gain, terrain, fueling, and durability. These are different engines.
**PRIMARY TRAINING CURRENCIES (hard):** weekly HOURS (time on feet) and weekly VERTICAL GAIN (meters). Flat mileage is a secondary, derived quantity. Every load rule in this document ramps and caps hours and vert, not km. Pace is never a training target on graded terrain; effort (%LTHR, RPE) and grade-adjusted pace (GAP) are.
**Distance tags used throughout:** [50K] [50MI/100K] [100MI+]. **Terrain tags:** [TRAIL/MOUNTAIN] [ROAD/FLAT] [TIMED/BACKYARD]. **Goal tags:** [FIRST-FINISH] [PERFORMANCE]. Every numeric rule is keyed beginner / intermediate / advanced with a DEFAULT.
**Experience tier definitions (for this persona):**
| Tier | Definition |
|---|---|
| Beginner | No prior ultra finish. May have marathon background. < 2 years consistent running or < 6 h/wk historical volume. |
| Intermediate | 1 to 4 ultra finishes OR 3+ years consistent running at 7 to 10 h/wk. Has completed at least one 4 h+ run. |
| Advanced | 5+ ultra finishes including at least one at or beyond goal distance, 5+ years, comfortable at 10 to 15+ h/wk, established vert habit. |
| DEFAULT | intermediate |
---
# SECTION 1: PERIODIZATION MODEL
## 1.1 Phase structure and ordering
Phases in fixed order: **Base -> Build -> Peak -> Taper -> Event**. Koop's central ordering principle for ultras: train the LEAST specific quality furthest from the race and the MOST specific quality closest to it. Because ultra race demand is overwhelmingly aerobic, the counterintuitive Koop sequencing applies: higher-intensity work (VO2, threshold) sits EARLY (late Base, early Build), and race-specific work (long aerobic time on feet, vert at race grades, downhill durability, fueling rehearsal, back-to-backs) sits LATE (late Build, Peak).
| Phase | Purpose | Intensity character | Specificity character |
|---|---|---|---|
| Base | Aerobic engine, durability, run frequency, tendon/bone tolerance, hiking economy | Mostly Z1-Z2, strides, optional short VO2 touches late in Base | Low. General running. Vert habit begins at maintenance dose. |
| Build | Convert engine to ultra-specific endurance; threshold block early, then progressively longer aerobic work; vert ramp; downhill work enters | Threshold block in first third, then increasingly aerobic | Rising. Long runs lengthen, back-to-backs begin, terrain matches race. |
| Peak | Maximal race specificity: biggest long runs and back-to-backs, race-grade vert, full fueling rehearsals, night run [100MI+] | Almost all Z1-Z2 + race effort | Maximal. Simulation days. |
| Taper | Shed fatigue, keep sharpness, bank sleep and glycogen | Volume cut, small intensity touches retained | Race-specific but short. |
| Event | Execute | n/a | n/a |
**Vertical-specific entry point:** maintenance vert (whatever the athlete already does) throughout Base; deliberate vert ramp starts at the beginning of Build; race-specific grades and continuous climbs in Peak. **Downhill (eccentric) entry point:** light downhill exposure from mid-Build; dedicated downhill repeats in late Build and Peak; last hard downhill session no closer than 14 days from race (DOMS window).
## 1.2 Phase durations by weeks-to-event
Set boundaries purely from weeks-to-event W. Taper is fixed by distance first (Section 6), Peak next, Build next, Base absorbs the remainder. Minimum Base is never violated; if W is too small, compress Build before Base.
**Phase allocation table (weeks). Taper shown for the mid case; see Section 6 for taper by distance.**
| W (weeks to event) | Base | Build | Peak | Taper | Notes |
|---|---|---|---|---|---|
| 12 | 3 | 5 | 2 | 2 | Minimum credible runway for [50K] with prior run base. NOT credible for [100MI+] first-timers. |
| 16 | 5 | 6 | 3 | 2 | Standard [50K], compressed [50MI/100K]. |
| 24 | 9 | 9 | 3 | 3 | Standard [50MI/100K], compressed [100MI+] for experienced athletes only. |
| 36 | 16 | 12 | 5 | 3 | Standard [100MI+]. Comfortable [50MI/100K] with a big Base. |
| 52 | 26 | 16 | 6 | 3 (+1 float) | Ideal [100MI+] runway. Insert one mid-cycle regeneration week (full deload) at week 26. |
**Boundary formulas (codeable):**
- taper_weeks = f(distance) from Section 6 (DEFAULT 2 for [50K], 3 for [50MI/100K] and [100MI+]).
- peak_weeks = clamp(round(0.13 x W), 2, 6). DEFAULT for W=24: 3.
- build_weeks = clamp(round(0.38 x W), 4, 16).
- base_weeks = W - taper - peak - build (floor 3; if floor violated, subtract from build first, then peak, never below peak=2).
## 1.3 Minimum viable build for a FIRST FINISH
These are floors, not recommendations. Below these, the app must flag the goal as not feasible (Section 10).
| Distance | Min weeks of structured training | Min entry fitness | Min peak weekly hours | Min longest run before taper |
|---|---|---|---|---|
| [50K] | 12 (DEFAULT 16) | Comfortable half marathon OR 3 x 1 h runs/wk for 8 weeks | 6 h | 3.5 h (or 4 h hike-run mix) |
| [50MI/100K] | 16 (DEFAULT 24) | Marathon or 50K finish within 18 months | 8 h | 5 h, plus one back-to-back of 5 h + 3 h |
| [100MI+] | 24 (DEFAULT 36) | 50MI or 100K finish within 24 months (hard prerequisite for first-timers) | 10 h | 6 h, plus one back-to-back of 6 h + 4 h, plus one night run |
| [TIMED/BACKYARD 12 h+] | 16 | 50K finish or marathon | 8 h | 4.5 h at race-strategy run/walk rhythm |
**[TRAIL/MOUNTAIN] modifier:** add the vert-preparedness floor: peak-week vert >= 25% of race vert (Section 10.3). **[ROAD/FLAT] modifier:** vert floor waived; substitute cadence/durability work and stricter fueling rehearsal (flat ultras allow no hiking recovery, GI load is relentless).
## 1.4 Distance and terrain divergences in the periodization mix
- **[50K]:** closest to marathon. The threshold block in early Build is largest here (it still pays). Long-run progression resembles an extended marathon block measured in time. Back-to-backs optional for [FIRST-FINISH], one or two for [PERFORMANCE].
- **[50MI/100K]:** fueling rehearsal and durability become co-equal with aerobic volume. Back-to-backs are mandatory. Threshold block shrinks; aerobic specificity grows.
- **[100MI+]:** the plan is dominated by time on feet, vert, hiking economy, fueling, night running, and logistics rehearsal. Speed work is a small economy-maintenance dose only. Back-to-backs are the centerpiece of Peak.
- **[TRAIL/MOUNTAIN]:** vert periodized as its own stream (own ramp, own deload). Downhill repeats are a first-class session.
- **[ROAD/FLAT]:** replace vert stream with run-economy and durability stream (strides, cadence, longer steady Z2, more frequent fueling rehearsals; eccentric strength in gym replaces downhill repeats at half dose).
- **[TIMED/BACKYARD]:** train the race rhythm itself: run/walk cycling, eating every loop, mental segmentation. Long sessions practice the exact loop cadence (e.g. backyard: 4.167 mi/h rhythm with 8 to 15 min idle per hour).
---
# SECTION 2: WEEKLY STRUCTURE & PROGRESSION RULES
These are the hard guardrails the plan generator must never violate. Hours and vert ramp INDEPENDENTLY and are SEPARATELY capped.
## 2.1 Week-to-week ramp caps
**Rule UW1 (hours ramp):** weekly time-on-feet may increase by at most:
| Tier | Max weekly hours increase | DEFAULT |
|---|---|---|
| Beginner | 8% (or +0.5 h, whichever is larger, cap +1.0 h) | 8% |
| Intermediate | 10% (cap +1.25 h) | 10% |
| Advanced | 12% (cap +1.5 h) | 10% |
**Rule UW2 (vert ramp):** weekly vertical gain may increase by at most:
| Tier | Max weekly vert increase | DEFAULT |
|---|---|---|
| Beginner | 10% (or +150 m, cap +300 m) | 10% |
| Intermediate | 12% (cap +400 m) | 10% |
| Advanced | 15% (cap +500 m) | 12% |
**Rule UW3 (no double-max ramp):** hours and vert must never both take their maximum ramp in the same week. If hours ramp > half its cap this week, vert ramp <= half its cap, and vice versa. DEFAULT alternation: ramp hours one week, vert the next.
**Rule UW4 (post-deload reset):** after a deload week, return to the pre-deload load level, never above it, before resuming the ramp.
**Rule UW5 (post-gap reentry):** after >= 5 consecutive days off (illness, travel, life), reenter at 60% of the last completed week's hours and 50% of its vert, no back-to-back that week, no downhill repeats that week. The app must NEVER schedule a jump from several rest days directly into a long run > 2.5 h or any back-to-back block. This is the single most injury-productive pattern in ultrarunning.
**Rule UW6 (ACWR guardrail):** using the live load model, keep acute:chronic workload ratio in 0.8 to 1.3 (Gabbett). If projected ACWR > 1.3 for hours OR a separately computed vert-ACWR > 1.4, the generator must trim the offending week. Vert-ACWR = 7-day vert / 28-day average weekly vert.
## 2.2 Deload cadence
**Rule UW7:**
| Tier | Cadence | Hours cut | Vert cut | Keep |
|---|---|---|---|---|
| Beginner | every 3rd week (2:1) | -35% | -50% | 1 short Z3 touch or strides |
| Intermediate | every 4th week (3:1) | -30% | -45% | 1 short tempo + strides |
| Advanced | every 4th week (3:1) | -30% | -40% | 1 quality session at reduced volume |
| DEFAULT | 3:1 | -30% | -45% | strides + 15 min tempo |
Masters athletes (age >= 50): force 2:1 cadence regardless of tier.
## 2.3 Rest days
**Rule UW8 (minimum rest):**
| Tier | Base | Build | Peak | Taper |
|---|---|---|---|---|
| Beginner | 2/wk | 2/wk | 2/wk | 2 to 3/wk |
| Intermediate | 1 to 2/wk | 1/wk | 1/wk | 2/wk |
| Advanced | 1/wk | 1/wk | 1/wk (active recovery allowed on a 2nd easy day) | 2/wk |
| DEFAULT | 1 full rest day per week minimum, always the day after the back-to-back block when one exists. |
## 2.4 Mapping a weekly hours budget to run count and durations
**Rule UW9 (hours -> sessions map):**
| Weekly hours | Runs/wk | Structure (DEFAULT layout) |
|---|---|---|
| 4 to 6 h | 4 | 3 easy 45 to 60 min + 1 long 1.5 to 2.5 h |
| 6 to 8 h | 4 to 5 | 3 easy + 1 quality + 1 long 2 to 3 h |
| 8 to 10 h | 5 | 3 easy + 1 quality + 1 long 2.5 to 3.5 h; back-to-back replaces quality every 2nd or 3rd week in Build/Peak |
| 10 to 13 h | 5 to 6 | 3 to 4 easy + 1 quality + long 3 to 4 h + medium-long 1.5 to 2 h (B2B pairing) |
| 13 to 16+ h | 6 | 4 easy (one with vert focus) + 1 quality + B2B long block |
If the athlete logs km instead of hours, convert with their recent average easy pace on their typical terrain, never with race pace.
## 2.5 The long run (in TIME, never distance)
**Rule UW10 (long-run dose):** long run = 25 to 35% of weekly hours, hard cap 40%. Progress by +15 to +30 min per step, only on non-deload weeks, and not every week (long run grows at most 2 weeks out of 3).
**Rule UW11 (absolute long-run time caps):** beyond these durations, recovery cost exceeds fitness benefit (Koop); use back-to-backs to add stimulus instead.
| Goal distance | Beginner cap | Intermediate cap | Advanced cap | DEFAULT |
|---|---|---|---|---|
| [50K] | 3.5 h | 4 h | 5 h | 4 h |
| [50MI/100K] | 4.5 h | 5.5 h | 6 h | 5 h |
| [100MI+] | 5.5 h | 6.5 h | 8 h | 6 h |
| [TIMED/BACKYARD] | 4 h | 5 h | 6 h (at race rhythm) | 5 h |
## 2.6 The back-to-back (B2B) long-run block
Purpose: simulate late-race fatigue and teach fat metabolism, durability, and fueling under fatigue without a single monster run.
**Rule UW12 (B2B prescription):**
- Entry criteria: >= 8 consecutive training weeks completed, long run >= 3 h completed comfortably, no current injury flag.
- Structure: day 1 long run, day 2 medium-long at 50 to 70% of day 1 duration (DEFAULT 60%), day 2 strictly Z1-Z2 effort.
- Caps: combined B2B <= 45% of that week's hours [intermediate DEFAULT], <= 40% beginner, <= 50% advanced. Day 1 obeys Rule UW11.
- Cadence: every 3rd week in Build, every 2nd week in Peak [50MI/100K and 100MI+]. [50K]: 0 to 2 total B2Bs, Peak only, [PERFORMANCE] goal only by default.
- Always followed by a full rest day.
- The biggest B2B sits 3 to 4 weeks before race day [100MI+: e.g. 6 h + 4 h], 3 weeks before [50MI/100K: e.g. 5 h + 3 h].
- Never schedule a B2B in the same week as downhill repeats AND a vert ramp. Pick one stressor to peak per week.
## 2.7 Intensity distribution by phase (% of weekly running TIME in zone)
Ultra training is pyramidal-to-polarized (Seiler). Z1-Z2 dominates everywhere; the small intensity dose moves earlier in the cycle (Koop ordering).
| Phase | Z1-Z2 | Z3 (tempo) | Z4 (threshold) | Z5 (VO2/strides) | Notes |
|---|---|---|---|---|---|
| Base | 92% | 3% | 2% | 3% (strides, short hill sprints) | MAF-style aerobic emphasis acceptable here |
| Build (first third) | 84% | 6% | 8% | 2% | The threshold block lives here |
| Build (rest) | 88% | 6% | 4% | 2% | |
| Peak | 91% | 5% (race-effort segments) | 2% | 2% | Specificity replaces intensity |
| Taper | 90% | 6% | 2% | 2% | Short touches only |
| DEFAULT if phase unknown | 88 / 6 / 4 / 2 | | | | |
**MAF vs structured intensity:** MAF (Maffetone 180 minus age, Section 3.3) is a Base-phase and beginner tool and an excellent governor for athletes who chronically run easy days too hard. It is NOT sufficient alone for [PERFORMANCE] goals: retain the early-Build threshold block and year-round strides. For [FIRST-FINISH] beginners, a near-pure MAF/Z2 plan plus hiking and long runs is acceptable and lower-risk.
## 2.8 Weekly vert dose targets [TRAIL/MOUNTAIN]
**Rule UW13 (vert targeting):** peak-week vert should reach 25 to 35% of race total vert (DEFAULT 30%) by the end of Peak, built under Rule UW2. Distribute vert: roughly 50% in the long run / B2B, 30% in one dedicated vert session, 20% sprinkled in easy runs. [ROAD/FLAT]: weekly vert target = whatever maintains durability, 200 to 500 m, no ramp required.
---
# SECTION 3: ZONES & EFFORT
## 3.1 Run zone model by %LTHR (Friel architecture) with RPE and ultra purpose
All zones key off the athlete's run LTHR field. If only recent runs with HR exist, estimate LTHR as the average HR of the best sustained 45 to 60 min hard effort, or 95% of the average HR of a recent 10K race effort. DEFAULT if no HR data: prescribe by RPE only.
| Zone | %LTHR | RPE (1-10) | Name | Ultra purpose |
|---|---|---|---|---|
| Z1 | < 85% | 1 to 2 | Recovery | Active recovery, day-2 of B2B floor, late-race survival effort |
| Z2 | 85 to 89% | 3 to 4 | Aerobic | THE ultra engine. 70 to 85% of all training time lives here or below. Fat oxidation, capillarization, durability. Conversational. |
| Z3 | 90 to 94% | 5 to 6 | Tempo | Race effort for fast [50K PERFORMANCE]; steady-state strength; use sparingly (the classic "moderate trap") |
| Z4 | 95 to 99% | 7 | Threshold | Raises the aerobic ceiling; early-Build block; 50K race effort ceiling |
| Z5 (a/b/c) | 100 to 106%+ | 8 to 10 | VO2 / Anaerobic / Sprint | Economy and headroom; strides and short hill sprints; tiny doses year-round |
**Ultra race-effort anchors (hard rule for plan language and race plans):** [50K] race effort = high Z2 to low Z3 (RPE 4 to 5). [50MI/100K] = Z2 (RPE 3 to 4). [100MI+] = low Z2 to Z1 (RPE 2 to 3, "embarrassingly easy"). [TIMED/BACKYARD] = Z1 with rhythm breaks.
**HR drift caveat (hard):** beyond ~3 h, cardiac drift inflates HR 5 to 10+ bpm at constant effort (and more with heat/dehydration). After hour 3 of any session or race, RPE and GAP take priority over HR. The app's HR-drift % field > 8% on a long run = flag fueling/hydration or pacing, not fitness loss.
## 3.2 The aerobic-first principle
Ultra performance is set by the aerobic system, fat oxidation, and durability (Koop, Seiler, Noakes). The decisive adaptations come from accumulated Z1-Z2 time on feet, not from interval work. Intensity is a small, early, supporting actor (economy, ceiling), never the centerpiece. Magness/Marcora addition: perceived effort is the actual regulator over many hours, so training must rehearse long-duration effort management, fueling while moving, and discomfort tolerance, which only long aerobic sessions provide.
## 3.3 MAF (Maffetone) definition and usage
MAF HR = 180 minus age, then: subtract 10 if recovering from major illness/overtraining or on daily medication; subtract 5 if injured, regressing, > 2 colds/yr, or new to training (< 1 yr consistent); add 5 if > 2 years consistent improvement without injury; add 5 (optional) if age > 65 and healthy; athletes <= 16 use 165.
| Use MAF as the easy-day ceiling when | Prefer %LTHR zones when |
|---|---|
| Base phase, beginner tier, injury-prone, chronic easy-day overcooking, HR data but no LTHR | LTHR is known and recent, Build/Peak phases, [PERFORMANCE] goals, structured sessions |
DEFAULT: if both available, easy-day ceiling = min(MAF, 89% LTHR).
## 3.4 Grade-Adjusted Pace (GAP): the codeable model
GAP converts pace on grade G to flat-equivalent effort so a 10:00/km climb can be compared to a 5:30/km flat run.
**Definition:** GAP = actual_pace / cost_multiplier(G), where pace is min/km and cost_multiplier(G) is the pace-equivalent cost of grade G versus flat. G = vertical/horizontal as %, uphill positive.
**Precise model (uphill), Minetti et al. 2002 energy cost polynomial,** with i = G/100:
C(i) = 155.4 i^5 - 30.4 i^4 - 43.3 i^3 + 46.3 i^2 + 19.5 i + 3.6 (J/kg/m); cost_multiplier = C(i)/3.6.
Verified values (unit-test anchors):
| Grade | Minetti cost multiplier | Simple linear model |
|---|---|---|
| +5% | 1.30 | 1.30 |
| +10% | 1.66 | 1.60 |
| +15% | 2.06 | 1.90 (linear underestimates; hike anyway) |
| +20% | 2.50 | n/a (hiking domain) |
| +25% | 2.98 | n/a |
**Simple uphill rule (codeable DEFAULT):** cost_multiplier_up = 1 + 0.06 x G for G in 0 to 12%. Above 12%, use the Minetti polynomial or treat as hiking (3.6).
**Downhill: energy is NOT pace.** Minetti energy cost falls steeply downhill (0.76 at -5%, 0.60 at -10%) but actual running pace improves far less because of braking forces, impact, and footing. Use this PACE multiplier table for GAP downhill (field-calibrated, Strava-GAP-like):
| Grade | Pace multiplier (smooth surface) |
|---|---|
| -5% | 0.93 |
| -8 to -10% | 0.90 (fastest descent band) |
| -15% | 0.96 |
| -20% | 1.05 |
| -25% and steeper | 1.15+ (technical descent is SLOWER than flat) |
Multiply additionally by the terrain-technicality factor (Section 8.4) on trail. **Simple downhill rule (DEFAULT):** pace_multiplier_down = max(0.90, 1 - 0.02 x |G|) for 0 to -10%; beyond -10%, 0.90 + 0.012 x (|G| - 10).
**GAP usage rules:** (a) compare training paces across terrain ONLY via GAP; (b) all "pace" displays for trail runs show GAP alongside raw pace; (c) the projection engine (Section 8) works in flat-equivalent terms built from these same multipliers, keep them consistent.
## 3.5 The run/hike transition
**Rule UZ1 (transition grade):** power-hiking becomes more economical than running at sustained grades of roughly 15 to 20%.
| Tier | Transition grade (sustained climbs) | DEFAULT |
|---|---|---|
| Beginner | 12 to 15% | 14% |
| Intermediate | 15 to 18% | 16% |
| Advanced | 18 to 22% | 18% |
**Race-duration override:** in races, hike everything above 10 to 12% for [100MI+], above 12 to 15% for [50MI/100K], regardless of economy crossover. Why: hiking caps effort and frees the gut for fueling.
**Efficient power-hiking benchmarks (vertical ascent rate on 15 to 25% grades):**
| Tier | Sustainable vertical rate | Notes |
|---|---|---|
| Beginner | 450 to 600 m/h | Hands-on-knees technique |
| Intermediate | 600 to 800 m/h | DEFAULT 700 m/h |
| Advanced | 800 to 1100 m/h | Poles add ~5 to 10% on steep sustained climbs and unload quads |
| Elite reference | 1100 to 1400 m/h | (context only) |
Hiking the same steep climb costs roughly 10 to 20% more TIME than running it but 25 to 40% less energy and far less muscular damage; over ultra durations the trade is decisively in hiking's favor.
---
# SECTION 4: SESSION LIBRARY
Format per session: target effort, structure by phase, purpose, and the warmup/main/cooldown template string the app displays. Tags show emphasis.
## 4.1 Easy Aerobic Run (all distances, all terrains)
- Effort: Z1-Z2, <= min(MAF, 89% LTHR), RPE 2 to 4. Fully conversational.
- Duration: 40 to 90 min by budget.
- Purpose: aerobic engine, frequency, durability. The bulk of every week.
- Template: "WU: walk 3 min, settle into easy rhythm. MAIN: 45 to 75 min Z1-Z2, conversational, walk any hill that pushes HR above ceiling. CD: 3 min walk."
## 4.2 Long Run (by TIME) (all; the cornerstone)
- Effort: Z1-Z2, RPE 3 to 4. [Peak phase: include race-effort segments, e.g. final 30 to 60 min at goal race effort.]
- Duration: per Rules UW10/UW11. Progress +15 to 30 min steps.
- Purpose: fat oxidation, durability, fueling practice (mandatory > 2 h, Section 4.11), mental rehearsal.
- Template: "WU: 10 min very easy. MAIN: X h Z2 on race-similar terrain, hike grades above transition, fuel Y g carbs/h from minute 30. CD: 5 min walk, refuel within 30 min."
- [TRAIL/MOUNTAIN]: route must accumulate the week's planned long-run vert. [ROAD/FLAT]: steady unbroken rhythm, stricter even pacing.
## 4.3 Back-to-Back Long Block [50MI/100K, 100MI+ emphasized]
- Per Rule UW12. Day 2 template: "MAIN: X h strictly Z1-low Z2 on tired legs, hike early and often, full fueling rehearsal. Purpose is time on fatigued legs, not pace."
## 4.4 Vert / Climbing Repeats [TRAIL/MOUNTAIN]
- Effort: Z3 to low Z4 on the climbs (RPE 5 to 7), recovery = the descent at easy effort.
- Structure: Base: none (vert lives in easy runs). Build: 4 to 8 x 3 to 6 min climb at 8 to 15% grade. Peak: 2 to 4 x 10 to 20 min sustained climbs at race grades, race effort to slightly above.
- Purpose: climbing strength-endurance, vertical rate, hiking-running transitions (practice both within reps).
- Template: "WU: 15 min easy + 4 strides. MAIN: 6 x 4 min uphill Z3-Z4 at 10% grade, mix running and power-hiking, jog/walk down. CD: 10 min easy."
- Substitutes (no hills): treadmill at 10 to 15% incline (same rep structure); stair machine or stadium stairs (minutes-for-minutes); weighted-vest incline walking (advanced, <= 10% bodyweight).
## 4.5 DOWNHILL Repeats (eccentric durability) [TRAIL/MOUNTAIN first-class; ROAD/FLAT half-dose via gym]
- The most neglected, highest-payoff ultra session. Quad eccentric damage is the #1 muscular cause of late-race collapse on mountain courses; eccentric tolerance is highly trainable in 4 to 6 sessions (repeated-bout effect).
- Effort: descents at controlled but committed effort, RPE 5 to 6, focus on cadence > 170, short ground contact, slight forward lean.
- Structure: mid-Build entry: 3 to 4 x 2 to 3 min down a smooth 6 to 8% grade. Late Build/Peak: 4 to 6 x 4 to 8 min down 8 to 15% grades, progressively more technical. Cadence: every 7 to 10 days in Build/Peak, LAST one >= 14 days pre-race.
- Expect DOMS after the first two sessions; schedule before a rest day; never within 3 days before a B2B.
- Template: "WU: 15 min easy + climb to top easy. MAIN: 5 x 5 min downhill at strong-but-controlled effort, quick feet, hike back up easy. CD: 10 min easy flat."
- Substitutes: treadmill decline (-3 to -6%) if available; otherwise gym eccentric block: 3 to 4 x 8 to 10 slow-eccentric (3 to 5 s lowering) back squats or leg press + walking lunges + step-downs, 2 x/wk in Build.
## 4.6 Power-Hike Training [TRAIL/MOUNTAIN; mandatory 100MI+ all terrains]
- Effort: Z2 to low Z3 (hiking is a skill session, not a rest).
- Structure: dedicated 45 to 90 min hike with vest at race weight on 15 to 25% grades, or treadmill 15% at 3.5 to 5.5 km/h. Weekly in Build/Peak for mountain races. Practice poles here if racing with poles.
- Template: "MAIN: 60 min sustained power-hike on steep grade, Z2, poles if racing with them, nail the hands-on-knees and pole rhythm."
## 4.7 Tempo / Threshold [emphasized 50K and ROAD/FLAT; early-Build block all distances]
- Effort: Z3 (tempo, RPE 5 to 6) / Z4 (threshold, RPE 7).
- Structure: Build block weeks 1 to 4: threshold 2 to 3 x 10 to 15 min Z4, 3 min jog recovery, weekly. Elsewhere: 20 to 40 min continuous Z3 every 10 to 14 days.
- Purpose: raise the ceiling so race effort sits at a lower fraction of max; [50K PERFORMANCE] race-effort rehearsal.
- Template: "WU: 15 min easy + 4 strides. MAIN: 3 x 12 min Z4 (comfortably hard, ~hour-race effort), 3 min easy jog between. CD: 10 min easy."
## 4.8 VO2 / Strides / Hill Sprints (economy dose, all distances, small and year-round)
- Strides: 4 to 8 x 20 to 30 s fast-relaxed (RPE 8), full recovery, 2 to 3 x/wk appended to easy runs.
- Hill sprints: 6 to 10 x 10 to 15 s steep (10%+) near-max, walk-down recovery, 1 x/wk Base/Build. Tendon stiffness, power, injury-proofing.
- VO2 (optional, [PERFORMANCE], late Base): 5 to 6 x 3 min Z5a, equal jog recovery, <= 1 x/wk for <= 4 weeks.
- Template (strides): "MAIN: easy run; final 15 min add 6 x 25 s smooth fast strides, walk 60 s between."
## 4.9 Technical-Terrain Skills [TRAIL/MOUNTAIN]
- Effort: Z1-Z2; the skill is the workout.
- Structure: 45 to 75 min on the rockiest/rootiest available trail, deliberately quick feet, eyes 3 to 5 m ahead, line choice. Weekly in Build/Peak if race is technical. Night version doubles as 4.12.
- Template: "MAIN: 60 min easy on technical trail, priority footwork not pace, hike anything sketchy."
## 4.10 Race-Simulation / Specificity Day (Peak phase, all distances)
- The dress rehearsal: race kit, race shoes, race fueling at race rate, race terrain and grades, race effort discipline, crew/drop-bag simulation.
- Duration: the biggest long run or B2B day 1 of Peak (Rule UW11 caps apply).
- [100MI+]: include a deliberate low-energy patch rehearsal: continue 30 min at reduced effort while fueling out of it.
- Template: "MAIN: X h at exact race effort on race-similar course, full race fueling (Y g/h), all race gear, practice aid-station speed at each refill stop."
## 4.11 Fueling-Practice Long Run (mandatory thread, all distances)
- Any run > 2 h is a fueling rehearsal: start at 40 to 60 g carbs/h, progress 10 g/h every 2 to 3 weeks toward the race target (Section 7.2). Gut tolerance is trainable in 4 to 8 weeks; this is a scheduled progression, not an afterthought.
- Log GI distress 1 to 5 after every fueled run; two consecutive scores >= 4 = hold the g/h progression one step.
## 4.12 Night Run [100MI+ mandatory; 100K optional if finish projects past dark]
- 1 to 3 sessions in Peak: 2 to 4 h starting at or after dusk, race lighting (primary + backup), on trail.
- Purpose: headlamp pace calibration (expect 10 to 20% slower), depth-perception adaptation, sleep-pressure exposure, confidence.
- Template: "MAIN: 3 h easy trail run starting 1 h before dark, race headlamp, practice fueling by feel in the dark."
- Advanced [100MI+] option: one late-night-start B2B day 2 (e.g. 3 a.m. start) to rehearse running on disrupted sleep.
## 4.13 [TIMED/BACKYARD] Rhythm Session
- Structure: 2 to 5 h at exact race rhythm. Backyard: 6.7 km loops at 42 to 48 min pace with the remainder of each hour spent practicing the reset routine (eat, sit, shoes, restart). 24 h: rehearse the planned run/walk cycle (e.g. 25 min run / 5 min walk) and hourly eating.
- Purpose: the race IS the rhythm; train the rhythm.
---
# SECTION 5: ADAPTATION TO THE ATHLETE
All adaptations key off real app fields: available training days, weekly hours/km, tier, PBs, run LTHR, recent runs (distance/duration/pace/HR/vert/drift), longest recent run, weekly vert, equipment flags, age/sex, injuries, CTL/ATL/TSB/ACWR, completed-vs-planned.
## 5.1 Scaling to available days/week
| Days/wk | Plan shape | Hard notes |
|---|---|---|
| 3 | Long run + 1 quality (vert or threshold by phase) + 1 medium easy. No B2B. Feasible ceiling: [50K FIRST-FINISH], [50MI] only if hours >= 8 via long sessions. | Each run carries more load; ramp caps drop to beginner values regardless of tier. |
| 4 | Long + quality + 2 easy. B2B possible by converting one easy to medium-long (B2B then counts as 2 of the 4 days). | DEFAULT minimum for [50MI/100K]. |
| 5 | Full structure per Rule UW9. | DEFAULT for [100MI+]. |
| 6 | Adds frequency, not intensity: extra easy/vert run. | Advanced only; keep 1 full rest day (Rule UW8). |
## 5.2 Weekly placement template (DEFAULT, 5-day athlete)
Mon rest. Tue quality (vert repeats or threshold by phase). Wed easy + strides. Thu easy (or power-hike session). Fri rest or 30 to 40 min Z1. Sat long run (B2B day 1). Sun easy 45 min, or B2B day 2 in Build/Peak, then Mon rest absorbs it.
Placement rules: quality never the day before the long run unless advanced; downhill repeats slot Tue with >= 3 days before the next B2B; full rest day always follows a B2B (Rule UW12).
## 5.3 Scaling to current fitness
- Entry weekly hours = average of last 4 completed weeks (from the load model), never the athlete's stated aspiration. Entry vert = same, from logged vert.
- If CTL is falling or TSB < -25 at plan start, insert a 1-week absorb block (deload-level) before ramping.
- LTHR present: prescribe zones by %LTHR. Absent: RPE + MAF ceiling, and schedule a 30 min hard field test in week 2 of Base to set LTHR.
- PB freshness: PBs > 24 months old decay for projection purposes (Section 8.7) but still seed zone/pace estimates.
## 5.4 Injury modifiers
- Active lower-limb injury flag: no downhill repeats, no hill sprints, vert ramp frozen, long-run progression halved, B2B suspended. Substitute uphill treadmill walking (low-impact, high-aerobic) where pain-free.
- History of ITB/knee issues: cap single-session descent at 800 m until 4 pain-free downhill sessions logged.
- Bone-stress history: hours ramp at beginner cap, surfaces softened, strength block mandatory 2 x/wk.
## 5.5 Equipment adaptations
- No trail access: vert via treadmill incline (Section 4.4 substitutes), descents via decline treadmill or gym eccentric block (Section 4.5). Technical-skill sessions replaced by cadence/agility drills; lower the projection confidence for technical races (Section 8.9) because descending skill cannot be fully simulated.
- Treadmill with incline: full vert substitution possible up to ~1000 m/session practical cap.
- Poles: if racing with poles, all power-hike and steep vert sessions use poles from mid-Build (skill takes ~6 sessions). If the race bans or athlete lacks poles, train hands-on-knees.
- Hydration vest: mandatory equipment for runs > 2 h; all fueling rehearsals use the race-day carrying setup.
- Gym access: strength block 2 x/wk Base/Build, 1 x/wk Peak, none in Taper week of race: squats/deadlift pattern, step-downs, calf raises (straight + bent knee), single-leg RDL, core. [ROAD/FLAT] and no-hills athletes: add the slow-eccentric protocol (4.5).
- GPS watch absent: prescribe purely by RPE and time; disable GAP analytics gracefully.
## 5.6 Flatlander -> mountain race conversion (and reverse)
- Flatlander to [TRAIL/MOUNTAIN]: begin vert stream immediately at 300 to 500 m/wk equivalent via treadmill/stairs, ramp per Rule UW2 toward Rule UW13 target; downhill substitute via gym eccentrics + any available grade; book at least one big-vert weekend (travel) in Peak if possible; projection adds the vert-unpreparedness penalty (Section 8.7) if peak-week vert < 25% of race vert.
- Mountain athlete to [ROAD/FLAT] ultra: the limiter flips to unbroken running rhythm and relentless fueling. Convert one vert session to continuous Z2/Z3 rhythm runs; long runs flat and metronomic; raise fueling rehearsal priority (no hiking breaks for the gut).
## 5.7 Body weight and strength effects
- Climbing cost is directly proportional to total mass (body + pack): every 1% mass change is ~1% climbing speed at fixed power (Minetti cost is per kg). Frame as equipment/pack discipline and fueling adequacy, never as weight-loss prescription; in-deficit high-volume blocks are a RED-S risk (Section 9).
- Descending durability correlates with eccentric strength, not lightness: heavier athletes need the downhill/eccentric work MORE, not less.
- Age >= 50: recovery-driven edits: 2:1 deload cadence, strength mandatory, hours ramp at beginner cap, protein emphasis note.
---
# SECTION 6: TAPER
Principle: cut volume, keep a touch of intensity, protect sleep, arrive bored and bouncy. Fitness is locked ~3 weeks out [100MI+] / ~2 weeks out [50K]; only fatigue can change.
## 6.1 Taper length and volume schedule (% of peak-week hours)
| Distance | Length | Week -3 | Week -2 | Race week (pre-race days) | DEFAULT |
|---|---|---|---|---|---|
| [50K] | 10 to 14 days | (normal) | 70% | 45% | 2 weeks |
| [50MI/100K] | 2 to 3 weeks | 80% | 60% | 40% | 3 weeks |
| [100MI+] | 3 weeks (advanced may compress to 2.5) | 75% | 55% | 35% | 3 weeks |
| [TIMED/BACKYARD] | 2 weeks | (normal) | 65% | 40% | 2 weeks |
## 6.2 Vert and intensity during taper
- Vert: cut harder than hours: week -2 at 50% of peak vert, race week <= 20%, nothing steep in final 7 days.
- Downhill: ZERO downhill repeats inside 14 days (DOMS protection).
- Keep: 2 short Z3-Z4 touches per week (e.g. 3 x 5 min tempo, 6 strides) to stay sharp; everything else Z1-Z2.
- Final long run: [50K] 2 to 2.5 h at 14 days out; [50MI/100K] 3 h at 21 days, 1.5 to 2 h at 10 to 12 days; [100MI+] last B2B 21 to 28 days out, last 2 to 2.5 h run ~10 days out. Race week longest run: 60 to 75 min with race-effort segments, 3 to 4 days out.
## 6.3 Final-week carbo-load, glycogen, and sleep bank
- Carbo-load: final 48 to 72 h at 8 to 10 g carbs/kg/day (DEFAULT 8), low fiber final 36 h, normal salt, expect +1 to 2 kg water weight (that is stored glycogen + water, it is fuel, not fat).
- Hydration: normal drinking + electrolytes day before; do not water-load.
- Sleep bank: nightly sleep extension (+30 to 60 min) for the final 7 to 10 nights measurably buffers deprivation [100MI+ critical]. The night two days before the race is the one that matters; race-eve sleep is usually poor and that is fine.
- Caffeine: optional taper of habitual caffeine for 5 to 7 days to resensitize [PERFORMANCE, advanced]; never for first-timers (withdrawal misery).
---
# SECTION 7: EVENT-DAY EXECUTION
## 7.1 Pacing strategy
**Effort caps for the first half (hard rule, by distance):**
| Distance | First-half effort cap | One-line why |
|---|---|---|
| [50K] | high Z2, RPE 4 (PERFORMANCE: low Z3 from halfway) | Glycogen lasts ~2.5 to 3 h at Z3; overdraw early and the last 10 km collapses. |
| [50MI/100K] | Z2, RPE 3 to 4, feel "too easy" until ~60% distance | Every minute banked early costs 2 to 4 minutes after the fade begins (positive-split physics). |
| [100MI+] | Z1 to low Z2, RPE 2 to 3, "absurdly easy" for the first 50 km | At hour 20, the race is decided by who damaged themselves least at hour 3. |
| [TIMED/BACKYARD] | Z1 + rigid rhythm from loop 1 | The only way to lose early is to go fast early. |
**Run/hike by grade (race):** hike above 10 to 12% [100MI+], 12 to 15% [50MI/100K], above the athlete's transition grade [50K] (Rule UZ1). Hike with purpose (benchmarks 3.5), eat on the hikes.
**Descend-smart rule:** descend at controlled effort (RPE <= 5), quick cadence, no braking, and deliberately easy on early descents: quad eccentric damage is cumulative and irreversible mid-race; the first 3 descents determine whether you can run the last 3. Bank no time by hammering downhills before 70% distance.
**Negative-split mindset:** plan segments by effort, not splits; expect the 2nd half to be slower on the clock even at even effort (drift, fatigue, night). [ROAD/FLAT]: even pacing by GAP/HR is king; [TRAIL/MOUNTAIN]: even EFFORT across wildly variable paces.
## 7.2 Fueling (first-class system)
| Parameter | Target | Tier/notes |
|---|---|---|
| Carbs | 60 to 90 g/h (DEFAULT 70). Gut-trained advanced: up to 100 to 120 g/h with 2:1 glucose:fructose mixes. Beginner floor: 50 g/h. | Start fueling at minute 20 to 30, never wait for hunger. |
| Fluids | 400 to 750 ml/h (DEFAULT 500), scale to heat and sweat rate; drink to thirst + schedule, avoid > 800 ml/h sustained (hyponatremia risk). | |
| Sodium | 300 to 600 mg/h temperate (DEFAULT 400), 600 to 1000 mg/h hot or salty sweater. | |
| Caffeine | 1 to 3 mg/kg doses; start after 50% distance [50MI+], or final 90 min [50K]; [100MI+] reserve for night hours, redose every 3 to 4 h, cap ~6 mg/kg total. | Never first-timers without rehearsal. |
| Real food | [100MI+] and 12 h+: shift 20 to 40% of calories to real food (broth, potatoes, rice, PB&J) after hour 4 to 6; pure gels beyond ~8 h wreck most guts. | Practiced in training only. |
**Cumulative-deficit math (encode and surface to athletes):** burn rate ~600 to 800 kcal/h; max absorbable ~240 to 360 kcal/h (60 to 90 g carb). The deficit is unavoidable (~300 to 450 kcal/h); the race is won by minimizing it. Example: 10 h at 70 g/h = 700 g carbs = 2800 kcal in vs ~7000 kcal out. Missing one hour of fueling adds ~280 kcal to the hole and shows up 60 to 90 min later as a bonk: fix lows with carbs + caffeine + 10 min of patience, not with pace.
**GI triage:** nausea = slow down (gut blood flow returns), switch to liquid carbs/cola, ginger, salt check, hike 10 min. Never stop fueling entirely for > 30 min; sip-feed back in.
## 7.3 Aid-station efficiency
- Budget rule: in-and-out target 1 to 2 min normal stations, 3 to 5 min major/crew stations [50MI+], 5 to 10 min only where planned (gear change, night kit) [100MI+].
- One-line why: 15 stations x 3 extra minutes = 45 free minutes lost at zero fitness cost.
- Protocol string: "decide needs 5 min before arrival; bottles first, food in hand, eat while walking out; never sit unless planned." Crew gets a written checklist per station.
## 7.4 [100MI+] night, sleep, and lows
- Night slowdown is real (Section 8.6): plan splits with it; brighter primary lamp (>= 400 lumens) + backup; spare batteries with crew.
- Sleep strategy: under 24 h goal: no sleep, manage with caffeine + light. 24 to 32 h: optional 10 to 20 min "dirt nap" at a crewed aid if sway/hallucination onset; set a hard alarm; cost 15 min, can save hours. 32 h+ / multi-day: planned 20 to 90 min sleeps; sleep before the wheels come off, not after.
- Lows protocol (encode as coachable string): every low has a cause in this order: calories, caffeine, temperature, sodium, sleep. Fix in that order, give it 20 to 30 min, keep relentless forward progress. Lows ALWAYS pass.
- Gear: poles for courses > 3000 m vert (if trained); shoe choice by terrain + half-size up for [100MI+] swelling; vest fitted in training; drop-bag map made race week.
## 7.5 [TIMED/BACKYARD] execution
- Backyard: target 42 to 46 min loops; identical reset routine every hour (eat first, then sit, shoes/kit, stand at 2 min warning). The race is elimination by routine failure.
- 24 h: rigid run/walk from minute 1 (DEFAULT 25/5), hourly eating alarm, lap-bank math ignored until hour 18; racing starts at hour 20.
---
# SECTION 8: EVENT-TIME / FINISH PROJECTION METHODOLOGY (the codeable engine)
The engine is deterministic and layered. Plain Riegel from a marathon (exponent 1.06) massively underpredicts ultras; do not use it here. Compute in this exact order:

```
1. base_pace      = marathon_pace x ULTRA_MULTIPLE[distance][tier]        (min/km, flat smooth)
2. flat_time      = base_pace x race_km
3. vert_add       = (race_gain_m / 1000) x VERT_ADD[tier]                 (min)
4. descent_add    = (race_descent_m / 1000) x DESCENT_ADD[descent_class]  (min)
5. moving_time    = (flat_time + vert_add + descent_add) x TERRAIN_FACTOR
6. night_add      = moving_time x NIGHT_FACTOR x night_fraction           ([100MI+] only by default)
7. stoppage       = AID_TIME[distance][tier]                              (min)
8. finish_time    = moving_time + night_add + stoppage
9. apply unpreparedness penalties (8.7), then confidence label and range (8.9)
```

## 8.1 Layer 1: flat-equivalent base from marathon PB
**ULTRA_MULTIPLE: expected flat-ultra moving pace as a multiple of marathon pace** (smooth flat surface, properly trained for the distance). This is the persona's primary table; the equivalent Riegel exponent is shown only as a cross-check and is NOT the codeable form (it is unstable at small distance ratios).
| Distance | Beginner | Intermediate (DEFAULT) | Advanced | Equivalent Riegel exponent (intermediate) |
|---|---|---|---|---|
| [50K] | 1.12 | 1.08 | 1.06 | ~1.45 effective |
| [50MI] | 1.25 | 1.18 | 1.14 | ~1.26 |
| [100K] | 1.32 | 1.24 | 1.19 | ~1.25 |
| [100MI] | 1.55 | 1.45 | 1.35 | ~1.28 |
Note the pattern: effective exponents sit far above road Riegel's 1.06 and the multiple grows with distance. Interpolate linearly by km for odd distances (e.g. 55K, 120K). [TIMED/BACKYARD]: invert the engine: given hours H, distance = H x 60 / projected pace at the H-equivalent point distance; for backyard, project the failure hour as the hour where required loop pace exceeds the athlete's projected sustainable pace + routine margin.
**Source PB ladder (use the best available, in order):** marathon PB <= 24 months -> use directly. Half PB only -> marathon_equiv = half_time x 2 x 1.065 (road conversion, this single road-conversion constant is shared logic, not a marathon-persona table). 50K result -> divide back through the 50K multiple. No PB at all -> estimate marathon pace from recent training: median Z2 GAP pace x 0.88, tagged LOW confidence. DEFAULT athlete with no usable data: 4:15 marathon equivalent (6.04 min/km), LOW confidence.
## 8.2 Layer 2: vertical (ascent) adjustment
**VERT_ADD: minutes added per 1000 m of total course ascent.**
| Tier | min per 1000 m gain | min per 1000 ft gain | DEFAULT |
|---|---|---|---|
| Beginner | 50 | 15 | |
| Intermediate | 40 | 12 | 40 / 1000 m |
| Advanced | 30 | 9 | |
Equivalent flat-distance formulation (alternative, same numbers must result): flat_equiv_km = race_km + (gain_m / K) with K = base_pace-dependent; with the additive table above this is unnecessary; use the additive form as canonical. If the athlete's logged climbing data shows a sustained vertical rate (3.5), refine per Part 2 correction UC1: vert_add_per_1000m = clamp(75 - 0.05 x vertical_rate_m_per_h, 25, 60).
## 8.3 Layer 2b: descent adjustment
**DESCENT_ADD: minutes per 1000 m of descent, by descent character:**
| Descent class | min per 1000 m descent | DEFAULT |
|---|---|---|
| Smooth/gradual (road, fire road, < 8% avg) | 0 | |
| Moderate trail (8 to 15%, runnable singletrack) | 5 | DEFAULT 5 if course unknown but trail |
| Technical (rock/root, steep) | 10 | |
| Very technical / steep alpine (> 20%, scree, fixed lines) | 15 to 20 | |
If course descent unknown, set descent_m = gain_m (loop/out-and-back assumption).
## 8.4 Layer 3: terrain-technicality and surface factor (multiplier on moving time)
| TERRAIN_FACTOR | Value | DEFAULT |
|---|---|---|
| [ROAD/FLAT] road or track | 1.00 | |
| Smooth trail / fire road / buffed singletrack | 1.05 | |
| Moderate technical singletrack | 1.12 | DEFAULT for unknown trail course: 1.08 |
| Very technical (sustained rock, root, scree, mud) | 1.20 | |
| Extreme alpine (UTMB-class high sections, snowfields) | 1.25 to 1.30 | |
## 8.5 Layer 4: aid-station / stoppage time (total non-moving minutes)
| Distance | Beginner | Intermediate (DEFAULT) | Advanced |
|---|---|---|---|
| [50K] | 20 | 12 | 6 |
| [50MI] | 40 | 25 | 12 |
| [100K] | 60 | 35 | 18 |
| [100MI] | 150 | 90 | 45 |
| [TIMED/BACKYARD] | n/a (idle time is structural) | | |
[100MI+] beginner stoppage includes chair time and one un-planned long stop; it is realistic, not generous.
## 8.6 Layer 5: night / sleep-deprivation slowdown [100MI+]
night_add = moving_time x NIGHT_FACTOR x night_fraction, where night_fraction = projected dark hours / total hours (estimate from start time + projected duration; DEFAULT night_fraction for 100MI = 0.30).
| NIGHT_FACTOR | Value |
|---|---|
| First 100-miler | 0.12 |
| Experienced (DEFAULT) | 0.08 |
| Advanced with night training logged | 0.05 |
Second night (projected > 32 h): double the factor for hours beyond 30. [100K]: apply only if projected finish crosses > 2 h of darkness, at half the factor. [50K/50MI]: 0.
## 8.7 Unpreparedness penalties (training-data reality check)
Apply multiplicatively to finish_time, each capped, total penalty cap x1.25:
- Vert unpreparedness [TRAIL/MOUNTAIN]: vert_ready_ratio = peak_week_vert / (0.30 x race_gain), per the Rule UW13 target. If ratio >= 1: no penalty. 0.5 to 1: x1.05. < 0.5: x1.12 and flag descent risk.
- Duration unpreparedness: longest_run_ratio = longest_recent_run_h / projected_finish_h. [50K] target >= 0.55, [50MI/100K] >= 0.35, [100MI+] >= 0.22 (or B2B combined >= 0.33). Each 0.10 below target: x1.04, cap x1.12.
- Volume unpreparedness: peak weekly hours below Section 1.3 floor: x1.08 and feasibility flag (Section 10).
- Stale PB: marathon PB age 24 to 48 months: pace x1.03; > 48 months: x1.06 and drop one confidence level. Recent training contradicting the PB (median Z2 GAP much slower than PB-implied): trust training, re-derive base via the no-PB path.
## 8.8 Defaults when data is missing
| Missing | DEFAULT |
|---|---|
| Course vert | [50K] 1000 m, [50MI] 2000 m, [100K] 2500 m, [100MI] 5000 m (trail races); 0 to 200 m road |
| Course terrain | trail: factor 1.08, moderate descent class; road: 1.00 |
| Athlete tier | intermediate |
| Marathon PB | from training (8.1 ladder), else 4:15 equivalent, LOW confidence |
| Descent meters | = gain meters |
| Start time [100MI] | 05:00, night_fraction 0.30 |
## 8.9 Minimum data and confidence labels
**Minimum for ANY credible projection:** (a) one race PB (any distance half-marathon+) OR 6 weeks of logged runs with HR or pace, AND (b) race distance + at least default-able terrain. Below this: refuse a number, give the feasibility narrative only.
| Confidence | Criteria (all required) | Range |
|---|---|---|
| HIGH | Marathon or ultra PB <= 18 months AND >= 12 weeks logged training AND logged weekly vert covering the vert-ready ratio AND a completed long run meeting the 8.7 duration target AND known course profile | +/- 10% |
| MEDIUM (DEFAULT) | A relevant PB <= 24 months AND >= 8 weeks logged training AND approximate course profile | +/- 15% ([50K]) / +/- 18% ([50MI/100K]) |
| LOW | Anything less; or any stale-PB / heavy-penalty path; always for a first [100MI+] | +/- 25% |
Ultra ranges are inherently wider than road (course variance, weather, GI, night). Never present a single time without its range and label. [100MI+] projections are always presented alongside the finish-probability statement (8.10), which matters more.
## 8.10 Finish probability for first-timers (separate from time)
finish_score in [0,1] = 0.30 x min(1, longest_run_ratio / target_ratio) + 0.25 x min(1, peak_week_hours / floor_hours) + 0.20 x min(1, vert_ready_ratio) + 0.15 x fueling_practice (1 if >= 4 logged fueled runs > 2.5 h, else fraction of 4) + 0.10 x B2B_done (1 if the prescribed biggest B2B completed). [ROAD/FLAT]: redistribute the vert weight 0.20 into longest_run_ratio (0.40 total) and fueling (0.25 total).
| finish_score | Verdict (vs cutoff check below) |
|---|---|
| >= 0.85 | High confidence finish |
| 0.65 to 0.84 | Likely finish, name the weakest component |
| 0.45 to 0.64 | At risk; finishing requires a conservative pacing plan and flawless fueling; name the 2 weakest levers |
| < 0.45 | Not ready; recommend deferral or shorter distance |
Cutoff check (mandatory companion): projected finish_time (with penalties) at the LOW-confidence slow end must be < race cutoff. If the slow end exceeds cutoff, say so plainly regardless of finish_score.
## 8.11 WORKED EXAMPLES (unit-test anchors; every number verified)
Athlete: intermediate, marathon PB 3:30 (210.0 min), marathon pace 210 / 42.195 = **4.977 min/km**. Training: ~7 h/wk, ~600 m vert/wk, longest run 4.0 h.
**Example A: 50K, 1500 m gain (descent 1500 m), smooth trail.**
1. base_pace = 4.977 x 1.08 = **5.375 min/km**
2. flat_time = 5.375 x 50 = **268.8 min**
3. vert_add = 1.5 x 40 = **60.0 min**
4. descent_add = smooth class = **0 min**
5. moving = (268.8 + 60.0 + 0) x 1.05 = **345.2 min**
6. night_add = 0
7. stoppage = intermediate 50K = **12 min**
8. finish = 345.2 + 12 = **357.2 min = 5 h 57 min** (1.70 x marathon time, inside the sane 1.5 to 1.8 band for a hilly 50K)
9. Penalties: longest_run_ratio = 4.0 / 5.95 = 0.67 >= 0.55 target, none. vert_ready_ratio = 600 / (0.30 x 1500) = 1.33 >= 1, none. Confidence MEDIUM, +/- 12%: **5 h 14 min to 6 h 40 min**.
**Example B: 100K, 3500 m gain (descent 3500 m), technical trail.**
1. base_pace = 4.977 x 1.24 = **6.171 min/km**
2. flat_time = 6.171 x 100 = **617.1 min**
3. vert_add = 3.5 x 40 = **140.0 min**
4. descent_add = technical: 3.5 x 10 = **35.0 min**
5. moving = (617.1 + 140.0 + 35.0) x 1.12 = 792.1 x 1.12 = **887.2 min**
6. night_add = 0 (100K default; projected ~15.4 h from an early start crosses < 2 h darkness)
7. stoppage = intermediate 100K = **35 min**
8. finish = 887.2 + 35 = **922.2 min = 15 h 22 min**
9. Penalties: longest_run_ratio = 4.0 / 15.37 = 0.26 < 0.35 target: one 0.10-step below -> x1.04 candidate. vert_ready_ratio = 600 / (0.30 x 3500) = 0.57 -> x1.05 candidate. Combined x1.092 -> **penalized finish = 1007 min = 16 h 47 min**, flag: "longest run and weekly vert are below 100K targets; projection assumes you close these gaps in the remaining build. If training stays as-is, expect the slower figure." Confidence LOW, +/- 20% on the unpenalized base: **12 h 18 min to 18 h 27 min**.
Presentation rule: when penalties fire, show the unpenalized number as "if training progresses to plan" and the penalized number as "at current training," plus the named levers.
---
# SECTION 9: ANTI-PATTERNS / SAFETY RULES (hard DO-NOTs, with numbers)
1. **Never ramp hours AND vert at max in the same week** (Rule UW3). Violation pattern: rest week then a monster B2B; cap any single week at 1.3 x the 4-week average (hours) and 1.4 x (vert).
2. **Never schedule a B2B without entry criteria** (UW12): >= 8 consistent weeks, 3 h long run done, no injury flag.
3. **Never train all-flat for a mountain race.** If race vert/km > 25 m/km and athlete's logged vert/km < 8 m/km with < 8 weeks remaining: force vert substitutes immediately and apply 8.7 penalties. Untrained descending is the quad-blowup, not the climbing.
4. **Never skip downhill/eccentric work for [TRAIL/MOUNTAIN].** Minimum 4 downhill or eccentric-gym sessions before Peak ends. Last hard downhill >= 14 days out.
5. **Never let a race fueling rate exceed the trained rate.** Race g/h <= best repeatedly-tolerated training g/h + 10. No fueled run > 2.5 h logged = cap race plan at 60 g/h and flag GI risk.
6. **Never exceed ~20% of weekly time above Z2** in any week (the moderate trap); Base cap 10%.
7. **Never ignore sleep/life stress:** if the athlete reports high life stress or the load model shows TSB < -30 outside a planned overload, auto-deload; never stack a B2B on a TSB < -25 week.
8. **RED-S guardrail:** at >= 10 h/wk, flag any intentional calorie deficit; symptoms (sleep disruption, repeated illness, missed cycles, persistent HR suppression or elevated resting HR) = volume cut 30% + recommend professional consult. Chronic underfueling in high-volume blocks is the silent career-ender.
9. **Heat/altitude naivety:** race forecast > 27 C with no heat exposure logged: add 10 to 14 days of heat acclimation protocol (or sauna proxy) and slow projected pace 1% per degree C above 18 C WBGT-equivalent (cap 10%). Race altitude > 2000 m with sea-level athlete: pace penalty ~2 to 3% per 1000 m above 1500 m, arrive either < 24 h or > 10 days before.
10. **No-deload guardrail:** never more than 3 consecutive loading weeks (2 for beginners/masters). The app must insert the deload even if the athlete deletes it.
11. **ACWR:** hold 0.8 to 1.3 hours-ACWR and < 1.4 vert-ACWR (UW6). Two consecutive weeks > 1.3 = forced absorb week.
12. **Never derive race pacing from training pace on different terrain** without GAP conversion (Section 3.4).
---
# SECTION 10: FEASIBILITY / SANITY CHECK
## 10.1 Inputs and verdict structure
Inputs: goal (distance + terrain + vert + [FIRST-FINISH] or target time) + weeks-to-event W + current fitness (4-week hours, vert, longest run, PBs, tier, injuries). Output: REALISTIC / STRETCH / UNREALISTIC + the specific lever.
## 10.2 Minimum-requirements check (gates, in order)
1. **Prerequisite gate [100MI+ first-timers]:** no 50MI/100K finish within 24 months = UNREALISTIC; lever: race a 100K first (or accept a finish-probability < 0.45 framing if they insist; the app recommends, the athlete decides).
2. **Runway gate:** W < Section 1.3 minimum weeks for the distance, measured from current fitness (if current weekly hours already >= 70% of the required peak, the minimum may compress 25%): else lever = more weeks (name the race date that works) or shorter distance.
3. **Ramp-math gate (codeable):** required peak hours reachable? weeks_needed_hours = ceil(ln(peak_h / current_h) / ln(1 + ramp)) + deload weeks (1 per 3) + taper. Same for vert: weeks_needed_vert with the UW2 ramp. If max(weeks_needed_hours, weeks_needed_vert) > W - peak_weeks: STRETCH or UNREALISTIC; lever = the binding constraint (state whether HOURS or VERT is the bottleneck; vert is the usual one for mountain races).
4. **Time-budget gate:** required peak hours > athlete's stated available hours x 1.1 = UNREALISTIC on volume; lever = soften goal (e.g. [FIRST-FINISH] instead of time goal, or 50K instead of 50MI).
5. **Target-time gate [PERFORMANCE]:** run the Section 8 projection at plan-complete assumptions; target faster than projection's HIGH-confidence fast end (-10%) = UNREALISTIC time; inside the range = REALISTIC; between fast end and -10% beyond = STRETCH.
## 10.3 First-timer finish-readiness assessment
Computed via finish_score (8.10) projected to race week assuming the plan completes. Surface the three named ratios in plain language: longest run as a fraction of expected race time, peak weekly hours vs floor, peak-week vert vs 30% of course vert, plus fueling-practice count.
## 10.4 How fast ultra qualities actually improve (for honest levers)
- Aerobic durability (the engine): noticeable in 8 to 12 weeks, keeps compounding for years. The slowest and most valuable currency.
- Vert capacity (climbing): 6 to 10 weeks to a meaningful step under the UW2 ramp; a flatlander cannot fake 3000 m/wk legs in a month.
- Descending durability: FAST: 4 to 6 eccentric exposures over 3 to 5 weeks via the repeated-bout effect. The cheapest big win in ultrarunning.
- Gut tolerance: 4 to 8 weeks of progressive fueled runs to move +20 to 30 g/h.
- Road speed (threshold/VO2): 4 to 8 weeks, but it is rarely the limiter beyond [50K].
- Heat acclimation: 10 to 14 days. Altitude: partial in 2 to 3 weeks, full in months.
## 10.5 Verdict pairing rule (hard)
Every UNREALISTIC or STRETCH verdict MUST name its one binding lever from: more weeks, more weekly time on feet, more vert, downhill/eccentric work, fueling practice, or a softer goal (slower target / shorter distance / flatter race), with the specific number that closes the gap (e.g. "you need peak weeks of 1800 m vert; the ramp from your current 600 m/wk takes 10 weeks and you have 6: pick a race 5+ weeks later or a course under 2000 m total gain"). Reality-check rule applies: tell the truth even if it disappoints.
---
**End of ULTRARUNNER methodology PART 1. All projection numbers in Section 8.11 are computed and internally consistent for unit testing. Persona scoping: nothing in this document feeds the marathon, half-marathon, or short-run personas. Part 2 covers adaptive adjustment, session scaling, weekly templates, projection depth, recovery, environment, strength, fueling periodization, special populations, and proactive triggers.**
