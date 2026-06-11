# Stryxs Strength & Conditioning Methodology, Part C: Extensions and Missing Topics

Companion to Part A (warm-up/cool-down) and Part B (strength). Section C1 corrects and extends Parts A-B. Sections C2-C9 are whole topics a great endurance coach must own that were not in the original brief.
New sources used here: Rio et al. 2015 (isometrics and tendon pain analgesia), Kongsgaard et al. 2009 and Beyer et al. 2015 (heavy slow resistance), Silbernagel et al. 2007 (pain-monitoring model), Warden et al. 2014 and Hoenig et al. 2022 (bone stress injuries), Milewski et al. 2014 and Mah et al. 2011 (sleep), Malisoux et al. 2015 (footwear rotation), Lauersen et al. 2014 (stretching arm: no injury-risk reduction), Weppler & Magnusson 2010 (stretch tolerance), Wiewelhove et al. 2019 (foam rolling meta), McNulty et al. 2020 (menstrual cycle meta), Watson et al. 2018 + LIFTMOR trial (female bone loading), Lloyd & Faigenbaum 2014 (youth resistance training position statement), Goom, Donnelly & Brockwell 2019 (postpartum return to running), Moore et al. 2015 (protein in masters).

House rules unchanged: tiers B/I/A with a DEFAULT everywhere, one-line movements, zero/minimal equipment first, no em-dashes.

---

## C1. Corrections and precision upgrades to Parts A and B

**C1.1 Tendon-pain exception to the global 3/10 rule (important).** The global rule (train only if pain ≤3/10, not worsening, settles in 24 h) stays for joints, bone, and muscle. For TENDON rehab loading specifically (Achilles, patellar, gluteal, proximal hamstring, plantar), pain during the prescribed loading exercises up to 4-5/10 is acceptable and expected, PROVIDED it returns to baseline by the next morning (Silbernagel pain-monitoring model). Running/riding on the tendon still obeys the 3/10 rule. Encode as: `pain_cap_activity = 3`, `pain_cap_rehab_loading = 5`, `morning_after_rule = true`.

**C1.2 RPE to %1RM anchor table** (for athletes who know their numbers; app prescribes RPE):
| RPE | Reps in reserve | ~%1RM at 5 reps |
|---|---|---|
| 6 | 4 | 70% |
| 7 | 3 | 75-78% |
| 8 | 2 | 80-84% |
| 9 | 1 | 85-88% |

**C1.3 Tempo notation.** Where a slow phase matters, write it as down-pause-up seconds: "3-1-1" means 3 s lowering, 1 s pause, 1 s up. DEFAULT for all S1 and rehab loading: 3-1-1. S2 mains: controlled down, fast up (intent to move fast drives the adaptation even at heavy loads).

**C1.4 In-session autoregulation rule (all tiers).** If the first working set of a main lift comes in at RPE >8, drop load 5% for remaining sets. If RPE <6, raise 2.5-5%, DEFAULT 2.5%. Never chase a planned load on a bad day.

**C1.5 Pain-during-lift substitution table.** If a prescribed lift hurts (>2/10 at the joint, not muscle burn), swap once, do not push through:
| Painful lift | Substitute 1 | Substitute 2 |
|---|---|---|
| Squat pattern (knee) | Box squat to higher box | Glute bridge, loaded |
| Squat pattern (back) | Goblet squat | Split squat |
| Hinge (back) | Hip thrust / glute bridge | Bird dog, slow |
| Split squat (knee) | Reduce depth 50% | Step-up to low step |
| Calf raise (Achilles) | Isometric calf hold 45 s | Bent-knee only |
| Push-up (shoulder) | Incline push-up | Wall push-up |
If the substitute also hurts: stop that pattern, fire the B4 niggle pipeline.

**C1.6 Missing sessions: swimmer, ultrarunner, general fitness.**

S7. Swimmer strength (35-40 min). Order is a hard rule: shoulder block FIRST, then pull, then the rest.
| # | Exercise | Sets x reps | GYM | MIN | BW |
|---|---|---|---|---|---|
| 1 | Swimmer shoulder block (Part B S6) | full | same | same | same |
| 2 | Pull | 3 x 6-8 | Lat pulldown or pull-up | Band lat pulldown / DB row | Towel row on door, feet forward |
| 3 | Horizontal row | 3 x 8 | Seated cable row | One-arm DB row | Band row |
| 4 | Hinge | 3 x 8 | RDL | DB RDL | Single-leg hip hinge |
| 5 | Trunk | 3 rounds | Dead bug x10/side + side plank 30 s | same | same |
No heavy overhead pressing for swimmers by DEFAULT (adds subacromial load on top of high swim volume); push-ups only.

S8. Ultrarunner durability (40 min). Adds eccentric and carry emphasis to S2.
| # | Exercise | Sets x reps |
|---|---|---|
| 1 | Squat pattern (S2 row 1) | 4 x 5 |
| 2 | Step-down from stair/box, 4-0-1 tempo (eccentric quad, the downhill muscle) | 3 x 8/side |
| 3 | Heavy calf raise, bent + straight knee | 3 x 8 each |
| 4 | Loaded carry: farmer walk with DBs or loaded pack | 3 x 40 m, DEFAULT bodyweight x 0.3 total |
| 5 | Side plank with top-leg raise | 2 x 30 s/side |
Pre-race specificity, A tier only: 4-6 weeks out, one weekly downhill-run strength stimulus replaces row 2 (persona doc owns the run prescription).

S9. General fitness (35-40 min): S1 exercise list at 3 x 8-10, RPE 7, plus one carry (farmer walk 3 x 40 m) and one power move for ages 50+ (squat to fast stand, light, 3 x 5). This IS the long-term template for the `general` persona; progression by load, not complexity.

**C1.7 Weekly placement templates** (strength days relative to persona endurance week). Encode as defaults the plan generator can override:
| Persona days/week pattern | Strength placement (2x weeks) | Strength placement (1x weeks) |
|---|---|---|
| Runner: Tue Q / Thu Q / Sun long | After Tue Q (6 h gap or evening) + Fri | After Tue Q |
| Cyclist: Tue Q / Sat long / Sun Q | After Tue Q + Wed | After Tue Q |
| Triathlete 6-day | On the two hardest days, never day before long ride/run | Hardest weekday |
Hard rule restated: never the day before the long run; never <48 h before a key session.

**C1.8 Open-water swim Prep** (no pool warm-up possible): deck Prep from A4.3 doubled (2 rounds), plus 20 arm swings mimicking stroke, plus 2 x 20 s brisk walk/jog to raise temperature; if water entry allowed pre-start, 3-5 min easy with 4 x 6 strokes build.

**C1.9 Post-race cool-down addition:** after any race, 10 min of easy walking before sitting/driving, all distances; after marathon+ also a 10 min walk that evening. That is the entire evidence-supported prescription.

**C1.10 Session naming convention in app:** "Strength: Intro" (S1), "Strength: Max Lower" (S2), "Strength: Power" (S3), "Strength: Maintenance" (S4), "Core 15" (S5), "Prehab: <site>" (S6 blocks), "Strength: Swim" (S7), "Strength: Durability" (S8), "Strength: Foundation" (S9). Short names, no jargon like "anatomical adaptation" in user-facing copy.

---

## C2. Mobility and flexibility: evidence vs myth

Honest evidence position the Coach should hold:
- Static stretching does NOT reduce overall injury risk (Lauersen 2014: stretching arm showed no protective effect; strength did).
- Stretching mostly increases stretch TOLERANCE, not muscle length (Weppler & Magnusson 2010).
- For runners, being LESS flexible in calves/hamstrings correlates with better running economy (stiffer springs). Do not prescribe flexibility for its own sake.
- Foam rolling: small acute ROM gains and reduced perceived soreness, no performance change (Wiewelhove 2019). Verdict: optional, 60-90 s per site, fine if the athlete likes it.
- Yoga: counts as an easy-day activity and trunk work, not a performance intervention.

Prescribe mobility ONLY where a measurable ROM deficit limits a sport position:
| Deficit | Test (self-administered) | Threshold to act | Fix | Dose |
|---|---|---|---|---|
| Ankle dorsiflexion (runners, ski-position cyclists) | Knee-to-wall: big toe at wall edge, knee touches wall, slide foot back | <10 cm foot-to-wall, or >2 cm side difference | Knee-to-wall rocks x12/side + calf raises full range | Daily 2 min, 4-6 wks, DEFAULT 4 |
| Hip flexor length (cyclists, desk workers) | Lying on bed edge, hug one knee, other thigh should rest level | Thigh rides up clearly | Half-kneeling hip flexor stretch 2 x 45 s/side + glute bridge x12 | 5 x/wk, 4 wks |
| Thoracic rotation (swimmers, aero cyclists) | Seated, arms crossed, rotate: target 45 deg each way | Visibly short of 45 or asymmetric | Open-book rotations x8/side + thread-the-needle x8/side | Daily 2 min, 4 wks |
| Overhead reach (swimmers) | Back to wall, raise straight arms overhead to wall | Cannot touch wall without ribs flaring | Wall slides x8 + lat stretch 2 x 30 s | 5 x/wk, 4 wks |
Re-test every 2 weeks. If no change after 6 weeks, stop prescribing it and move on (likely anatomical, not soft-tissue).

---

## C3. Tendon-loading protocols (the in-season pain-management tool)

Tendons respond to load magnitude and slow time-under-tension, not reps of fluff. Three-stage model, applicable to Achilles, patellar, gluteal, proximal hamstring, plantar:

| Stage | When | Protocol | Numbers | Duration |
|---|---|---|---|---|
| 1. Isometrics (analgesic + entry load) | Pain ≥4/10 with daily activity, or in-season flare needing same-week pain relief | Mid-range isometric hold against heavy resistance | 5 x 45 s at effort ~7/10, 2 min rest between, 1-2 x/day (Rio 2015: measurable pain reduction for ~45 min post, useful BEFORE a session) | 1-2 wks, until daily pain ≤3 |
| 2. Heavy slow resistance | Pain ≤3-4/10 with daily activity | The site's heavy lift at 3-1-1 tempo (Kongsgaard/Beyer: equal outcomes to eccentric-only, better adherence) | 3-4 sets x 8-12 to start, progress to 4 x 6 heavier, 3 x/wk, rehab pain cap 5/10 with morning-after rule (C1.1) | 6-12 wks, DEFAULT 8 |
| 3. Energy storage (spring work) | Stage 2 strong + pain ≤2/10 for 2 wks | Hops, skips, strides reintroduced | Start 2 x 10 low hops, +20% contacts/wk | 2-4 wks, then normal |
Site-to-lift mapping: Achilles = calf raise (straight + bent knee); patellar = split squat or leg press; gluteal = side-lying abduction into band walks; hamstring = single-leg RDL; plantar = toes-elevated calf raise.
In-season trick to encode: 5 x 30-45 s isometric calf or wall-sit hold 45-60 min BEFORE a run reduces tendon pain during the run. Offer it whenever an athlete with a known tendon issue has a quality session scheduled.

---

## C4. Bone stress injury (BSI): risk grading and return-to-run

The app NEVER self-manages a suspected BSI. Its jobs: recognize the pattern, route to imaging/medical care, then run the return protocol after clearance.

Recognition pattern (any of): focal one-fingertip bone pain, pain that worsens through a run and lingers after, night ache in bone, pain hopping on one leg. Action: stop running, refer.

Site risk grading (Hoenig 2022, Warden 2014):
| Risk | Sites | App behavior |
|---|---|---|
| Higher-risk (poor healing, can progress badly) | Femoral neck, anterior tibial cortex, navicular, base of 5th metatarsal, sesamoid, pelvis/sacrum in low-energy-availability athletes | Medical management only; app provides cross-training (deep-water run, swim, easy bike if cleared) and nothing else until cleared |
| Lower-risk | Posteromedial tibia, fibula, metatarsal shafts 2-4, femoral shaft | Medical clearance, then protocol below |

Also screen energy availability on every BSI (C7): a BSI plus missed periods or chronic under-fueling is a RED-S referral, not a loading problem.

Return-to-run protocol (after clearance AND 5 days pain-free walking 30 min, all tiers; weeks are DEFAULTs, never compress):
| Week | Sessions | Content |
|---|---|---|
| 1 | 3, alternate days | 30 min: repeat [1 min run / 4 min walk] x6 |
| 2 | 3 | 30 min: [2 run / 3 walk] x6, then [3/2] x6 |
| 3 | 3-4 | [5 run / 1 walk] x5, then 2 x 12 min continuous |
| 4 | 4 | 20-30 min continuous easy |
| 5-8 | normal frequency | Volume +10%/wk max from week-4 level; every-other-day running through week 6 |
| 9+ | normal | Strides may return week 7-8 if pain-free; hills then intervals last, DEFAULT week 9 |
Any bone pain recurrence ≥2/10: drop back two phases and recheck. Calcium 1000-1300 mg/day and vitamin D status check belong in the Coach's BSI talking points (suggest discussing with the clinician, do not prescribe supplements as treatment).

---

## C5. Sleep and recovery basics (what the Coach preaches, and how often)

The case, stated once and well: adolescent athletes sleeping <8 h had ~1.7x injury risk (Milewski 2014); sleep extension improved sprint and accuracy metrics in collegiate athletes (Mah 2011). Sleep is the highest-leverage recovery input, above any gadget or protocol.

Rules table:
| Item | B/I/A (same) | DEFAULT |
|---|---|---|
| Sleep target | 7-9 h, athletes toward the top | 8 h |
| Consistency | Same wake time ±1 h, 7 days | enforce in messaging |
| Caffeine cutoff | none within 8-9 h of bed | 14:00 for a 22:30 bed |
| Naps | 20-30 min before 15:00, or skip | 20 min |
| Alcohol | degrades sleep architecture even at 1-2 drinks; none night before key sessions/races | flag, don't moralize |
| Bedroom | cool (18-19 C), dark, no screens last 30 min | mention once |
Recovery hierarchy the Coach repeats when asked about gadgets: 1 sleep, 2 food (C5.1), 3 easy-day discipline. Everything else (massage guns, compression, cold tubs) is optional comfort. Cold-water immersion specifically: fine after races for feel, avoid within 4-6 h after strength sessions (blunts adaptation, Roberts 2015).

C5.1 Fueling lines the Coach may state (general, not medical nutrition therapy): carbohydrate before/during sessions >75 min; 20-40 g protein within ~2 h post-strength; masters toward 1.6-2.0 g/kg/day protein (Moore 2015). Persistent unexplained fatigue, weight loss, or appetite loss: suggest bloodwork with a doctor (ferritin and vitamin D top the list for endurance athletes), do not guess.

Preach cadence (anti-nag rule): sleep/recovery messaging fires only when triggered (poor-feedback cluster, DOMS ≥2 reports, niggle pipeline, race-week brief), plus at most one monthly proactive nudge.

---

## C6. Footwear rules (runners and triathletes)

| Rule | Numbers | DEFAULT |
|---|---|---|
| Rotate ≥2 different shoe models | Malisoux 2015: parallel use of multiple models associated with 39% lower injury risk | Suggest 2-shoe rotation once athlete runs ≥3 x/wk |
| Replacement mileage | 500-800 km per pair depending on shoe/weight | 650 km |
| New-model transition | Introduce on easy runs only, alternate days, 2-3 wks before full use | 2 wks |
| Carbon/super shoes | Reserve for races + 2-4 key sessions in final 6 wks; higher calf/foot loading | Race + 3 sessions |
| Race-day shoes | Never 0-run shoes; minimum 2-3 runs including one at race pace | 3 runs |
| Big drop changes (e.g. 10 mm to 4 mm) | Treat like a new training stress: 4-6 wk gradual transition, calf block running concurrently | discourage mid-season |
App feature note: a per-shoe odometer (manual or from Strava gear) that nudges at 600 km is cheap to build and reads as deeply pro.

---

## C7. Female athlete specifics

**Programming:** identical principles, identical session library, identical progression rules. Strength training is, if anything, MORE valuable: heavy resistance plus impact loading is the proven bone-density lever (LIFTMOR trial: heavy lifting was safe and improved BMD in women with low bone mass).

**Energy availability / RED-S (highest-priority screen the Coach owns):** triggers that fire a careful check-in and, when confirmed, a referral recommendation (sports doctor or sports dietitian): missed or absent periods in a non-contraceptive-explained context, a BSI, persistent fatigue plus weight-loss talk, calorie-restriction questions layered on high training load. Hard rule: the Coach never prescribes weight loss or calorie deficits alongside Build/Peak load, and never treats amenorrhea as benign or as a training adaptation.

**Menstrual cycle and programming:** the honest evidence (McNulty 2020 meta-analysis): performance effects across cycle phases are trivial on average with huge individual variation. The Coach does NOT impose phase-based programming dogma. It DOES: invite optional symptom tracking, allow easy-day swaps on high-symptom days without penalty, and treat patterns individually ("your last three hard sessions flagged poor on day 1-2; want me to default those weeks to flipping the order?").

**Iron:** heavy periods plus endurance volume is the classic ferritin-deficit setup; persistent unexplained fatigue or performance decline → suggest ferritin/CBC bloodwork via doctor. Coach does not dose supplements.

**Postpartum return to run** (Goom, Donnelly & Brockwell 2019; conservative by design):
| Gate | Criterion |
|---|---|
| Earliest return to running | Not before 12 weeks postpartum, DEFAULT 12, and only with the gates below |
| Symptom gate | No leaking, heaviness, dragging sensation, or pain during the strength gates |
| Strength gates, each pain/symptom-free | Walk 30 min; single-leg balance 10 s/side; bodyweight squat x20; single-leg sit-to-stand from chair x10/side; single-leg calf raise x20/side; bed-to-stand without breath-holding |
| First 4 weeks of running | Walk-run only (use C4 weeks 1-2 template), flat, no speed |
| Referral default | Pelvic-health physio assessment recommended for everyone, required if any symptom gate fails |
Strength work resumes earlier than running (from ~6 wks with medical clearance): S1 circuit minus jumping, plus pelvic floor and breathing work guided by the physio. C-section recovery: add 2-4 weeks to every gate, DEFAULT 4.

---

## C8. Youth and masters rules

**Youth (<18)** (Lloyd & Faigenbaum 2014: resistance training is safe and beneficial for youth with competent technique):
| Rule | Value |
|---|---|
| Programming emphasis | Technique and movement variety over load; RPE cap 7 |
| 1RM testing | Never in-app for <18; estimate from RPE only |
| Loading start | All youth start tier B regardless of endurance level; bodyweight/MIN variants first 6 wks |
| Growth-spurt flag | Knee-cap-area pain (patellar tendon insertion) or heel pain in a growing athlete = growth-plate pattern (Osgood-Schlatter / Sever's): cut plyometrics and hills, keep cycling/swimming, refer if >2 wks |
| Plyo contacts | cap at 40-60/session regardless of training age |

**Masters (extends Part B):** 40+: Raise portion +25%, keep 2 reps in reserve; 50+: Raise +50%, 72 h between heavy lower sessions, 2-3 reps in reserve, weekly power emphasis (light load, fast intent: squat-to-fast-stand 3 x 5, step-up with drive 3 x 5/side) year-round because power declines ~1.5x faster than strength with age; 60+: add balance work to every session (single-leg stand 3 x 30 s, eyes-open then closed), and treat any new exercise with a 2-week BW-only on-ramp. Protein per C5.1.

---

## C9. Home equipment: what to recommend, in order

Coach suggests purchases only when an equipment limit actually blocks progression (e.g. BW calf raises exceed 3 x 20 easily). Value ranking:
| Priority | Item | Approx cost | Unlocks |
|---|---|---|---|
| 1 | Resistance band set (light/medium/heavy loop + long band) | $15-25 | All prehab blocks at proper load, Pallof, lat pulldown, band walks |
| 2 | Two dumbbells or one adjustable pair (women start 8-12 kg, men 12-16 kg hex) | $50-150 | Full MIN session library, loaded calf raises, carries |
| 3 | Doorway pull-up bar | $25 | Real pulls for swimmers/triathletes |
| 4 | Single kettlebell (12-16 kg M / 8-12 kg F) | $30-50 | Goblet squats, carries, swings (A tier) |
| 5 | Sturdy step or plyo box | $0-40 (stairs work) | Step-downs, step-ups, box jumps |
Explicit non-recommendations: no machines, no smith bars, no vibration plates, no "recovery tech" before items 1-2 exist.

---

End of Part C. Part D covers the five deep areas: adherence, in-week adaptive logic, the deeper niggle library, warm-up depth, and strength testing.
