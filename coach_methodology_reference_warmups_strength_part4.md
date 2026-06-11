# Stryxs Strength & Conditioning Methodology, Part D: Five Deep Systems

Companion to Parts A-C. Each section carries hard numbers, tables, and at least one worked example. Tiers B/I/A with DEFAULTs throughout.
Additional sources: Gollwitzer & Sheeran 2006 (implementation intentions roughly double goal follow-through), Foster 1998 (monotony/strain), Wilson et al. 2012 and Fyfe et al. 2014 (concurrent-training interference), Schoenfeld et al. 2017 (volume dose-response), Androulakis-Korakakis et al. 2020 (minimum effective training dose for strength), Bishop 2003 / McGowan 2015 (race warm-up), Hebert-Losier et al. 2017 (calf raise norms), "neck rule" for illness (Eichner).

---

## D1. The adherence problem

Reality the system designs around: when endurance athletes drop a session, it is the strength session, and they drop it silently. The fix is design, not motivation speeches.

**D1.1 Session length sweet spot.** Adherence falls off a cliff above ~45 min of "extra" training. Standing prescription: 30-40 min sessions (Part B). For any athlete who has skipped ≥2 strength sessions in a rolling 3 weeks, the system drops to the 15-minute versions (D1.3) WITHOUT being asked. A completed 15-min session beats a skipped 40-min session every week of the year; research backs astonishingly low maintenance doses (Androulakis-Korakakis 2020: single hard sets retain most strength).

**D1.2 Scheduling position.** Ranked by observed completion likelihood, encode as placement preference order:
1. Immediately after a short easy endurance session, same shoes still on (best slot; the gym trip already happened in the legs)
2. Same evening as a morning quality session (hard days hard)
3. Standalone on a hard day, ≥6 h after
4. Standalone on its own day (worst completion; avoid for B tier)
Never: day before long run, <48 h before key session (unchanged hard rules).

**D1.3 Minimum effective dose: the 15-minute versions** (2 min warm-up = A4.5 items 1+6 short, then):
| Block | 15-min content |
|---|---|
| S2 Max Lower 15 | Squat pattern 3 x 5 RPE 7-8, heavy calf raise 3 x 8, side plank 2 x 30 s/side |
| S3 Power 15 | Squat jump 3 x 5, bounds 2 x 10 m, single-leg hops 2 x 6/side (contacts ~50) |
| S4 Maintenance 15 | Squat pattern 2 x 5, calf raise 2 x 8, Pallof or dead bug 2 sets |
| S5 Core 10 | McGill big three, one set each at standard doses, + dead bug x10/side |
| S6 prehab blocks | Already 8-12 min; never cut these, cut the lifting instead |
| S7 Swim 15 | Shoulder block (compressed: 1 set each) + pull 3 x 8 + side plank |
Floor rule: the prehab block relevant to the athlete's injury history is the LAST thing ever removed from a week.

**D1.4 Habit stacking and implementation intentions.** When a strength session is scheduled, the app asks once for an anchor: "When exactly? Most athletes pick: right after Tuesday's easy run, before showering." A specified when-where roughly doubles follow-through vs a floating intention (Gollwitzer & Sheeran 2006). Store the anchor, print it on the session card ("After easy run, before shower"), and send the reminder at the anchor time, not a generic hour.

**D1.5 The skip-response ladder (messaging rules, codeable).**
| State | Trigger | Coach behavior |
|---|---|---|
| L0 | 1 skip, isolated | Say nothing. Zero guilt. The week moves on. |
| L1 | 2 skips in rolling 3 wks | Shrink silently: next prescriptions are the 15-min versions. No announcement beyond the smaller card. |
| L2 | Skips continue at 15-min size (2 more) | One question, once: "Strength keeps slipping. What's the real blocker: time, energy, boredom, or just hate it?" Branch: time → 10-min prehab-only weeks; energy → move to slot D1.2-1 and audit sleep (C5); boredom → rotate session flavor (swap S2 for S3-style or circuits); hate it → honesty mode below. |
| L3 | Athlete states they won't do it | Honesty mode, one message, then drop it: "Fair. The one thing I'm keeping is the 8-minute <site> block, because with your <injury history>, that's the difference-maker (strength work roughly halves overuse injury risk, Lauersen 2014). Everything else I'll stop scheduling." Keep only the prehab block. Re-offer at the next phase boundary, not before. |
**When to push vs shrink:** push (one evidence-based case, once) only when ALL of: race ≥12 wks out, athlete has an injury history matching a prehab block, and current ask is already ≤15 min. Inside 8 wks to race: never push, maintenance-or-nothing. Never guilt language, never streak-shaming; DO celebrate streaks (D5.4).

**D1.6 Worked example.** Marathoner, I tier, race in 16 wks, prior Achilles issue. Week 3: skipped Fri strength. Coach: silent (L0). Week 5: skipped again. System: Friday card becomes "Strength: Max Lower 15" with anchor prompt (L1). Week 7: completed twice at 15 min. Week 9: system offers the 30-min version back ("You've banked 4 in a row. Want the full version back or keep the 15s?"). Athlete keeps 15s. Outcome: ~10 completed strength touches plus an uninterrupted calf block before race build, instead of 3 completed 40-min sessions and a dead thread.

---

## D2. In-week adaptive logic (codeable rules)

**D2.1 DOMS scale (define once, use everywhere).** 0 none; 1 aware of it, no movement change; 2 alters stairs/gait or sit-to-stand; 3 interferes with daily life. Collect via workout_feedback (`felt_sore` + follow-up severity question when flagged).

**D2.2 DOMS vs key sessions.**
| Situation | Rule |
|---|---|
| DOMS ≥2 reported, key session tomorrow | Swap days if the week allows (key session needs DOMS ≤1); else convert key session to easy and move key session +24-48 h, DEFAULT +24 |
| DOMS ≥2 on the day of a key session | Convert to easy. A key session on DOMS-2 legs is junk intensity at injury-elevated risk. |
| DOMS ≥2 twice after the same strength session type | That session's volume was too big a jump: cut one set from every exercise next time, then re-progress |
| DOMS 3 | Treat as the muscle-strain branch: no loading that muscle group 48-72 h, easy spin/swim ok |
Prevention rule (better than cure): any NEW strength session or phase starts at minus-one-set volume in week 1 (C1.4 plus B6 on-ramp already imply this; make it explicit).

**D2.3 Missed strength session: make up or let die?**
| Condition | Decision |
|---|---|
| ≥48 h remain before next key endurance session AND it's the same training week | Make up, slot per D1.2 order |
| Would land <48 h before a key session, or day before long run | Dies. Do not reshuffle endurance to rescue strength. |
| Race week or taper | Always dies |
| Maintenance-phase session (S4) missed | Dies; one missed maintenance session costs ~nothing, two consecutive weeks missed → next session is mandatory-priority placement |
| Two strength sessions missed in same week | Make up at most ONE; never stack two heavy sessions <48 h apart |
Universal: missed sessions never roll into the next week. The week resets.

**D2.4 Deload, race week, illness.**
| Week type | Strength volume rule |
|---|---|
| Deload/recovery week | Sets x 0.5 (round down), SAME load, same frequency. Intensity preserved, volume cut: detraining avoided, fatigue shed. |
| Race week | Zero lifting (B6). Prehab/movement ≤10 min ok through race-minus-3. Last full session: ≥5 days pre-race (short events), ≥7 days (marathon and longer). |
| Illness, above-neck only (runny nose, mild sore throat) | Endurance easy-only; NO strength (strength is the optional stressor; shed it first) |
| Illness, below-neck or fever (cough, chest, aches, GI) | Nothing. Full stop. |
| Return from illness | 1 easy endurance day per sick day first; strength resumes after 2 normal endurance days, at minus-one-set, RPE cap 7 for the first session back |

**D2.5 Interference effect: the real rules.** What research supports (Wilson 2012 meta, Fyfe 2014): interference is real but dose-dependent; it mainly degrades POWER and hypertrophy, mildly affects max strength, and barely matters at 1-2 strength sessions/week alongside endurance. Running interferes with leg strength more than cycling does (eccentric load + impact). Spacing matters: same-session back-to-back is worst, ≥3 h reduces interference, ≥6 h is good, ≥24 h is clean.
Codeable rules: (1) keep our existing 6 h DEFAULT gap, endurance first; (2) protect S3 power sessions hardest: never within 6 h after a run, prefer a fresh day or after an easy spin only; (3) lifting to failure increases interference and recovery cost for zero extra benefit at our doses: the reps-in-reserve floors in B6 are also interference management.
Gym lore to actively debunk in Coach voice: "cardio kills gains" (false at endurance-athlete strength doses), "you must separate by 24 h or it's wasted" (false; 6 h is fine), "strength must be done fasted/fed in some magic window" (false; total intake matters, the 20-40 g post-session protein in C5.1 is the only timing worth a sentence).

**D2.6 Worked example.** Cyclist, A tier, week: Tue VO2, Wed strength S2, Sat long, Sun threshold. Wednesday feedback Thursday morning: `felt_sore`, severity 2 (stairs noticeable). Saturday is long (key). Engine: DOMS-2 with key session in 2 days → no swap needed (48 h gap likely clears DOMS-2 to ≤1), but inserts a Friday check: "Quick check: legs back to normal?" Friday answer "still stiff" (DOMS 1-2): long ride stays but opens with 30 min Z1 and drops any prescribed tempo inserts; Sunday threshold moved to Monday (+24 h). Strength log: second DOMS-2 after S2 this block → next S2 prescribed at 3 x 5 / 2 x 6 / 2 x 8 (one set off each exercise).

---

## D3. The niggle library, deeper

Per site: likely culprits by sport, the self-test (phrased exactly as the Coach can ask it), and the return gates. Universal return ladder once gates pass: reintroduce removed elements one per week, lowest-load first (easy volume → hills → strides → intervals → plyo), pain ≤1/10 during and zero next morning at each rung.

| Site | Top culprits by sport | Self-test (Coach script) | Return-to-full gates |
|---|---|---|---|
| Achilles | Run: volume spike, hill/speed spike, shoe-drop change. Tri: run off bike spike. | "Single-leg calf raises, straight knee, count until pain or form failure. What number, each side?" Plus daily: "Morning stiffness: how many minutes?" | ≥20 pain-free/side and ≤10% side gap (norm ~25, Hebert-Losier 2017); morning stiffness <5 min for 7 straight days; 10 single-leg hops pain-free |
| Patellofemoral (front knee) | Run: downhill, volume spike, weak hips. Cycle: saddle low/forward, big gears. | "Slow single-leg squat to about 45 degrees x8. Pain out of 10? And is one side wobblier?" | x10/side pain ≤1 and steady; step-down 2 x 8 clean; one full week normal volume pain-free |
| ITB (outside knee) | Run: downhill, camber, sudden long-run jump. Cycle: cleat/saddle. | "Where exactly does it bite: a specific spot outside the knee that arrives at a predictable time into the run?" (yes = ITB pattern) "Single-leg balance 30 s: pain?" | Pain-free at previous trigger distance +20%; lateral band walk 2 x 15 strong; downhill last to return |
| Shin (MTSS vs bone) | Run: volume+speed spike, hard surfaces, cadence <165, worn shoes. | "Press along the inside edge of the shin: is it a diffuse stretch of soreness (several cm) or ONE exact fingertip spot?" Diffuse = MTSS path. Focal = stop, refer (C4). Then: "10 single-leg hops: pain?" | Hop test x10 pain-free both sides; diffuse tenderness resolving; 2 wks pain-free at reduced volume before re-ramping +10%/wk |
| Plantar | Run: volume spike, calf weakness, flat worn shoes, standing job. | "First steps out of bed this morning, pain out of 10? Track that number daily; it's our gauge." | Morning first-step pain ≤2 for 10 straight days; single-leg calf raise (toes on rolled towel) x15 pain-free |
| Lateral hip (glute tendinopathy) | Run: camber, crossover gait, sudden hills. All: side-sleeping pressure, stretching it (makes it worse). | "Stand on the sore-side leg 30 s: pain at the bony point on the side of the hip? Does lying on that side at night bug you?" | 30 s single-leg stand pain-free; side-lying abduction 2 x 15 pain ≤2; night pain gone 7 days |
| Hamstring | Run: strides/speed without prep, overstriding. Sudden sharp = strain; gradual sit-bone = tendinopathy. | Strain path: "Can you walk pain-free? Gentle single-leg bridge x10: pain?" Tendinopathy: "Worse sitting on hard chairs and at the sit-bone?" | Strain: walk + single-leg bridge x15 pain-free → easy run → strides at wk 3-4. Tendinopathy: C3 stages; sitting pain resolved; single-leg RDL 2 x 8 loaded pain ≤2 |
| Shoulder (swim) | Volume/paddle spike, crossover hand entry, low elbow, breathing-side asymmetry. | "Raise the arm slowly out to the side to overhead: where's the pinch, out of 10? And push-ups x10: pain?" | Pain-free arm raise; band ER 2 x 15 pain ≤1; 2 wks of swim at reduced volume pain-free before paddles return (paddles return LAST) |
| Low back | Cycle: long aero blocks, fit, weak trunk. Run: volume spike. Gym: hinge form. | "Is it a band of stiffness easing with movement (good sign) or sharp/one-sided/shooting down the leg (different problem)?" Shooting/numbness = refer (B5). | McGill big three at full doses comfortable; pain-free at previous trigger duration +20%; gym hinges return last at 50% load |
| Calf (belly) | Run: speed/hill spike, fatigue end of long runs. Masters: classic mid-calf strain pattern. | "Sudden sharp mid-run (strain) or gradual tightness (overload)? Hop x5: pain?" | Strain: hop x10 pain-free + single-leg calf raise x15 before any running; overload: gates as Achilles row |

**D3.1 Worked dialogue 1 (Achilles, runner, I tier, HM in 10 wks).**
Athlete: "achilles a bit stiff in the mornings lately, fine once i get going"
Coach: red-flag screen clean (no focal bone pain, no swelling, pain 2/10). "Classic early Achilles overload pattern. Two questions: how many minutes does morning stiffness last, and do single-leg calf raises to fatigue, straight knee: what count per side?" Athlete: "maybe 10 min. 14 right, 19 left."
Coach actions: right side under norm and >10% gap → this week: hills and strides OUT, easy volume stays (pain 2/10 passes the rule), Tuesday intervals converted to tempo on flat. INSERT: calf loading 3 x/wk heavy slow (3-1-1) bent + straight knee, plus daily morning 2 x 15 easy calf raises. Optional pre-run isometric trick offered (C3). Check-in day 7.
Day 7: "stiffness 4-5 min, 17 raises right." BETTER branch: block continues 2 more wks, strides return wk 2, hills wk 3.
Return-to-normal trigger: ≥20/side, ≤10% gap, stiffness <5 min for a week → full plan resumes; calf block stays 2 x/wk to race day (prehab floor, D1.3).

**D3.2 Worked dialogue 2 (knee, cyclist, B tier).**
Athlete: "front of my knee aches on the trainer, mostly when i push bigger gears"
Coach: screen clean (3/10, no swelling/locking). "Two checks: slow single-leg squat to 45 degrees x8 per side: pain and wobble? And when did you last change saddle height or position?" Athlete: "left wobbly, pain 3. moved saddle down 2 weeks ago."
Coach actions: probable fit trigger + hip weakness. This week: big-gear/low-cadence work OUT, cadence floor 85 rpm, intensity moved to higher-cadence formats. Fit: "Undo that saddle change first; that timing is not a coincidence. Heel on pedal at bottom of stroke: leg should be straight." INSERT: cyclist hip-trunk block 3 x/wk plus slow step-downs 2 x 8/side. Check-in day 7.
Day 7: "way better with saddle back up, like a 1." BETTER: block continues 2 wks, big-gear work returns wk 3 at half its usual dose.
Return trigger: single-leg squat x10 pain ≤1 both sides and one normal week pain-free.

**D3.3 Worked dialogue 3 (shin, runner, B tier, the refer-out branch).**
Athlete: "shin hurting on runs, kind of sharp now, hurt after the run yesterday too"
Coach: "Press along the inside edge of the shin bone: a diffuse sore stretch, or one exact spot you can cover with a fingertip?" Athlete: "one spot honestly. hurts when i hop too."
Coach: focal bone pain + hop pain + worsening pattern = bone-stress pattern (C4 recognition). "Stop running as of now, that combination is a stress-fracture pattern until proven otherwise, and it needs imaging, not coaching. See a sports doctor or physio this week. Meanwhile: pool, easy bike if completely pain-free, and your swim fitness keeps the engine running. When you're cleared, I have a structured return-to-run plan ready." No loading block inserted. Plan converts to cross-training pending clearance; C4 protocol queued.

---

## D4. Warm-up depth

**D4.1 Race-morning timeline (when things END relative to the gun).** Movement content per A4; this table owns timing.
| Event | Total pre-race active time | Easy aerobic ends | Drills/dynamics end | Last potentiation effort ends | Notes |
|---|---|---|---|---|---|
| 5K / 10K | 30-40 min, DEFAULT 30 | T-15 | T-10 | T-4 to T-6 (potentiation holds ~4-8 min) | Stay moving in corral: leg swings, 2 x 10 s bounces |
| Half marathon | ~20 min | T-15 | T-10 | T-8 (1 x 60 s at race pace) | |
| Marathon | 8-10 min | T-20 | T-15 | T-12 (2 relaxed strides, nothing harder) | Corral lockup often forces earlier: acceptable, first 2 km easy IS the warm-up extension |
| Sprint tri | swim-focused, 20-25 min | land jog T-35 | T-25 | swim builds end T-10 | Wetsuit on by T-20 |
| Olympic tri | 15-20 min | T-30 | T-25 | swim builds end T-10 | |
| 70.3 / IM | 10-15 min total | walk/jog T-40 | T-30 | optional 3-5 min swim ends T-15, else skip | Conserve everything; first 10 min of swim at controlled effort is the real warm-up |
| Cycling TT (standalone) | 25-30 min trainer | T-12 | n/a | 1 x 2 min at race power ends T-8, 2 x 30 s fast cadence end T-5 | Roll to start house at T-5 |
Wake-up rule: wake ≥2.5-3 h before marathon/long-course guns (DEFAULT 3) to eat and clear CNS sluggishness; ≥2 h for short events.

**D4.2 Cold weather (<8 C) and early-morning modifications.** Add 5-10 min to the easy aerobic portion (DEFAULT +5); compress the gap to the gun (finish strides T-3 instead of T-5 where corrals allow); keep layers on until T-10 and do all movement work IN layers; gloves until the gun for hand comfort; pre-race indoor space beats outdoor jogging when temperatures are <0 C (jump rope or jog in place inside, go out at T-12). Early-morning sessions (training, within 1 h of waking): +3-5 min easy at the front (A2) and shift any plyo/sprint content to the second half of the session.

**D4.3 Treadmill and trainer variants.** Treadmill: same durations as outdoor; set 1% incline for outdoor equivalence at paces faster than ~5:30/km (flat is fine for easy warm-up minutes); strides on a treadmill = 30 s pickups stepping the speed up progressively, accepting belt lag, or done OFF the mill in a hallway (preferred where space exists, 4 x 20 s). Trainer: per A4.2 indoor note; in ERG mode, do the fast-cadence potentiation efforts with ERG OFF or in a resistance mode (ERG fights cadence spikes); fan from minute 0.

**D4.4 Post-activation potentiation: when efforts help vs just fatigue.**
| Event / session | PAP verdict | Prescription |
|---|---|---|
| 5K-10K, sprint tri, track, any VO2 session | Helps: start is near-maximal, primed muscle = no shock lap | 2 x 30-60 s at race pace/effort, full recovery, ending 4-6 min before start (DEFAULT 2 x 45 s) |
| HM, threshold sessions, Olympic tri | Mildly helps | 1 x 60 s at race pace, end T-8 |
| Marathon, 70.3, IM, long runs/rides | Neutral to NEGATIVE: costs glycogen, primes nothing a Z2-Z3 start needs | Cap total at/above-threshold pre-race work at 60-90 s, DEFAULT 2 relaxed strides only |
| Strength session | Helps within-session | The ramp-up sets (A4.5 item 6) ARE the PAP; heavier single-rep priming is A-tier-only territory and optional |
| Masters 50+ | Respond well AND need it more | Keep the priming efforts even when time-crunching everything else |
Mechanism note for Coach explanations: potentiation peaks ~4-8 min after the priming effort and decays after ~10-15; that is why the timeline table ends efforts at T-4 to T-8, not T-1.

**D4.5 Worked example.** Athlete: 10K race, gun 07:30, 6 C, I tier, age 52. Engine output: wake 05:30 (2 h); masters Raise +50% and cold +5 min → easy jog 15 min instead of 10, ends T-15 (07:15); drills in layers end T-10; strides 4 x 20 s plus PAP 2 x 45 s at race pace end T-4 (masters: keep them); layers off T-10, corral bounces until gun.

---

## D5. Strength testing and progress visibility

**D5.1 The benchmark battery (no gym, ~12 min, self-administered).**
| Test | Protocol (one line) | B / I / A standard | DEFAULT target |
|---|---|---|---|
| Single-leg calf raise | Straight knee, full range, steady rhythm, count to form failure, each side | 15 / 20 / 25+ per side | 20, side gap <10% |
| Wall sit | Back flat on wall, thighs parallel, time to failure | 45 s / 75 s / 110 s | 60 s |
| Side plank | Elbow under shoulder, straight line, per side | 30 / 45 / 60+ s | 45 s, gap <15% |
| Single-leg balance, eyes closed | Hands on hips, time until foot moves | 10 / 20 / 30 s | 15 s |
| Push-ups | Full range, continuous, count | M 12/20/30, F 6/12/20 | tier line |
| Single-leg sit-to-stand | From a standard chair, arms crossed, reps per side | 5 / 10 / 15 | 8 |
Scoring: each test maps to B/I/A; the athlete's strength tier = the MEDIAN of their six test tiers (robust to one weak test). The calf test doubles as the Achilles self-test baseline (D3): test once healthy, and the niggle pipeline gets a personal baseline instead of population norms.

**D5.2 Re-test cadence and rules.** Every 6-8 weeks, DEFAULT 6, aligned to phase boundaries. Never in race week or within 48 h before a key session (the battery is itself a small training load, ~50-60 sRPE AU). Conditions held constant: same time of day ±2 h, not the day after a long session. Partial re-tests allowed: the 2 tests most relevant to the athlete's sport (runner: calf + balance; cyclist: wall sit + sit-to-stand; swimmer: push-up + side plank) on a 3-week cadence for athletes who like numbers.

**D5.3 Expected progress rates (per 6-week block, consistent training).**
| Test | B | I | A |
|---|---|---|---|
| Calf raises | +4-6 reps | +2-3 | +0-2 (maintenance is success) |
| Wall sit | +15-25 s | +10-15 s | +0-10 s |
| Side plank | +10-15 s | +5-10 s | hold |
| Push-ups | +4-8 | +2-4 | +0-2 |
| Balance | +5-10 s | +3-5 s | hold |
Flat or declining scores across TWO consecutive re-tests despite completed sessions = a programming or recovery flag: engine checks adherence logs first, then sleep/fueling (C5), then raises load one notch if both are clean. B-tier athletes should be told newbie gains are front-loaded so the wk-12 slowdown does not read as failure.

**D5.4 Surfacing strength wins (the part endurance athletes never see).** Rules:
1. After every re-test: a progress card with before → after numbers and ONE outcome translation in sport language. Runner: "Calf capacity 14 → 19 per side. That muscle absorbs about 6-8x bodyweight per stride; this is late-race form insurance." Cyclist: "Wall sit 50 → 78 s. That is trunk and quad endurance holding your aero position deeper into hour three."
2. Tie strength streaks to the existing streak system: "5 strength sessions in a row" is a first-class streak event, same celebration weight as run streaks.
3. Pre-race summary includes a strength ledger line: "Banked this build: 14 strength sessions, calf capacity +35%, zero missed weeks of your Achilles block." Race-morning confidence is an adherence payoff worth printing.
4. Niggle-recovery wins get named: when a B4 pipeline closes successfully, the card says what the athlete DID: "Your hip block is why the knee thing is gone. Keeping 1 x/week as insurance."
5. Anti-noise rule: numbers only at re-tests and phase boundaries; no weekly strength-metric spam.

**D5.5 Worked example.** B-tier triathlete, baseline: calf 12/side, wall sit 40 s, side plank 25 s, balance 8 s, push-ups 10, sit-to-stand 5 → median tier B. Six weeks of S1→S2 plus calf prehab, 11 of 12 sessions done. Re-test: calf 17, wall sit 62, side plank 38, balance 14, push-ups 15, sit-to-stand 8. Card: "Strength check-in: 6 weeks. Calf 12 → 17 per side (+42%). Wall sit 40 → 62 s. Push-ups 10 → 15. You're knocking on intermediate standards in 3 of 6 tests. Translation: more spring per stride and a stronger bike position. Next re-test: week 12." Engine: tier stays B (median rule), S2 loads progress +2.5%/wk, re-test scheduled at next phase boundary.

---

End of Part D.
