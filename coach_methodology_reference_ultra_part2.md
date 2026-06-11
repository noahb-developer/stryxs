# ULTRARUNNER METHODOLOGY, PART 2
## Persona: `ultra`. Adaptive adjustment, session scaling, weekly templates, projection depth, recovery, environment, strength, fueling periodization, special populations, proactive triggers
### Companion to Part 1. Same persona-scoping rule: nothing here feeds or borrows from the marathon, half-marathon, or short-run personas.

**Sources:** Koop, Moehl, Koerner, Roche, House & Johnston, Maffetone, Seiler, Friel, Magness/Marcora, Noakes, Minetti 2002, Gabbett (ACWR), Tiller et al. 2019 (IJSNEM ultra-nutrition position stand), Jeukendrup (multiple-transportable carbohydrates), Costa et al. (exercise-induced GI syndrome), Periard/Racinais (heat acclimation), Stellingwerff (female athlete and RED-S literature), Hoffman (WSER research), Millet (UTMB/fatigue research).

---

# SECTION 1: REVIEW OF PART 1, CORRECTIONS AND EXTENSIONS

## 1.1 CORRECTION UC1 (supersedes Part 1 Section 8.2 personalization line)
The Part 1 formula `60000 / (vertical_rate x 1.15)` computes TOTAL climbing time per 1000 m, not ADDED time, and must not be used. Replace with the calibrated linear form, anchored to the tier table:

**vert_add_per_1000m = clamp(75 - 0.05 x sustainable_vertical_rate_m_per_h, 25, 60)**

Unit-test anchors: rate 500 -> 50.0 (beginner), 700 -> 40.0 (intermediate DEFAULT), 850 -> 32.5, 900 -> 30.0 (advanced), 1000 -> 25 (clamp floor). Use the athlete's logged sustained vertical rate from training (best 20+ min continuous climb, averaged over the last 8 weeks) when available; otherwise the tier table stands.

## 1.2 Extensions and precision upgrades to Part 1
- **UC2 (odd-distance interpolation):** interpolate ULTRA_MULTIPLE linearly in km between the four table rows; beyond 161 km (e.g. 200MI), extrapolate at +0.0020 per km [intermediate], +0.0025 [beginner], +0.0016 [advanced], and force LOW confidence.
- **UC3 (first attempt at a distance):** stoppage time += 30 min for the athlete's first attempt at that distance class ([100MI+] only; smaller races: += 10). Inexperience shows up in chairs, not legs.
- **UC4 (night_fraction refinement):** DEFAULT 0.30 for [100MI+]. Optional one-pass refinement: project once with 0.30, compute actual dark hours from start time and projected duration (civil twilight +/- 30 min), recompute night_fraction, re-project once. Do not iterate further.
- **UC5 (km-logging guard):** when converting a km budget to hours, use the athlete's median easy-run pace ON THEIR TYPICAL TERRAIN from the last 28 days. Never marathon pace, never GAP.
- **UC6 (downhill GAP x terrain interplay):** the downhill pace multipliers in Part 1 Section 3.4 assume smooth footing. On technical descents multiply them by the terrain factor as well; net effect is that technical descents are SLOWER than flat (e.g. -10% technical: 0.90 x 1.12 = 1.01).
- **UC7 (no-HR athlete):** if no HR data exists anywhere, the persona runs fully on RPE + GAP. Drift-based rules (Section 2) switch to their pace-at-RPE forms automatically.
- **UC8 (cutoff-aware pacing):** when a race cutoff exists, generate the segment plan backward from cutoffs with a 10% buffer at each timing point [FIRST-FINISH DEFAULT]; surface any segment where the buffer falls below 5%.
- **UC9 (course-profile segmentation):** if a GPX/profile is available, run the projection per segment (each segment gets its own grade-driven pace via the GAP model, plus local terrain factor) and sum; the Part 1 whole-course layered model is the fallback when only totals are known. The two must agree within 5% on a uniform course; unit-test with a flat course (segments must reproduce flat_time exactly).

## 1.3 Topics Part 1 under-served, now covered here
Fueling and gut-training periodization (S9), downhill/DOMS management depth (S2, S8), heat and altitude protocols (S7), poles (S10.1), sleep and night-lows depth (S10.5), crew/pacer/drop-bags (S10.4), foot care (S10.2), mental skills (S10.3), RED-S depth (S11.1), female-athlete physiology (S11.2), masters (S11.3), backyard/timed depth and multi-day stage racing (S12), readiness thresholds (S6), strength season (S8), proactive triggers (S13).

---

# SECTION 2: ADAPTIVE ADJUSTMENT (rules UA1 to UA22)

Run this evaluation at the close of every training week, in the order listed; the FIRST matching rule in each block applies; multiple blocks can fire together but total weekly reduction is capped at the deload level (hours -35%, vert -50%) unless a red flag (2.6) forces full rest. All percentage cuts apply to NEXT week's planned values.

## 2.1 Long-run and drift signals
- **UA1 (drift on the long run):** HR drift (2nd-half avg HR / 1st-half avg HR at steady effort, as %) on a fueled Z2 long run > 2 h:
  - drift 5 to 8%: normal. No change.
  - drift 8 to 12%: hold long-run duration flat next week (no progression step) and check fueling/hydration log first; if fueling was < 40 g/h, fix fueling before blaming fitness.
  - drift > 12% on two consecutive long runs: cut next long run by 20% and insert an extra Z1 day; flag readiness review (S6).
  - DEFAULT drift threshold if data noisy: 10%.
  - No-HR fallback (UC7): pace-at-RPE fade > 8% in the back half at constant RPE = treat as the 8 to 12% band.
- **UA2 (long run missed):** do NOT stack it. Next week keeps its planned progression IF the miss was logistical (felt-tag absent) and the prior 2 weeks were green; otherwise repeat the missed duration. Never jump two progression steps to catch up.
- **UA3 (back-to-back missed):** never reschedule a B2B into the following week on top of that week's plan. Replace: next week runs the planned single long run + 60 min extra easy spread across the week; the B2B progression resumes at the SAME B2B size, not the next one. If 2 consecutive B2Bs are missed, drop one B2B from the block and extend the biggest one's date check (Part 1 UW12 timing must still hold).

## 2.2 Vert and descent signals
- **UA4 (weekly vert over cap):** actual vert > planned x 1.25 or vert-ACWR > 1.4: clamp next week's vert to the 4-week average (no ramp), keep hours as planned. Message intent: smooth the vert, do not reward the spike.
- **UA5 (weekly vert chronically under plan):** actual vert < 70% of planned for 2 consecutive weeks [TRAIL/MOUNTAIN goal]: do not ramp the number further; diagnose access (no hills? time?) and switch the vert session to the athlete's available substitute (treadmill incline, stairs) before changing targets. If 4 weeks under, re-run feasibility (Part 1 S10) with the realistic vert ceiling.
- **UA6 (quad DOMS after downhill work):** felt-tag sore or DOMS flag localized to quads lasting:
  - <= 48 h: expected adaptation early in the downhill block. Proceed.
  - 48 to 72 h: next downhill session at -30% descent volume, same grades. Back off DESCENT volume, never the climbing.
  - > 72 h or impaired walking: skip the next downhill session entirely, replace with gym eccentric at 50% load, push the following downhill session a week.
  - DOMS recurring > 72 h after the 4th+ downhill session: something is wrong (grade too steep, volume too high, or under-fueled); halve descent volume and add the strength block if absent.
- **UA7 (climb HR vs pace divergence):** on a repeated benchmark climb, HR at fixed GAP up > +5 bpm vs the 4-week norm with RPE also up: treat as fatigue (apply UA13); HR up with RPE normal: heat/caffeine/sleep artifact, log and watch.

## 2.3 Completion and subjective signals
- **UA8 (completion rate):** completed/planned sessions < 70% for the week: next week is auto-replanned at 85% of volume with the same key-session skeleton (long run first priority, quality second, fluff cut first). < 50% for 2 weeks: re-run feasibility and shrink the plan to the demonstrated budget; an honest 6 h plan beats a fictional 9 h plan.
- **UA9 (RPE creep):** average session RPE >= planned RPE + 1.5 across >= 3 sessions in the week: insert an early deload NOW (this overrides the 3:1 cadence position). DEFAULT creep threshold 1.5.
- **UA10 (felt-tags):** sick tag: zero intensity, zero vert sessions, Z1 only until 48 h symptom-free; below-neck symptoms or fever = full rest, reentry per Part 1 Rule UW5. sore (non-quad) 2+ sessions: swap next quality for easy. flat tag 3+ sessions in a week: check fueling adequacy and sleep BEFORE cutting load; if both fine, treat as UA13.
- **UA11 (sleep-reported lows):** athlete-reported sleep < 6 h for 3+ nights in-week: convert the week's quality session to easy; never schedule a B2B off a < 6 h sleep streak.

## 2.4 Load-model signals
- **UA12 (ACWR):** hours-ACWR > 1.3 OR vert-ACWR > 1.4 at week close: clamp next week to ACWR 1.0 to 1.1 (hours = chronic average). Two consecutive weeks over: forced absorb week (deload values).
- **UA13 (TSB floor):** TSB < -25 outside a planned overload week, or < -30 ever: next week at deload values; the planned progression shifts right by one week. TSB > +15 mid-Build (detraining drift): nudge volume +5% above plan or restore a cut session.
- **UA14 (CTL stagnation with high fatigue):** CTL flat or falling for 3 weeks while ATL high and completion >= 85%: classic absorption failure; force deload + readiness review; do NOT add volume to force CTL up.

## 2.5 Composite weekly decision (codeable order)
1. Red flags (2.6)? -> execute their response, stop.
2. UA10 sick? -> execute, stop.
3. UA12/UA13 load gates -> clamp.
4. UA1/UA6/UA9 fatigue cuts -> apply largest single cut only (no stacking beyond deload level).
5. UA2/UA3/UA5/UA8 completion logic -> adjust progression position.
6. UA4 vert clamp.
7. Otherwise: green week, apply planned ramp per Part 1 UW1 to UW3.

## 2.6 Overtraining / under-recovery / RED-S red flags

| Flag | Threshold (any one) | Response |
|---|---|---|
| Acute under-recovery | Resting HR +7 bpm above 28-day baseline for 3+ days; or HRV (rMSSD) > 10% below baseline 7-day average for 5+ days; or UA1 drift band 3 twice | 3 to 5 days Z1-only, re-test; resume one progression step back |
| Functional overreach hardening | TSB < -30 plus RPE creep plus performance down (benchmark climb or pace-at-HR worse > 5%) for 2+ weeks | 7 to 10 day regeneration block (50% volume, Z1, no vert sessions); then re-enter per UW5 |
| Overtraining suspicion | The above persisting > 3 weeks despite rest, sleep disturbance, mood collapse, HR suppression at effort | Stop structured training, recommend physician/sports-med consult; the app does not coach through this |
| RED-S risk | >= 10 h/wk plus any: intentional deficit, weight loss > 3% in a month, missed cycles, 2+ illnesses in 8 weeks, persistent low motivation + elevated RHR, stress-fracture history | Volume -30% immediately, fueling-adequacy messaging (S9.6, S11.1), recommend professional consult (sports dietitian/physician); suspend vert and intensity until energy intake addressed |

---

# SECTION 3: IN-SESSION STRUCTURE AND PHASE SCALING

Every workout-description string follows WU / MAIN / CD with explicit durations and effort targets. RPE always included so the session survives missing HR (UC7). Below, the three signature sessions are shown growing Base -> Build -> Peak; all other session types in Part 1 S4 keep their templates with the standard scaling rule: **volume scales with the phase, effort targets never do.**

## 3.1 Long run scaling (intermediate, [50MI/100K] goal, [TRAIL/MOUNTAIN])

| Phase | Template |
|---|---|
| Base | WU 10 min very easy. MAIN 2:00 to 2:30 Z2 (RPE 3 to 4) rolling terrain, hike > 16% grade, fuel 50 g/h from min 30. CD 5 min walk. |
| Build | WU 10 min very easy. MAIN 3:00 to 4:30 Z2 on race-similar terrain, 60 to 70% of the week's long-run vert here, hike > 16%, fuel 60 to 70 g/h, practice race flasks. CD 5 min walk + refuel within 30 min. |
| Peak | WU 10 min very easy. MAIN 4:30 to 5:30 (cap, Part 1 UW11) race-specific: race kit, race fueling 70 to 80 g/h, final 45 min at race effort (Z2, RPE 4), aid-station simulation every 75 min (90 s stop, full restock). CD 10 min walk, log GI score. |

## 3.2 Vert / climbing session scaling (intermediate, [TRAIL/MOUNTAIN])

| Phase | Template |
|---|---|
| Base | No dedicated session. Easy runs absorb 200 to 400 m/wk; 1 x/wk add 6 x 12 s steep hill sprints (RPE 9) with walk-down. |
| Build | WU 15 min easy + 4 strides. MAIN 5 to 8 x 4 min uphill at 8 to 12% grade, Z3 to low Z4 (RPE 6 to 7), alternate running and power-hiking within reps, easy jog/walk down. CD 10 min easy. Weekly. Treadmill sub: same reps at 10 to 12% incline, 0% jog between. Stair sub: minutes-for-minutes, two steps at a time for hike reps. |
| Peak | WU 15 min easy. MAIN 2 to 3 x 15 to 20 min sustained climb at race grades, race effort (Z2-Z3, RPE 4 to 5), poles if racing with poles, descend easy and SMOOTH as technique work. CD 10 min easy. Every 7 to 10 days. |

## 3.3 Downhill / eccentric session scaling (intermediate, [TRAIL/MOUNTAIN])

| Phase | Template |
|---|---|
| Base | Gym only: 2 x/wk eccentric primer inside the strength block (S8): 3 x 8 slow-eccentric (4 s down) squat or leg press + 2 x 10/leg step-downs. |
| Build (from mid-Build) | WU 15 min easy + climb easy to top. MAIN 3 to 5 x 3 to 5 min downhill at 6 to 10% smooth grade, strong-but-controlled (RPE 5 to 6), cadence > 170, hike back up easy. CD 10 min flat easy. Every 7 to 10 days. Expect DOMS after the first 2; apply UA6. Decline-treadmill sub: -3 to -6%, same structure. No decline available: double the gym eccentric volume and add 10 x 40 cm box step-downs/leg, 3 s lowering. |
| Peak | WU as above. MAIN 4 to 6 x 5 to 8 min downhill at race grades and race technicality, committed effort (RPE 6), focus line choice + braking-free form. CD 10 min easy. LAST one >= 14 days pre-race (Part 1 S6.2). |

## 3.4 [ROAD/FLAT] signature scaling note
Replace 3.2 with the rhythm progression: Base 20 to 30 min Z3 continuous; Build 2 to 3 x 20 min Z3 with 5 min float; Peak 60 to 90 min at race effort inside the long run. Replace 3.3 with the gym eccentric block at half the trail dose (durability still matters; the road pounds).

---

# SECTION 4: WEEKLY TEMPLATES (spacing rules baked in)

Abbreviations: LR long run, ML medium-long, B2B back-to-back pair, VERT climbing session, DH downhill session, PH power-hike, TT tempo/threshold, EZ easy Z1-Z2, ST strides, REST full rest. Strength (S8) attaches to EZ days, never the day before LR/B2B. All templates obey: REST after B2B; DH never within 3 days before B2B; quality never the day before LR (except advanced); 1+ full REST/wk.

## 4.1 [TRAIL/MOUNTAIN]

**4-day athlete**

| Day | Base | Build | Peak |
|---|---|---|---|
| Mon | REST | REST | REST |
| Tue | EZ 60 + ST | VERT | VERT (race grades) |
| Wed | REST | REST | REST |
| Thu | EZ 60 (hills in route) | EZ 60 or DH (alt weeks) | EZ 60 or DH (alt weeks, last DH >= 14 d out) |
| Fri | REST | REST | REST |
| Sat | LR 2 to 2.5 h | LR 3 to 4 h | LR/B2B day 1 (B2B replaces Sun EZ every 2nd wk) |
| Sun | EZ 45 | EZ 60 or ML 1.5 h (B2B-lite every 3rd wk) | B2B day 2 (60% of Sat) or REST |

**5-day athlete (DEFAULT)**

| Day | Base | Build | Peak |
|---|---|---|---|
| Mon | REST | REST | REST |
| Tue | EZ 60 + hill sprints | VERT | VERT (sustained climbs) |
| Wed | EZ 60 + ST | EZ 60 + ST | EZ 60 |
| Thu | EZ 75 rolling | DH (from mid-Build) or PH | PH 60 to 90 or DH (alt) |
| Fri | REST | REST or EZ 30 Z1 | REST |
| Sat | LR 2.5 h | LR 3.5 to 4.5 h / B2B d1 every 3rd wk | B2B d1 every 2nd wk |
| Sun | EZ 45 | EZ 60 / B2B d2 | B2B d2 (strict Z1-Z2) or EZ 45 |

**6-day athlete (advanced)**

| Day | Base | Build | Peak |
|---|---|---|---|
| Mon | REST | REST | REST |
| Tue | VERT-flavored EZ 75 | VERT | VERT |
| Wed | EZ 60 + ST | EZ 75 | EZ 60 + ST |
| Thu | EZ 60 | DH | DH or PH (alt; last DH >= 14 d out) |
| Fri | EZ 45 Z1 | EZ 45 Z1 | EZ 30 to 45 Z1 |
| Sat | LR 3 h | B2B d1 | B2B d1 |
| Sun | EZ 60 | B2B d2 | B2B d2 |

## 4.2 [ROAD/FLAT]

**4-day:** Tue TT, Thu EZ 60 + ST, Sat LR (metronomic Z2, fueling rehearsal), Sun EZ 45 or ML every 3rd wk (Build/Peak); Mon/Wed/Fri REST. Peak: Sat LR includes 60 to 90 min race effort.
**5-day:** add Wed EZ 60; Thu becomes gym-eccentric + EZ 45 in Build/Peak.
**6-day:** add Fri EZ 30 to 45 Z1; B2B (Sat LR + Sun ML at 60%) every 2nd wk in Peak for [50MI+ road], every 3rd in Build.
[TIMED/BACKYARD]: substitute the Peak Sat LR with the rhythm session (Part 1 S4.13) every 2nd week.

---

# SECTION 5: PROJECTION DEPTH (worked examples C to F, all numbers verified)

Engine and tables per Part 1 S8 plus corrections UC1 to UC4. All arithmetic below is exact for unit tests.

## 5.1 Example C: flatlander with a fast PB vs a mountain 100K
Athlete: marathon PB 2:55 (175.0 min, pace 4.147 min/km), intermediate ultra tier, longest run 3.0 h, weekly vert 150 m. Race: 100K, 4000 m gain, 4000 m descent, technical trail (factor 1.12, descent class technical 10/1000).
1. base_pace = 4.147 x 1.24 = 5.142 min/km; flat_time = 514.3 min
2. vert_add = 4.0 x 40 = 160.0; descent_add = 4.0 x 10 = 40.0
3. moving = (514.3 + 160.0 + 40.0) x 1.12 = 800.0 min
4. stoppage 35 -> finish = 835.0 min = **13 h 55**
5. Penalties: vert_ready = 150 / (0.30 x 4000) = 0.125 < 0.5 -> x1.12. longest_run_ratio = 3.0 / 13.92 = 0.216; deficit vs 0.35 = 0.134 -> 2 steps -> x1.0816. Combined 1.2114 (under 1.25 cap) -> **penalized 1011.5 min = 16 h 52**.
6. Confidence LOW (heavy penalties): +/- 25% on the base.
Teaching point the coach must surface: the same engine on a FLAT 100K gives 514.3 + 35 = 549.3 min = 9 h 09. The mountain layers and unpreparedness add ~7 h 43, i.e. 46% of the final number. The marathon PB is nearly irrelevant; vert and descending readiness dominate.

## 5.2 Example D: mountain specialist vs faster-PB flatlander, same technical 50K
Race: 50K, 2500 m gain/descent, very technical (factor 1.20, descent technical 10/1000).
**Mountain runner:** PB 3:50 (230.0 min, pace 5.451), advanced tier, logged vertical rate 850 m/h -> UC1 vert_add = 75 - 42.5 = 32.5.
base_pace = 5.451 x 1.06 = 5.778; flat = 288.9; vert_add = 2.5 x 32.5 = 81.3; descent = 25.0; moving = 395.2 x 1.20 = 474.2; stoppage 6 -> **480.2 min = 8 h 00**, no penalties, confidence HIGH +/- 10%.
**Flatlander (Example C athlete):** base_pace = 4.147 x 1.08 = 4.479; flat = 224.0; vert 2.5 x 40 = 100.0; descent 25.0; moving = 349.0 x 1.20 = 418.8; stoppage 12 -> 430.8 min = 7 h 11 unpenalized. Penalties: vert_ready 150/750 = 0.20 -> x1.12; longest_run_ratio 3.0/7.18 = 0.418, deficit vs 0.55 = 0.132 -> 2 steps x1.0816; combined x1.2114 -> **521.8 min = 8 h 42**.
The 55-min-faster marathoner projects 42 min SLOWER on this course at current training. This asymmetry is the core lesson of the persona.

## 5.3 Example E: mid-block projection update
The Part 1 Example B athlete (3:30 PB, 100K, 3500 m technical, base 922.2 min) after 6 more weeks: longest run 4.0 -> 5.5 h, weekly vert 600 -> 1100 m.
Recompute penalties only (base layers unchanged): longest_run_ratio = 5.5 / 15.37 = 0.358 >= 0.35 -> no penalty. vert_ready = 1100 / 1050 = 1.048 >= 1 -> no penalty. Projection moves from 16 h 47 (penalized) to **15 h 22 clean**; confidence upgrades LOW -> MEDIUM (>= 8 weeks logged, fresh PB), range +/- 18% = 12 h 36 to 18 h 08.
**Update cadence rule UP-ENGINE:** re-run the projection after every completed week; surface it to the athlete only when (a) the headline moves >= 3%, (b) a penalty appears/disappears, or (c) confidence changes. Penalties always recompute from the rolling peak-4-week data, never from plan intentions.

## 5.4 Example: smooth vs technical 50K, same runner (terrain isolation)
Part 1 Example A athlete (3:30, intermediate) on the SAME 50K/1500 m course in two finishes of terrain: smooth (1.05, descent 0) = 357.2 min = 5 h 57. Technical (1.20, descent 10/1000): moving = (268.8 + 60.0 + 15.0) x 1.20 = 412.6; + 12 = **424.6 min = 7 h 05**. Terrain class alone is worth 67 min on a 50K. Never project a trail race without a terrain class; if unknown, DEFAULT 1.08 and say so in the range.

## 5.5 Example F: first 100-miler with night section
Athlete: the 3:30 intermediate, now with a 100K finish (prerequisite met). Race: 100MI (160.934 km), 5000 m gain/descent, moderate trail (1.08, descent 5/1000), 05:00 start, cutoff 32 h. Training at peak: 6 h longest run, B2B 6+4 h, peak-week vert 1500 m, fueled runs logged.
1. base_pace = 4.977 x 1.45 = 7.217; flat = 1161.4
2. vert_add = 5.0 x 40 = 200.0; descent_add = 5.0 x 5 = 25.0
3. moving = 1386.4 x 1.08 = 1497.3
4. night_add = 1497.3 x 0.12 (first 100) x 0.30 = 53.9
5. stoppage = 90 + 30 (UC3 first attempt) = 120
6. finish = **1671.2 min = 27 h 51**
7. Penalties: B2B combined ratio = 10 / 27.85 = 0.359 >= 0.33 (OR-path) -> none. vert_ready = 1500/1500 = 1.0 -> none.
8. Confidence: always LOW for a first 100: +/- 25% -> **20 h 53 to 34 h 49**.
9. Cutoff check: slow end 34 h 49 > 32 h cutoff. Mandatory plain statement: the projection's slow tail misses the cutoff; pacing plan is built backward from cutoffs (UC8) and finish_score (Part 1 S8.10) is presented as the headline, with the named buffer at each timing point.

---

# SECTION 6: RECOVERY & READINESS

## 6.1 Morning-data thresholds (when wearable data exists)

| Signal | Green | Amber (act: convert quality to EZ) | Red (act: rest day now) | DEFAULT baseline window |
|---|---|---|---|---|
| Resting HR | within +/- 3 bpm of baseline | +4 to +6 bpm for 2+ days | +7 bpm 3+ days | 28-day rolling |
| HRV (rMSSD, 7-day avg) | within 1 SD | -5 to -10% of baseline | > -10% for 5+ days | 28-day rolling |
| Sleep | >= 7 h | 6 to 7 h repeated | < 6 h x 3 nights (UA11) | self-report ok |
| Mood/motivation tag | normal | low x 2 days | low x 4+ days with RHR amber | n/a |

Rule: ONE amber = train but downgrade; TWO ambers same day = Z1 only; any red = rest and apply S2.6 screen.

## 6.2 Training-data proxies (no wearable)
- HR at fixed effort: benchmark easy loop HR +5 bpm at same GAP pace for 3+ runs = amber.
- Pace-at-HR drift: median Z2 GAP pace slower by > 4% over 2 weeks at same HR = amber; > 7% = red.
- RPE creep per UA9. TSB per UA13. Cumulative: 2 ambers across proxies in one week = early deload.

## 6.3 Eccentric/muscular recovery after big downhill or B2B days
Quad DOMS timecourse: peak 24 to 48 h, resolved by 72 h when adapted. Programming: no intensity within 48 h after a DH session or B2B; flat Z1 only; strength lower-body waits 72 h. DOMS > 72 h triggers UA6. After the SEASON's biggest B2B, schedule 2 full recovery days (one REST, one 30 min Z1 walk/jog). Post-race: no running 1 day per 10 race-km as an upper bound guideline (50K ~5 easy days, 100MI 2 to 3 weeks before structure), reverse-taper reentry at Z1.

## 6.4 Unplanned-rest insertion (hard thresholds)
Insert an immediate unplanned rest day when ANY of: red row in 6.1; UA1 band 3; quads impair stairs descent; athlete reports illness below the neck; TSB < -30. Pull the week back to deload when: 2+ ambers, RPE creep, or completion < 70% with high RPE. The app states which datum triggered it (transparency builds trust in the coach).

---

# SECTION 7: ENVIRONMENT & LOGISTICS

## 7.1 Heat acclimation protocol
Trigger: forecast race-day high > 27 C (or humid > 24 C) AND athlete's last 4 weeks contain < 5 heat-exposed sessions.

| Parameter | Prescription | DEFAULT |
|---|---|---|
| Window | 10 to 14 consecutive days, ending 2 to 3 days pre-race | 14 days |
| Active sessions | 5 to 8 sessions of 60 to 90 min Z1-Z2 in the heat (or overdressed) | 6 |
| Passive option | post-run sauna 20 to 30 min at 70 to 90 C, 4 to 6 x/wk, or 40 C bath 30 to 40 min | sauna 25 min x 5/wk |
| Effort control | by HR/RPE, never pace; expect pace 20 to 40 s/km slower at same HR initially | |
| Adaptation markers | plasma volume day 4 to 7, sweat-rate and sodium adaptations day 7 to 14 | |
| Race-day offset (un- or partially acclimated) | slow projected pace 1% per degree C above 18 C effective temp, cap 10% (Part 1 S9.9); halve the offset when fully acclimated | |
| Decay | meaningful loss in 7 days without exposure; top up every 2 to 3 days | |

## 7.2 Altitude
- Race 1500 to 2500 m: arrive < 24 h before OR >= 5 days; pace penalty ~2 to 3% per 1000 m above 1500 m (Part 1 S9.9), HR runs higher at fixed pace for days 2 to 5 so cap by RPE.
- Race > 2500 m: >= 10 days on-site ideal; if impossible, arrive < 24 h and start one effort notch easier for the first quarter. Hydration +0.5 L/day, expect sleep degradation first 3 nights.
- Never schedule quality in the first 72 h at altitude.

## 7.3 Cold / wet / night conditions
- Cold: layer rule (start cold, carry shell); pace effect minimal until < -5 C; fueling note: gels harden, carry inside layers; fluids warm.
- Wet/mud: terrain factor effectively +1 class for projection on race day (surface the adjustment, do not silently change the number); foot care kit mandatory (S10.2); spare socks in drop bags.
- Night: lighting per Part 1 S7.4; pace expectation -10 to -20% on technical trail in the dark; pre-dawn cold snap is when DNF decisions spike, add a layer BEFORE the 2 to 5 a.m. window.

## 7.4 Event-week + race-morning checklist (the app renders this as the race plan)
- T-7 to T-3: sleep bank (Part 1 S6.3); gear shakeout run in full kit; drop-bag map and crew sheet finalized; carbo-load plan written (8 to 10 g/kg final 48 to 72 h, low fiber last 36 h).
- T-2: biggest sleep night; bags packed per-station (S10.4); charge devices, lamp batteries.
- T-1: 20 to 30 min Z1 + 4 strides; no new anything; early dinner, familiar food.
- Race morning: wake 2.5 to 3 h out; breakfast 2 to 4 g/kg carbs 3 h out (DEFAULT 2.5 g/kg), 500 ml fluid + electrolytes sipped; 20 to 30 g carbs in the final 15 min; sunscreen/lube/tape per S10.2.
- Plan card (auto-generated per athlete): effort caps by segment (Part 1 S7.1), run/hike grades by segment (UZ1 + course profile), carbs/h and sodium/h targets with WHAT (named products from training), aid-station in/out budgets, crew/pacer meet points, cutoff buffer table (UC8), lows protocol one-liner, mantra field (S10.3).

---

# SECTION 8: STRENGTH & DURABILITY SEASON (2 x/wk Base/Build, 1 x/wk Peak, 0 in race week)

| Block | Weeks | Sets x reps (load) | Exercises (the ultra core) |
|---|---|---|---|
| Anatomical adaptation (early Base) | 3 to 4 | 2 to 3 x 12 to 15 (light, RPE 5) | Goblet squat, single-leg RDL, step-up, calf raise straight + bent knee, side plank, bird-dog, banded ankle eversion |
| Max strength (late Base to early Build) | 4 to 6 | 3 to 4 x 4 to 6 (heavy, RPE 8) | Back squat or trap-bar DL, Bulgarian split squat, heavy calf raise, weighted step-up, pallof press, farmer carry |
| Eccentric/durability (Build) | 4 to 6 | 3 x 6 to 8 with 3 to 5 s lowering (moderate) | Slow-eccentric squat or leg press, 40 cm box step-DOWNS 3 x 10/leg, Nordic curl regressions 2 x 5, decline-board calf eccentrics, suitcase carry |
| Power/maintenance (Peak) | 3 to 5 | 2 x 5 (moderate, fast intent) + 1 eccentric touch | Jump squat or hill sprints (counts), step-downs 2 x 8, calf eccentrics, trunk circuit |
| Taper | race - 14 d to race | bodyweight circuit 1 x/wk, none final 7 days | mobility + activation only |

Injury-prevention essentials (daily 10 min, all phases): calf eccentrics (Achilles), hip-abductor work: side-lying leg raise or banded walk (ITB/knee), foot intrinsics: short-foot + toe yoga (technical terrain, plantar), couch stretch + hip flexor (low back, late-race posture), thoracic extension (pack/vest posture). Trunk endurance, not max: late-race form collapse is a trunk-endurance failure: 2 x/wk planks/carries to 60 to 90 s holds.

---

# SECTION 9: FUELING & GUT-TRAINING PERIODIZATION (first-class program)

## 9.1 The carbs/h progression (the gut is trained like a muscle)

| Block | Weeks from start | Long-run target g/h | Notes |
|---|---|---|---|
| Baseline | 1 to 2 | 40 to 50 | Any product; establish the GI log (1 to 5 score per fueled run) |
| Ramp 1 | 3 to 5 | 60 | Single-source carbs fine up to here |
| Ramp 2 | 6 to 8 | 70 to 80 | Switch to 2:1 glucose:fructose products above 60 g/h (absorption ceiling of glucose alone ~60 g/h) |
| Ramp 3 (PERFORMANCE) | 9 to 12 | 90 (advanced gut: 100 to 120) | Only while GI scores <= 3; hold one step on two consecutive >= 4 (Part 1 S4.11) |
| Race-spec | Peak | race-plan g/h locked, exact products | Race g/h <= trained g/h + 10 (Part 1 S9 rule 5) |

DEFAULT race targets: [50K] 70 g/h, [50MI/100K] 75 g/h, [100MI+] 70 g/h with 20 to 40% real-food calories after hour 4 to 6. Train the race breakfast too (rehearse before the 3 biggest long runs).

## 9.2 Within-run mechanics
Feed every 20 to 25 min, not hourly boluses. Fluids separate from carbs accounting (a 250 ml flask of 40 g mix = both). Sodium per Part 1 S7.2; heavy sweaters (salt-crusted kit) start at 800 mg/h in heat. Caffeine periodization: rehearse race doses on 2 Peak long runs.

## 9.3 Daily fueling around training (RED-S prevention arm)
Training days >= 2 h: carbs 6 to 8 g/kg/day; biggest weeks 8 to 10. Protein 1.6 to 2.0 g/kg/day, 25 to 30 g within 60 min post-session and at each meal (masters: top of range). Never run > 90 min fully fasted in Build/Peak; "train-low" is an advanced, occasional Base tool (max 1 x/wk, easy sessions only) and is banned for athletes with any RED-S flag or for female athletes with cycle disruption.

## 9.4 GI-distress troubleshooting tree (encode as coach logic)
Recurring GI score >= 4: check in order: (1) g/h too high for current gut: drop one ramp step; (2) fluid mismatch: concentrated feeds need 400+ ml/h water; (3) fiber/fat in pre-run meal: strip it; (4) heat (gut ischemia): cut g/h 20% in heat and use liquid carbs; (5) NSAID use: stop it (GI + kidney risk in ultras, hard rule: no prophylactic NSAIDs in races); (6) persists: refer out.

---

# SECTION 10: CRAFT TOPICS

## 10.1 Poles
Pay off when: course > 2500 m vert or sustained grades > 15% [DEFAULT: recommend above 3000 m total vert], or quad-protection priority [100MI+]. Cost: hands occupied (fueling friction), 200 to 300 g, banned at some US races (check). Technique dose: >= 6 sessions before racing with them; plant rhythm on climbs (double-pole on steps, alternating on grades), descents: shorten or stow (most time lost by descending with flailing poles). Sizing: elbow at 90 degrees on flat. Expected benefit when trained: ~5 to 10% vertical-rate gain on steep sustained climbs, meaningful quad sparing on descents used as brakes-assist [advanced technique].

## 10.2 Foot care / blister / chafing
Pre-race: nails trimmed T-3, callus filed, lube (toes, heels, anywhere that has EVER hotspotted), tape known hotspots (kinesio or Leukotape, applied to clean dry skin). Shoes: [100MI+] half-size up; gaiters on dusty/scree courses. In-race rule: a hotspot is fixed AT THE NEXT AID, never "after this section" (5 min now saves an hour of hobbling). Kit (drop bags + crew): tape, lube sachets, needle (drain blisters at the edge, keep roof on, tape over), 2 spare sock pairs, [100MI+] 1 spare shoe pair at the major crew point. Wet courses: re-lube + dry socks every major aid; trench-foot risk after ~8 h wet. Chafe points: nipples (tape, men), inner thigh, sports-bra lines, vest rub: lube at every drop bag.

## 10.3 Mental skills (trainable, scheduled)
- Segmentation: race = aid-to-aid chunks only; in training, rehearse on every Peak long run ("next 40 min" focus blocks).
- Lows protocol memorized (Part 1 S7.4): calories, caffeine, temperature, sodium, sleep, in order, 20 to 30 min patience. Teach: ALL lows pass; most DNF decisions made in a low are regretted; rule: never quit at night, never quit uphill, never quit without sitting 10 min and eating first (drop only at a crewed aid after the checklist).
- Mantra + reset routine: 3-breath reset, posture cue, next-aid focus. Stored in the race plan card.
- Rehearsed adversity: one Peak long run deliberately in bad weather or at low motivation (the "show-up rep").
- Pre-race anxiety reframe: taper anxiety is glycogen + rest expressing itself; surface UP15 (S13).

## 10.4 Crew, pacer, drop-bag strategy
- Crew plan: per-station sheet: ETA window (from the segment projection UC9), in/out budget, the 4 things to hand over, the 2 questions to ask (eating? peeing?), no open-ended chat; crew NEVER asks "how do you feel".
- Pacers [100MI+ where legal]: from 50 to 100 km point onward; pacer brief: own the fueling clock (feed every 25 min), own navigation, talk only as wanted, manage lows by protocol, never let the athlete sit > 5 min unplanned.
- Drop bags: one per 25 to 35 km without crew [DEFAULT every ~30 km]; contents tiered: every bag (fuel block for the next segment, sock pair, lube, tape), night bag (lamp #2 + batteries, layer), major bag (shoes, full kit swap, treat food). Label race rules compliant.

## 10.5 Sleep deprivation and the night, deeper [100MI+]
Performance dip is circadian, worst 02:00 to 06:00 even without sleep debt; plan the slowest splits there, not at the distance midpoint. Caffeine: hold a reserve for the circadian trough (Part 1 S7.2 caps). Micro-sleep decision table: sway/weaving or hallucinations + > 24 h awake -> 10 to 20 min dirt nap at next crewed aid (alarm + crew wake, wrap warm); 2nd night races: planned 20 to 90 min sleeps at major aids BEFORE collapse, guarded by cutoff math (UC8). Hallucinations are benign and normal beyond hour 24; pre-brief the athlete so they do not frighten themselves.

---

# SECTION 11: SPECIAL POPULATIONS

## 11.1 RED-S / underfueling depth
High-volume ultra blocks are the highest-risk window in running. Screen monthly during >= 10 h/wk blocks: weight trend, cycle status, illness count, sleep quality, motivation, RHR trend, any fasted-training creep. Two+ amber answers = the S2.6 RED-S response. Coach language: performance framing (underfueling makes you slower and breakable), never body framing. The app NEVER prescribes a calorie deficit inside Build/Peak, full stop.

## 11.2 Female-athlete physiology (opt-in adjustments, DEFAULT = no adjustment)
Evidence is heterogeneous; individual tracking beats population rules. If the athlete opts into cycle-aware coaching: log phase + symptoms 4+ weeks before adjusting anything; then permissible adjustments: schedule the biggest B2B/long runs flexibly around the 1 to 2 highest-symptom days (swap days, not volume); late-luteal phase: slightly elevated core temp and RHR are NORMAL (do not fire S6.1 ambers off a phase shift: baseline by phase when data allows); heat: thermoregulation marginally stressed late-luteal, weight heat protocols there; GI symptoms more common around menses: schedule gut-ramp steps elsewhere; iron: recommend ferritin screening 2 x/yr (high prevalence in endurance women); hormonal contraception flattens cycling effects (then ignore phase logic). Missed cycles = RED-S red flag, never "normal for runners". Pregnancy/postpartum: out of persona scope, refer to professional guidance.

## 11.3 Masters (>= 50)
Per Part 1: 2:1 deloads, beginner ramp caps, mandatory strength. Add: recovery between quality/eccentric stimuli 72 h+ (one DH or VERT per week, alternate); durability advantage is real (masters excel at ultra relative to short distance, lean into Z2 volume); protein 2.0 g/kg/day; heat acclimation takes the full 14 days; projection: add +1% per year over 55 to base_pace if no recent PB anchors it (PB-anchored projections need no age term).

---

# SECTION 12: [TIMED/BACKYARD] AND MULTI-DAY DEPTH

## 12.1 Backyard ultra strategy numbers
Loop 6.706 km / 60 min. Target loop time 42 to 48 min (DEFAULT 45): faster wastes nothing but recovery time exists for a reason; slower than 50 erodes the reset routine. Reset routine fixed order (eat 200 to 300 kcal, drink, sit with feet up, kit fix, stand at 3 min warning). Hourly carbs ~60 to 70 g equivalents across loop + reset. Projection: failure hour = the hour at which required moving pace exceeds projected sustainable pace; estimate sustainable pace at hour H as base_pace x (1 + 0.012 x H) [intermediate DEFAULT, 0.016 beginner, 0.009 advanced]; the athlete's yard total = first H where loop pace required (6.706 km in <= 52 min moving) is breached, minus 1 for routine margin. Night loops: -10% pace expectation, bank the buffer earlier.
Worked check: 3:30 marathoner (4.977 min/km flat ultra-base 50K-mult pace 5.375): hour H pace = 5.375 x (1 + 0.012H); loop needs <= 7.754 min/km moving (52 min). Breach when 5.375(1+0.012H) > 7.754 -> H > 36.9 -> projected 35 to 36 yards (~241 km), LOW confidence +/- 25%.

## 12.2 24 h / 12 h
Even-pace by GAP/HR is everything; run/walk from minute 1 (DEFAULT 25/5); pee/eat on the walk breaks; lap-distance projection = sustainable pace model above integrated over hours with stoppage 4 min/h [DEFAULT]; racing decisions only in the final 20% of the clock.

## 12.3 Multi-day stage races
Daily recovery hierarchy: 30 min post-stage carbs+protein (1 g/kg carb + 0.4 g/kg protein), feet dried and treated before camp chores, elevate legs, sleep maximized (earplugs/mask in kit). Pacing: stage 1 at RPE - 1 from instinct (everyone overcooks stage 1); cumulative-fatigue model: expect pace-at-HR to fade 2 to 4%/stage; plan effort caps accordingly. Kit mass matters per Minetti (every kg costs ~1% climbing speed): ruthless pack audit. Training divergence: B2B blocks extend to 3-day clusters in Peak (e.g. 4 h + 3 h + 2.5 h) under the same Part 1 ramp caps; one fully-loaded-pack long run per 2 weeks in Build/Peak.

---

# SECTION 13: PROACTIVE COACHING TRIGGERS (UP1 to UP18)

Evaluated continuously off live data; each fires at most once per cooldown window; message intent given, copy written in the coach voice (no em-dashes, direct, kind, truthful).

| ID | Trigger condition (data threshold) | Intent | Cooldown |
|---|---|---|---|
| UP1 | Long-run HR drift > 10% twice in 3 weeks | Flag aerobic-durability gap; check fueling first; propose UA1 action | 21 d |
| UP2 | Peak-4-wk avg weekly vert < 40% of the Rule UW13 target with <= 10 weeks to race [TRAIL/MOUNTAIN] | Vert gap warning + the exact weekly ramp that still closes it (or feasibility re-run) | 14 d |
| UP3 | 2 consecutive B2Bs missed | Explain why B2Bs are the race simulator; offer the UA3 restructure; ask one targeted question about the blocker | 21 d |
| UP4 | Quad DOMS tag > 72 h after 2 different DH sessions | Back off descent volume per UA6; reassure adaptation timeline (4 to 6 exposures) | 14 d |
| UP5 | 3 long runs > 2.5 h logged with no fueling data or g/h < 40 | Gut-training pitch with the S9.1 ramp; GI failure is the #1 ultra DNF cause | 21 d |
| UP6 | Hours-ACWR > 1.3 or vert-ACWR > 1.4 this week | Spike warning + next week's clamped numbers (UA12), framed as protecting the goal | 7 d |
| UP7 | New duration PB (longest run) or vert-week PB completed | Celebrate + tie to projection movement (S5.3) | none |
| UP8 | Projection headline moved >= 3% or confidence level changed | Share updated projection with the named driver | 7 d |
| UP9 | Race < 21 d and forecast > 27 C with < 5 heat sessions logged | Heat protocol offer (S7.1) sized to remaining days + race-day offset honesty | once |
| UP10 | Race altitude > 1500 m above athlete's training altitude | Arrival-timing advice (S7.2) + effort-cap note | once |
| UP11 | TSB < -25 unplanned, or 2+ S6.1 ambers in a week | Early-deload proposal with the exact datum cited | 10 d |
| UP12 | Completion < 70% for 2 weeks | Replan offer at demonstrated volume (UA8); zero guilt framing | 14 d |
| UP13 | sick tag logged | Reentry plan per UW5 queued automatically; tell them it is queued | per illness |
| UP14 | First downhill session scheduled this week | Pre-brief DOMS expectation so soreness is not read as injury | once/block |
| UP15 | Taper week 1 begins | Taper-anxiety pre-brief: phantom pains and restlessness are normal; trust the math; sleep bank starts now | once |
| UP16 | Race week | Deliver the S7.4 plan card; confirm drop-bag/crew sheet | once |
| UP17 | RED-S screen: 2+ amber answers (S11.1) | Private, caring, performance-framed message + volume action + professional-referral suggestion | immediate, no cooldown |
| UP18 | Post-race +3 d | Recovery reverse-taper plan (S6.3), congratulate, schedule the debrief that feeds next cycle's tiers and rates | once |

---

**End of Part 2. All Section 5 numbers are computed and internally consistent with Part 1 plus corrections UC1 to UC4 for unit testing. Persona scoping rule stands: `ultra` tables stay in `ultra`.**
