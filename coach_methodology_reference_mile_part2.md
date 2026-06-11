# Middle-Distance / Miler Methodology, Part 2

> Extension to `coach_methodology_reference_mile.md`. Same persona, same scope, same house style: no em-dashes, every range has a DEFAULT, every rule keyed to beginner / intermediate / advanced, all paces anchored to VDOT / critical velocity / ASR with an RPE fallback, divergences marked `[800M]` `[MILE]` `[3000M]` and `[SPEED-TYPE]` `[ENDURANCE-TYPE]`. All numeric examples computed and cross-checked before writing; unit-test against them. Factor tables scoped to this persona only, no leakage to or from the distance and triathlon personas.

---

# PART A: Review and extend the Part 1 reference

Things Part 1 left thin, glossed, or could make more codeable. Corrections and additions in the same style.

### A1. The 800m three-type model (Part 1 collapsed this into SPEED vs ENDURANCE; it needs three)

The 800 is the event where type matters most. Standard physiological model (Coe, ASR literature):

| Type | Profile | 400 PB vs 800 | Diagnostic | Mile read |
|---|---|---|---|---|
| Type I (400/800 speed) | sprinter dropping up | 400 < ~48% of 800 time | very large ASR, fades hard after 600 | rarely a real miler; mile is endurance-limited |
| Type II (pure 800) | true two-lap | 400 ~ 48 to 50% of 800 | balanced, the classic 800 specialist | competitive miler with work |
| Type III (800/1500 endurance) | miler dropping down | 400 > ~50% of 800 | small ASR, strong final 200 from strength | the typical Stryxs amateur miler |

Codeable split index: `SI = t400 / (t800 / 2)`. SI < 0.96 = Type I, 0.96 to 1.00 = Type II, > 1.00 = Type III. DEFAULT when no 800: infer from the Section-5 speed-vs-endurance diagnosis (Type I/II map to SPEED-TYPE, Type III to ENDURANCE-TYPE). Training divergence: Type I needs the most special endurance (holding speed), Type III needs the most pure speed and R-pace (acquiring a gear), Type II balances both.

### A2. vVO2max test protocol was under-specified

Two field tests, in priority:
- 6-minute time trial (best single field proxy for vVO2max): distance covered in 6 min at max even effort. `vVO2max (m/s) = distance_m / 360`. The 6-min duration is close to the time-limit at vVO2max (tlim typically 4 to 8 min). DEFAULT recovery before test: 2 easy days.
- 1500 race velocity * 1.03 (1500 is run slightly above vVO2max for trained runners).
Untested DEFAULT: derive from VDOT (Section 3, Part 1). Use the 6-min TT to re-anchor the whole pace system every 6 to 8 weeks.

### A3. Critical velocity, make it a two-point estimate

CV from two max efforts is more accurate than the 0.92*vVO2max shortcut. `CV = (D2 - D1) / (T2 - T1)` from two TTs on different days (e.g. 1200m and 2400m, or 3-min and 9-min). The intercept `D' = D1 - CV*T1` (meters) is the anaerobic distance capacity, a direct ASR-family marker: high D' confirms SPEED-TYPE. DEFAULT D' by tier: beginner 150m, intermediate 200m, advanced 250m (males ~20% higher than females). Use CV for the aerobic-support workhorse, use D' as a secondary speed-reserve signal when no 400 PB exists.

### A4. Strides were under-prescribed; distinguish three neuromuscular doses

| Tool | Distance / dose | Effort | Purpose | Counts as quality? |
|---|---|---|---|---|
| Strides | 4 to 8 x 20 to 30m | ~95% | turnover, economy maintenance | no |
| Hill sprints | 6 to 10 x 8 to 12s steep | max | tendon stiffness, power, low impact | no |
| Flat speed (Section 4.7) | 4 to 8 x 30 to 150m | 95 to 100% | raise MSS / ASR | YES, count it |

The distinction matters for the quality-session cap: strides and hill sprints are free, flat max-velocity work is not.

### A5. The Riegel fallback needs the actual computed exponents inline (Part 1 gave a range)

DEFAULT exponents to encode (computed, VDOT 38 to 62 range in parentheses):
- mile to 5K: **1.08** (1.074 to 1.091)
- 800 to 5K: **1.087** (1.083 to 1.087)
- 400 to mile: **1.07** (1.066 to 1.083)
- 800 to mile: **1.09** (1.082 to 1.097)
- mile to 3000: **1.095** (1.088 to 1.100)
- 1500 to mile: **1.0** (same event, scale by 1609.34/1500 = 1.0729 on distance, time ratio ~1.078)
Use VDOT as primary; Riegel only when a lookup is unavailable.

### A6. Confidence model needs a recency decay (Part 1 was static)

Apply a recency multiplier to the +/- range: a PB older than 6 weeks widens the band. `band = base_band * (1 + 0.04 * weeks_since_PB / 6)`, capped at 2x base. A 6-month-old 5K still anchors a projection but at LOW confidence regardless of other data.

### A7. Heat and the warmup tradeoff (missing entirely)

The long specific warmup raises core temperature, which in heat (> 24 C / 75 F) becomes a liability for the 3000 and even the mile. DEFAULT: above 24 C, cut the warmup jog by 30 to 40%, keep the drills and strides, add a cooling step (ice towel, cold drink) in the final 10 min. The 800 warmup is least affected (the race is too short for heat to bite). Below 10 C, lengthen the warmup and stay moving until 5 min before the gun.

---

# PART B: What a truly great middle-distance AI coach needs (my expert opinion)

Ranked by how much they move the needle for your actual user (the under-developed amateur miler), with the highest-value gaps first. The deep sections after this fold in the top ones.

**1. Running economy as an explicitly trained, explicitly tracked quality.** This is the single biggest lever for an amateur miler and the most neglected. RE is how much oxygen (or energy) it costs to run a given pace. Two runners with identical VO2max can differ 10 to 15% in mile time on economy alone. It is trained by strides, plyometrics, heavy strength, hill sprints, and high-volume easy running, and it shows up in the data as pace-at-HR drifting faster over a block with no VDOT change. A great coach tracks it and attributes improvement correctly (economy vs fitness). Deep-dived in Section 16.

**2. The lactate-tolerance vs lactate-clearance distinction.** These are different adaptations trained by different sessions, and conflating them is a classic amateur error. Clearance (raising the threshold, processing lactate) is threshold/CV/easy-volume work. Tolerance (buffering and performing while lactate is high) is special-endurance/race-pace work with incomplete recovery. The endurance-typed amateur has good clearance and terrible tolerance, which is exactly why they have no kick. Deep-dived in Section 14.

**3. Adaptive week-to-week adjustment from real data.** You flagged this as the most important gap and you are right. A static plan is a PDF; a coach reacts. Section 12.

**4. The finishing kick as a trainable quality, not a gift.** Amateurs treat the kick as innate. It is trainable: it is special endurance plus speed plus the neuromuscular ability to recruit fast-twitch fibers when pre-fatigued. Specific sessions build it. Section 15.

**5. Female-athlete physiology.** If you have any female users this is non-optional and almost always missing from apps: menstrual-cycle-aware load (the late-luteal phase raises core temp and perceived effort, the early-follicular phase tolerates high intensity well), RED-S and energy availability as the dominant injury and performance risk, iron/ferritin (endurance women are frequently deficient, and it tanks the aerobic engine), and bone-stress risk with high-velocity loads. Section 17.

**6. Youth and masters middle distance.** You are 17 and your users span ages. Adolescents: avoid early specialization, cap anaerobic volume during peak growth (the year of fastest height gain), watch growth-plate and apophysis sites (Achilles insertion, tibial tubercle), and prioritize the aerobic base and skill. Masters (35+): power and MSS decline faster than aerobic capacity, so the speed end needs MORE attention not less, but with longer recovery and more tendon care. Section 17.

**7. The mental side of redlining for 2 to 6 minutes.** The mile hurts in a specific way (the third lap), and pace discipline plus pain tolerance are trainable through the workouts themselves. A coach should cue this. Section 18.

**8. Supercompensation and peaking timing across a season.** The sharp window is real and finite (4 to 8 weeks). A coach should plan the peak to land on the A-race and warn when a peak is being held too long or built too early. Section 11 (Part 1) plus the proactive triggers in Section 20.

**9. Double-threshold / Norwegian influence, scoped correctly.** Useful for the aerobic SUPPORT of the 1500/3000 endurance type, NOT a middle-distance core method. Two sub-threshold sessions in one day raises clearance volume with low single-session strain. Only for advanced, high-availability, endurance-typed runners. Section 14.

**10. Anaerobic capacity vs anaerobic power.** Power is the rate (sprint, MSS), capacity is the total anaerobic work (MAOD, the D' intercept). The 800 needs both; the mile needs power plus modest capacity; the 3000 needs little of either beyond a kick. Worth modeling because it sharpens the type diagnosis.

**11. Altitude.** Mostly an aerobic-support tool for milers (live high for the engine, but do the speed work low or accept slower paces). Marginal for most amateurs. Section 19.

**12. Spikes and track mechanics.** A real performance variable and a real injury vector. Section 19.

Lower priority but worth having eventually: wind/lane tactics, environmental pacing adjustments, doubles for high-mileage endurance types, and a proper warmup-quality audit.

---

# PART C: Deep dives

## 12. Adaptive adjustment (the core gap)

Input each week: paces hit vs target on R/I/T, in-set fade, HR/pace on intervals, completed vs missed quality, RPE and felt-tags (easy/hard/strong/flat/sore/sick), CNS-fatigue and tendon-niggle flags, CTL/ATL/TSB/ACWR, and the 2 to 3 week trend. Output: next week's adjustment.

### 12.1 The rep-fade metric (codeable)

`fade% = (avg(last 2 reps) - avg(first 2 reps)) / avg(first 2 reps) * 100`. Compute per quality session.

| Session | Acceptable fade | Edge (hold) | Excessive (act) |
|---|---|---|---|
| R-pace (speed/economy, full recovery) | < 2% | 2 to 4% | > 4% |
| I-pace (VO2, ~1:1 recovery) | < 3% | 3 to 5% | > 5% |
| Special endurance (lactate tolerance) | < 4% | 4 to 7% | > 7% |
| Threshold / CV | < 2% | 2 to 3% | > 3% |

Worked: R-pace 6x400 at 80s target, splits [80,80,81,80,81,82] -> fade +1.9% = crisp, progress. Splits [80,81,82,84,86,88] -> fade +8.1% = excessive: the speed-endurance is the limiter. I-pace 5x1000 at 222s, [221,222,224,227,231] -> fade +3.4% = edge, hold.

### 12.2 Adjustment rules (priority order, first match wins)

1. **Tendon-niggle flag (Achilles/soleus/patellar) OR sore-tag 2+ sessions:** pull SPEED and PLYO volume first (they load tendons most), keep aerobic and threshold. Cut flat speed and plyo by 50% next week, hold R-pace at reduced reps. Re-add only after 7 symptom-free days. Tendons are the miler's #1 season-ender.
2. **CNS-fatigue flag (flat-tag on speed days, MSS/stride pace down > 3%, can't hit R-pace despite full recovery):** the nervous system, not the engine, is fatigued. Drop the next anaerobic session to easy, keep one short threshold, insert an extra easy/rest day. Do NOT push through.
3. **sick-tag OR resting-HR up > 7 bpm OR HRV down > 1 SD:** illness or deep fatigue. Easy/rest only until clear, no quality. Return with 1 light quality, not 2.
4. **Missed quality session:** do NOT stack it onto the next week. Drop it. Stacking creates back-to-back anaerobic days (guardrail violation). At most, swap the next easy day for the lighter of the two missed sessions if 48h spacing holds.
5. **Excessive fade on R-pace (> 4%):** cut REP COUNT next time, not pace. Pace defines the quality; holding pace for fewer reps is the adaptation. (e.g. 6x400 -> 5x400 at the same 80s.)
6. **Excessive fade on I-pace (> 5%):** recovery was too short or VO2 ceiling is the limiter. Lengthen recovery to 1:1.2 OR cut one rep. Keep pace.
7. **Excessive fade on special endurance (> 7%):** lactate tolerance is underdeveloped. Reduce to goal pace (not faster) and lengthen recovery to 1:6. Build tolerance before sharpening.
8. **Hitting all paces at low RPE (felt-easy, RPE <= 6 on I/R sessions) for 2+ sessions AND TSB > -5:** ready to sharpen. Re-anchor: bump VDOT by 1 (or re-test with a 6-min TT / time trial), tighten paces, or add one rep. See 12.4.
9. **RPE creep (same session, same paces, RPE up >= 2 points over 2 to 3 weeks):** hidden fatigue. Insert a deload now (cut volume per tier, drop to 1 quality), do not wait for the scheduled one.
10. **ACWR > 1.5 (weighted, see 12.3):** cut next-week load to bring ACWR to 1.0 to 1.2. Trim the easy volume and the third quality session first, protect the priority session.

DEFAULT when signals conflict: take the most conservative action (more rest), because in middle distance the cost of a missed session is small and the cost of a tendon injury is a lost season.

### 12.3 Weighted load and ACWR (codeable)

Session load (Foster sRPE) with a CNS weighting for anaerobic work: `load = sessionRPE(0-10) * minutes * w`, where `w = 1.5` for anaerobic sessions (I, R, special endurance, flat speed) and `1.0` otherwise. Weekly acute = sum of 7 days. Chronic = 28-day rolling average of weekly load. `ACWR = acute / chronic`. Sweet spot 0.8 to 1.3, caution 1.3 to 1.5, flag and cut > 1.5.

Worked week: Easy(3x45)=135, VO2 5x1000(8x55x1.5)=660, Easy(3x40)=120, R-speed(9x50x1.5)=675, Long(4x80)=320, Rest=0, Strides+E(4x40)=160. Acute = 2070. If chronic ~1965, ACWR = 1.05 (fine). A jump to 3312 next week = ACWR 1.68 -> flag, cut.

### 12.4 Re-anchoring VDOT mid-block (when to sharpen)

Trigger: rule 8 above, OR a key session run clearly faster than prescribed, OR a new race/TT. Method: back the implied VDOT out of the session. If 5x1000 prescribed at I-pace for VDOT 50 (3:50/km) is run at 3:42/km with normal RPE, that 3:42/km is the new I-pace -> implied VDOT ~52.3 (vVO2max risen). Re-anchor the whole pace table to 52, retest within 2 weeks to confirm before trusting the projection at HIGH confidence. Never bump more than 2 VDOT points at once from a single session.

### 12.5 Overtraining / overreach / injury red flags (thresholds and response)

| Flag | Trigger threshold | Response |
|---|---|---|
| Functional overreach (intended, short) | TSB < -15 for < 10 days, paces still hit | Acceptable in a build; ensure a deload follows within 2 weeks |
| Non-functional overreach | TSB < -20 AND pace-at-HR slowing AND RPE creep >= 2 | Force 5 to 7 easy days, no quality, reassess |
| CNS overreach (speed-specific) | stride/MSS pace down > 5% AND flat-tag on 2 speed days | Pull all flat speed and plyo for 7 to 10 days, aerobic only |
| Tendon overload | recurring Achilles/soleus/patellar niggle after plyo or spikes | Stop plyo/spikes, cut speed 50%, 7+ symptom-free days before return |
| Illness | resting HR +7 bpm OR HRV -1SD OR sick-tag | No quality until clear; return at 50% quality |
| Bone-stress risk | localized point pain that worsens with impact, esp. shin/foot/femur | Stop impact immediately, refer to clinician, do not "train through" |

---

## 13. In-session structure (warmup / main / cooldown, scaled by phase)

### 13.1 The full middle-distance warmup (a performance variable, see Part 1 Section 6)

DEFAULT quality-session warmup (scale down for easy days to just the jog):
- 12 to 20 min easy jog (E pace, RPE 2 to 3). Shorter in heat (Part A7).
- Dynamic drills, 2 sets: A-skip, B-skip, high knees, butt kicks, leg swings, lunge walk (~10m each).
- 4 to 6 x strides (20 to 30m, building to faster than session pace).
- Session-specific primer: 2 to 3 build-ups to the day's target pace (e.g. before an R-pace session, 2 x 150m at R).
Track version: do the strides and primer on the track in lane 1 to 2. Treadmill version: 0.5 to 1.0% incline, do drills off the belt, primers as short accelerations. Cooldown: 10 to 15 min E jog + light mobility.

### 13.2 VO2max / I-pace session growing Base -> Support -> Specific

Target I-pace = vVO2max (Part 1 Section 3). Recovery ~1:1 (equal-time jog). Emphasis `[3000M]` and `[MILE]`.

| Phase | beginner | intermediate | advanced |
|---|---|---|---|
| Base (introduce) | 4 x 800m at I, 400 jog | 5 x 800m at I, 400 jog | 5 x 1000m at I, 90s jog |
| Support (peak VO2) | 5 x 800m at I, 90s jog | 5 x 1000m at I, 90s jog | 6 x 1000m at I, 90s jog |
| Specific (maintain) | 4 x 800m at I, 90s jog | 4 x 1000m at I, 90s jog | 5 x 1000m at I, 75s jog |

Total work at I: cap 4 to 6 min (beg), 6 to 9 min (int), 9 to 12 min (adv). RPE 8 to 9. Fade limit 5% (12.1).

### 13.3 R-pace speed session growing Base -> Support -> Specific

Target R-pace = mile/1500 race velocity. FULL recovery (1:3 to 1:4). Emphasis `[MILE]` `[800M]` and `[ENDURANCE-TYPE]` (they need it most).

| Phase | beginner | intermediate | advanced |
|---|---|---|---|
| Base (economy) | 6 x 200m at R, walk 200 | 8 x 200m at R, walk 200 | 10 x 200m at R, walk 200 |
| Support (extend) | 6 x 300m at R, 3 min | 8 x 300m at R, 2:30 | 6 x 400m at R, 3 min |
| Specific (race-sharp) | 5 x 400m at R, 3 min | 6 x 400m at R, 3 min | 4 x (300+300) at R, 30s/full |

RPE 9, crisp. Fade limit 4% (12.1): exceed it and cut reps, not pace.

### 13.4 Special-endurance / lactate-tolerance session growing Base -> Support -> Specific

Target race pace or slightly faster, LONG recovery (1:4 to 1:8). Hard cap 1/wk, 72h spacing. Backbone for `[800M]`; key for `[MILE]`; `[SPEED-TYPE]` Type I needs the most.

| Phase | beginner | intermediate | advanced |
|---|---|---|---|
| Base (omit/light) | not yet | 2 x 400m at goal pace, 4 min | 2 x 500m at goal pace, 5 min |
| Support (introduce) | 2 x 400m at goal, 5 min | 3 x 500m at goal, 5 min | 3 x 600m at goal, 6 min |
| Specific (sharpen) | 2 x 600m at goal, 8 min | 3 x 600m at goal, 8 min | 2 to 3 x 600m at goal-or-faster, 8 to 10 min |

`[MILE]` broken-mile alternative in Specific: 4 x 400m at goal mile pace, 30 to 60s rest, progressing rest down. RPE 9 to 10. Fade limit 7%.

---

## 14. Lactate clearance vs tolerance (train each separately)

| Adaptation | What it does | Sessions | Pace anchor | Frequency |
|---|---|---|---|---|
| Clearance (raise threshold) | process lactate, run faster before it accumulates | threshold, CV, high easy volume | T pace / CV / E | year-round, 1 to 2/wk |
| Tolerance / buffering | perform with high lactate, the kick | special endurance, race-pace reps, broken intervals | race pace or faster, incomplete recovery | Specific phase, 1/wk max |

The endurance-typed amateur has good clearance and poor tolerance (no kick); prescribe tolerance. The speed-typed runner has good tolerance and may lack clearance (fades in the back half); prescribe clearance. This is the training-side mirror of the speed-vs-endurance diagnosis.

**Double-threshold (Norwegian), scoped.** Two sub-threshold (CV / just-under-T, RPE 6, lactate ~2.5 to 3.5 mmol) sessions in one day, AM and PM, raises clearance volume with low single-session strain. ONLY for advanced, 6+ day, ENDURANCE-TYPE runners building `[1500]` `[3000]` support. DEFAULT dose: 2 x (5 x 1000m at CV) split AM/PM, 1 day/wk, max 1 to 2 weeks per phase. Never for beginners, never for the speed end, never replaces the VO2 or speed work.

---

## 15. The finishing kick as a trainable quality

The kick = special endurance + speed + the ability to recruit fast-twitch fibers when pre-fatigued. Train it specifically:

- **Pre-fatigue speed:** after a tempo or a set of I-reps, add 4 to 6 x 150 to 200m at R-pace or faster, full recovery. Teaches speed on tired legs. 1/wk in Specific.
- **Fast-finish race-pace:** broken mile where the LAST rep is faster (e.g. 3 x 400 at goal + 1 x 400 at 400-pace effort).
- **Float-and-surge:** alternate 200m at race pace / 200m at slightly slower for 4 to 8 reps. Trains the surge-recover-surge of real racing. `[MILE]` `[1500]`.
- **Sustained drive (for endurance types with no top gear):** the last 600 to 800m of a long tempo dropped to race pace. Builds a long kick rather than a short sprint.

Divergence: `[SPEED-TYPE]` already has the gear, train its DEPLOYMENT timing (kick late, last 200). `[ENDURANCE-TYPE]` build a LONG kick (last 400 to 600 progressive drive) since they cannot win a pure sprint. `[800M]` the kick is really speed-maintenance (least deceleration wins); `[3000M]` the kick is a long aerobic surge from ~600 out.

---

## 16. Running economy (train it, track it)

RE is energy cost at a given submaximal pace. Drivers and how to train each:

| Driver | Trained by | Phase | Dose |
|---|---|---|---|
| Tendon stiffness / elastic return | plyometrics, hill sprints | Base, Support | Section 21 table |
| Neuromuscular coordination | strides, drills, max strength | year-round | strides 2 to 3/wk |
| Fiber-type / recruitment | R-pace, speed, heavy strength | Specific | 1 speed + 1 R/wk |
| Aerobic mitochondrial density | high easy volume | Base | tier volume |
| Body composition / power-to-weight | training + fueling (NOT restriction) | year-round | manage carefully, see 17 |

Tracking RE from data (no lab): monitor **pace-at-fixed-HR** on a standard easy or threshold loop. If the athlete runs faster at the same HR over a block with no VDOT change, economy improved; attribute it correctly in messaging (Section 20 trigger). DEFAULT standard: a fixed 20-min CV effort logged every 3 to 4 weeks. A 1 to 2% pace gain at equal HR with stable VDOT = an economy gain.

---

## 17. Female-athlete, youth, and masters middle distance

### 17.1 Female-athlete physiology
- **Menstrual-cycle-aware load (when tracked, opt-in):** early-follicular and ovulatory phases tolerate high intensity well; late-luteal raises core temp, RPE, and heat strain. DEFAULT: do not force a hard anaerobic session in the late-luteal phase if RPE is creeping; swap to threshold. Never make this a hard gate, it is a soft modifier.
- **Energy availability / RED-S (the dominant risk):** low energy availability tanks performance, bone, and the cycle. RED-S, not training load, is the leading cause of stress fracture and stalled progress in female endurance athletes. The coach must NEVER prescribe restriction and should flag rapid weight loss + missed cycles + recurring bone niggles as a refer-out, not a training tweak.
- **Iron / ferritin:** endurance women are frequently low; ferritin under ~30 ng/mL impairs the aerobic engine. If data shows aerobic decline with good training, surface "ask a clinician about iron" (informational, not diagnosis).
- **Bone-stress risk** rises with high-velocity loads; ramp plyo and spikes more conservatively (Section 21).

### 17.2 Youth (adolescent)
- Avoid early specialization; the aerobic base and skill transfer, narrow speed-only training does not.
- During peak height velocity (the year of fastest growth), cap anaerobic and plyo volume; growth plates and apophyses (Achilles insertion, tibial tubercle) are vulnerable. DEFAULT: hold flat-speed and plyo at maintenance, emphasize base and strides.
- Lower weekly volume ceilings than the adult tier table; progress patiently.

### 17.3 Masters (35+)
- MSS and power decline faster than aerobic capacity, so the SPEED end needs MORE attention, not less, but with longer recovery (72h+ between anaerobic sessions vs 48h) and more tendon care.
- Add a recovery day; the deload cadence tightens to every 3rd week. Strength work becomes more important for power retention.

---

## 18. The mental side (cue it through the workouts)

The mile redlines for 4 to 6 minutes; the 800 is a controlled panic; the 3000 is sustained discomfort. Trainable mental skills and the sessions that build them:
- **Pace discipline:** even-pace tempo and race-pace reps teach not going out too hard (the #1 amateur tactical error). Cue: "the first lap should feel too easy."
- **Pain tolerance / the third-lap dip:** broken-mile and float-and-surge sessions rehearse the mid-race low. Cue: "lap 3 is where the race is won, expect it to hurt and hold form."
- **Kick commitment:** pre-fatigue speed work rehearses deciding to go. Cue: "decide your move before the race, then commit fully."
- **Process cues for race day:** relax the face/shoulders, quick turnover, one competitor at a time. These reduce the economy cost of tension (Section 16).

---

## 19. Environment and logistics

### 19.1 Spikes vs trainers (a real performance and injury variable)
- Spikes improve economy and turnover, worth 1 to 3s in the mile, but load the calf/Achilles hard.
- Introduce gradually: 1 short spike session/wk (strides or a few R-reps in spikes), hold for 3 weeks before adding a full spike session. Never debut spikes on race day.
- DEFAULT by tier: beginner trainers or flats only until a base of speed work exists; intermediate flats for most work, spikes for sharpening; advanced spikes for all track quality in Specific.

### 19.2 Track, wind, lane, heat
- Lane: train in lane 1 to 3; know that an outer lane adds distance (lane 8 of 400m adds ~53m per lap), so pace by feel/effort in outer lanes.
- Wind: expect the back straight to be into the wind; even-effort (not even-pace) on windy days. Do not chase splits into a headwind.
- Heat (> 24 C): see Part A7; cut warmup volume, cool actively, pace by effort, expect slower times especially `[3000M]`.

### 19.3 Altitude
- Mainly an aerobic-support tool: live-high benefits the engine (the endurance side), but speed and R-pace must be done at slower absolute paces or accept reduced quality. Re-anchor paces to effort, not sea-level numbers, at altitude.
- Marginal for most amateurs; only worth structuring for advanced runners with access. Racing soon after descent: individual, DEFAULT a 2 to 5 day window or 14+ days, avoid the 7 to 12 day dip.

### 19.4 Event-week and race-day checklist
- Race week: full taper (Part 1 Section 6), 1 to 2 short race-pace touches, sleep priority, no new shoes/spikes/sessions.
- Day before: 15 to 20 min E + 4 strides + 2 x 100m at mile pace. Lay out spikes, pins, kit. Rehearse the pacing/tactic plan and the kick timing.
- Race day warmup timing (DEFAULT for the mile): 40 to 50 min before gun start jog (15 to 20 min), 30 min drills, 25 min strides (6 to 8), 20 min build-ups (3 to 4), 12 to 15 min two race-pace primers (150 to 200m), then stay warm. `[800M]` longer and more speed-primed; `[3000M]` shorter, less primer. Kick rehearsal: one 150m at race pace in the final primer to wake the gear.

---

## 20. Strength, plyometrics, and economy across a season (table)

All convert to economy and the finishing kick. Injury-prevention essentials baked in. Emphasis `[800M]` `[SPEED-TYPE]` highest; every miler needs the base.

| Phase | Max strength | Reactive / plyometric | Hill sprints | Sprint mechanics / drills |
|---|---|---|---|---|
| Base | 2x/wk, 3 to 5 reps @ 80 to 90% (squat, trap-bar DL, calf) | low-amplitude, 2x/wk (pogo, ankle hops) 2 to 3 sets | 1x/wk, 6 to 10 x 8 to 12s | 2 to 3x/wk drills + strides |
| Support | 1 to 2x/wk, 3 to 4 reps @ 85% | moderate, 1 to 2x/wk (bounds, box jumps) 3 sets | optional 1x/wk | 2x/wk |
| Specific | 1x/wk power (light, fast: jump squats, cleans) | reactive, 1x/wk low volume | replaced by flat speed | 2x/wk strides |
| Taper | 1 light power session, maintain | 1 short reactive, primer only | none | strides only |

Progression cap (12.1 family): add at most 1 plyo set every 2 weeks; cap weekly sprint/plyo contact volume increase at 10%.

### Injury-prevention essentials (miler-specific, high-velocity loads)
- **Achilles / soleus:** the #1 miler injury from speed and spikes. Eccentric heel drops 2x/wk, ramp spikes slowly, never two anaerobic days adjacent.
- **Hamstring:** sprint and R-pace load it; Nordic curls or hamstring bridges 1 to 2x/wk, always warm up speed work fully.
- **Calf:** plyo and spike load; calf raises (straight and bent knee), gradual plyo.
- **Hip flexor:** high-knee turnover; mobility and gradual speed volume.
- DEFAULT rule: any recurring tendon niggle pulls speed/plyo first (12.2 rule 1), never push through impact pain.

---

## 21. Weekly templates (ready-to-use 7-day layouts)

CNS-recovery spacing baked in: no two anaerobic days adjacent, 48h+ between hard sessions (72h between special-endurance / lactate sessions), strides do not count as quality. Q = quality session. Paces anchor to VDOT (Part 1 Section 3).

### 21.1 SPEED-TYPE miler (needs aerobic support: more threshold/CV and volume, speed maintained)

**Base (4-day):** Mon rest | Tue Q1 CV tempo 20 to 25 min + strides | Wed easy + strides | Thu rest | Fri Q2 hill sprints 8 x 10s + easy | Sat long run (capped) | Sun easy.
**Base (5-day):** Mon easy | Tue Q1 CV tempo + strides | Wed easy + strides | Thu Q2 R-pace 8 x 200m | Fri easy | Sat long | Sun rest.
**Support (6-day):** Mon easy + strides | Tue Q1 VO2 5 x 1000m at I | Wed easy | Thu easy + strides | Fri Q2 CV 5 x 1000m at T | Sat long | Sun easy or rest. (Speed type already has the gear; both Q are aerobic support here.)
**Specific (6-day):** Mon easy + strides | Tue Q1 special endurance 3 x 600m at goal | Wed easy | Thu Q2 CV tempo (clearance) | Fri easy + strides | Sat Q3 race-pace broken mile (light) | Sun rest. (Note Tue/Sat are 96h apart; Thu CV is aerobic, not anaerobic, so spacing holds.)

### 21.2 ENDURANCE-TYPE miler (needs speed: more R-pace, flat speed, lactate tolerance; hold volume)

**Base (4-day):** Mon rest | Tue Q1 R-pace 8 x 200m (economy) + strides | Wed easy + strides | Thu rest | Fri Q2 hill sprints 8 x 10s + easy | Sat long (at DEFAULT cap, not longer) | Sun easy.
**Base (5-day):** Mon easy + strides | Tue Q1 R-pace 8 to 10 x 200m | Wed easy | Thu Q2 hill sprints + CV 15 min | Fri easy + strides | Sat long | Sun rest.
**Support (6-day):** Mon easy + strides | Tue Q1 VO2 5 x 1000m at I | Wed easy + strides | Thu Q2 R-pace 6 x 300m (build the gear) | Fri easy | Sat long | Sun easy or rest.
**Specific (6-day):** Mon easy + strides | Tue Q1 special endurance 2 to 3 x 600m at goal (tolerance) | Wed easy | Thu Q2 flat speed 5 x 150m at R-or-faster (the gear) | Fri easy + strides | Sat Q3 race-pace 4 x 400m broken mile | Sun rest. (Tue special-endurance and Sat race-pace are 96h apart; Thu flat speed is short/CNS, placed 48h from Tue and 48h from Sat, all spacing rules satisfied.)

DEFAULT availability: if only 4 days, drop to 2 Q max and the long run; if 3 days, 2 Q (one combined with strides) + 1 long, no standalone easy. The Q cap by tier (Part 1 Section 2) always wins.

---

## 22. Projection depth (more worked examples, all unit-test-ready)

Constants (Part 1 Section 8): W_AERO mile/1500 = 0.75, 800 = 0.35, 3000 = 0.85; K_SPEED 400->mile = 1.07, ->800 = 1.05, ->1500 = 1.075, ->3000 = 1.085; CORR_CAP = 0.08.

### 22.1 High-mileage endurance-type vs low-mileage speed-type, same mile

- **High-mileage ENDURANCE-TYPE:** 16:30 5K (VDOT 62.3), weak 68s 400. Balanced 400 for VDOT 62.3 is 1:05.2, so 68s is ~3s slower than balanced -> mild endurance-type lean. mile_aero = 4:47.5; mile_speed (68s) = 5:01.6 (slower than aero); blend = 0.75*287.5 + 0.25*301.6 = 291.1s = **4:51.1** (the weak speed pulls it +3.5s slower than the aerobic prediction). Mile is SPEED-LIMITED: a strong engine with no top gear.
- **Low-mileage SPEED-TYPE:** 19:00 5K (VDOT 52.9), fast 53s 400. Balanced 400 is 1:14.8, so 53s is ~22s faster -> strong speed-type. mile_aero = 5:32.7; mile_speed (53s) = 3:55.1; blend = 0.75*332.7 + 0.25*235.1 = 308.3s = **5:08.3** (the speed reserve pulls it -24s faster than the aerobic prediction). Mile is ENDURANCE-LIMITED.

These two do NOT tie (4:51 vs 5:08) because the engine gap (VDOT 62 vs 53) is large. The speed-reserve correction is large for the speed type (-24s) and small for the endurance type (+3.5s); the correction dominates the speed type's projection and barely touches the endurance type's. That asymmetry is the model working: the mile is mostly aerobic, so speed reserve rescues a weak engine only so far (capped), while a missing gear costs a strong engine only a few seconds.

### 22.2 A genuine matched-mile pair (different routes, same time)

- **ENDURANCE-TYPE:** 17:18 5K (VDOT 59), 66s 400. mile_aero = 4:50.7, weak speed -> blend ~ **4:59.6**.
- **SPEED-TYPE:** 18:22 5K (VDOT 55), 53s 400. mile_aero = 5:21.6, big reserve -> blend ~ **4:59.7**.
Both land at ~5:00 by opposite routes (strong engine + weak gear vs modest engine + huge gear). Surface this in coaching: same goal, different limiter, different plan (the endurance type trains the gear, the speed type trains the engine).

### 22.3 Same athlete, 800 vs 1500 vs mile

Using the matched pair above, both project nearly identical times at every distance but by opposite splits:

| Athlete | 800 (aero/speed) | 1500 | Mile |
|---|---|---|---|
| ENDURANCE 17:18 + 66s | 2:18.3 (aero 2:21.4 / spd 2:16.7) | 4:37.9 | 4:59.6 |
| SPEED 18:22 + 53s | 2:18.3 (aero 2:30.3 / spd 1:49.7) | 4:37.9 | 4:59.7 |

Read: at 800 (W_AERO 0.35) the speed type's blend leans hard on the 1:49.7 speed term, the endurance type leans on the 2:21.4 aero term, and they meet at 2:18. At the mile (W_AERO 0.75) they meet again at ~5:00 but the speed type is now riding closer to its aerobic ceiling. The 800 is where the speed type has the most margin; the mile is where the endurance type is most comfortable.

### 22.4 Updating the projection mid-block (codeable sequence)

Athlete starts at 20:00 5K, no short PB:
1. Baseline: mile = 5:51.0, VDOT 49.8, LOW confidence (+/- ~20s), diagnosis defaults ENDURANCE-TYPE.
2. New 400 PB of 62s arrives: balanced 400 for VDOT 49.8 is 1:18.7, so 62s is much faster -> reclassify SPEED-TYPE. mile_speed (62s) = 4:33.7; blend = 0.75*351.0 + 0.25*273.7 = 331.6s = **5:32.0** (correction -19s). Confidence -> MEDIUM.
3. A key I-session (5 x 1000m) is run at 3:42/km with normal RPE, faster than the prescribed 3:50/km for VDOT 50. Back out implied vVO2max -> VDOT ~52.3 (5K-equiv ~19:12). Re-anchor: mile_aero now 5:33.0, blend with the 62s -> **5:21.0** (correction -15s). Confidence -> HIGH after a confirming session within 2 weeks.

The projection tightened from 5:51 (+/- 20s) to 5:21 (+/- 6s) over a block as speed data and a faster engine arrived, and the diagnosis flipped from default-endurance to confirmed-speed. The app should show this trajectory, not just the latest number.

### 22.5 How tactics shift the achievable time

On a runner whose even-pace optimal mile is 5:00.0 (300s):

| Tactic | Time | Delta | Who it suits |
|---|---|---|---|
| Even-pace (optimal) | 5:00.0 | baseline | ENDURANCE-TYPE, time-trial |
| Sit-and-kick, SPEED-TYPE | 5:01.2 | +0.4% | SPEED-TYPE (saves the gear, small cost) |
| Sit-and-kick, ENDURANCE-TYPE | 5:05.4 | +1.8% | poor fit (they have no kick to cash in) |
| Positive-split blowup (out too fast) | 5:10.5 | +3.5% | nobody, the amateur error |

Rule for the projection: report the even-pace optimal as the headline, but if the athlete is SPEED-TYPE note the achievable time may be ~equal with a sit-and-kick (their preferred race), and if ENDURANCE-TYPE warn that sit-and-kick costs ~2% and an even, honest pace is their best route. Flag positive-split risk for anyone who habitually fades (rep-fade data > 4%).

---

## 23. Proactive coaching (notice and message unprompted)

Each trigger: the data condition and the message intent. Tie every one to the diagnosis and the limiter, never generic.

| # | Trigger condition (data threshold) | Message intent |
|---|---|---|
| P1 | R-pace fade > 4% across a set, 2 sessions in a row | Speed-endurance gap surfacing; "your gear is there but you cannot hold it, we will build speed endurance." Cut reps, hold pace. |
| P2 | I or R sessions hit at RPE <= 6, felt-easy, 2+ sessions, TSB > -5 | Ready to sharpen / re-VDOT; "you are ahead of your paces, time to re-test and tighten." |
| P3 | A scheduled speed/quality block was missed (no quality logged in a phase that requires it) | Missed-block warning; "we skipped the speed work the mile needs, here is how we fold it back without stacking." |
| P4 | Tendon-niggle / sore-tag recurring after plyo or speed (2nd occurrence in 3 weeks) | Tendon-overload alert; "pull speed and plyo now, the Achilles is the season-ender." Refer if worsening. |
| P5 | Entering a Specific/speed phase with < the phase's base weeks completed | No-base warning; "we are sharpening on an unfinished base, injury and stall risk; add aerobic weeks first." |
| P6 | New race/TT PB OR a key session clearly faster than prescribed | Celebrate + re-anchor; "new fitness, updating your projection and paces." |
| P7 | Weeks-to-event hits the taper boundary | Peaking-timing prompt; "taper starts now, cut volume hard, keep sharpness." |
| P8 | Race within 7 days | Race-week checklist; warmup plan, tactic plan, kick rehearsal, no new sessions/spikes. |
| P9 | The speed-vs-endurance diagnosis flips (new short PB or session changes classification) | Limiter-shift notice; "your limiter changed from X to Y, the plan emphasis shifts accordingly." |
| P10 | Pace-at-fixed-HR improved >= 1.5% over a block with stable VDOT | Economy-gain attribution; "your engine is the same size but cheaper to run, that is economy, keep the strides and plyo." |
| P11 | RPE creep >= 2 points at fixed pace over 2 to 3 weeks, OR ACWR > 1.5 | Hidden-fatigue / overreach; "fatigue is accumulating, inserting a deload before it costs you." |
| P12 | Sharp window held > 8 weeks (Specific/competition phase running long without a refresh) | Peak-fade warning; "form dulls after the sharp window, we need a short volume refresh or to race the A-target soon." |
| P13 | Resting HR +7 bpm OR HRV -1SD OR sick-tag | Readiness alert; "signs of illness or deep fatigue, easy/rest until clear, returning at half quality." |
| P14 | High weekly volume, zero speed/strides logged (endurance-type trap) | Trap alert; "all engine, no gear, the mile will not improve on volume alone, adding speed." |
| P15 | All speed, base volume below tier floor (speed-type trap) | Reverse-trap alert; "all gear, no engine, you will fade in the back half, adding aerobic support." |

DEFAULT cadence: at most 1 proactive message per signal per week, highest-priority (injury/illness/overreach P4/P11/P12/P13) first, and never more than 2 unprompted messages in a single check so the coach does not nag.

---

## 24. Source attribution (additions to Part 1)

- Anaerobic Speed Reserve and 800m typology (Bellinger, Sandford, Bachero-Mena, Billat): the three-type 800 model, vVO2max testing, D' / anaerobic capacity.
- Renato Canova, Sebastian and Peter Coe: special endurance, lactate-tolerance vs clearance, the multi-pace structure.
- Marius Bakken / Norwegian method: double-threshold, scoped to endurance support only.
- Steve Magness, The Science of Running: running economy, neuromuscular development, the mental side.
- Tom "Tinman" Schwartz: critical velocity and D' two-point estimation.
- Tim Gabbett: acute:chronic workload ratio and the weighted-load guardrails.
- Jack Daniels, Arthur Lydiard, Frank Horwill: the pace system, periodization, and five-pace base as in Part 1.
- Sports-medicine consensus (RED-S, female-athlete triad, adolescent and masters training): Section 17, informational and refer-out, not diagnostic.

> Persona-scoping reminder: every factor table here (rep-fade thresholds, weighted-load and ACWR constants, the three-type 800 index, strength/plyo doses, weekly templates, projection constants) is scoped to the middle-distance persona ONLY. Do not let them leak into the 5K/10K, half, marathon, ultra, or triathlon personas, and do not import those personas' tables here.
