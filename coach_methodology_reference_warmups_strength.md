# Stryxs Warm-Up & Cool-Down Methodology (Part A)

Encode-ready reference for the Prep / Warm-up / Cool-down system across all sports and personas.
Sources: Jeffreys (RAMP protocol, UKSCA 2007), McGowan et al. 2015 (warm-up strategies review, Sports Med), Blazevich & Babault 2019 (PAP review), Behm & Chaouachi 2011 (acute stretching effects), Herbert, de Noronha & Kamper 2011 (Cochrane, stretching and soreness), Van Hooren & Peake 2018 (cool-down review, Sports Med), Fradkin et al. 2010 (warm-up and injury), Bishop 2003 (warm-up physiology).

House rules: every numeric range has a DEFAULT. Every rule keyed to tiers B (beginner), I (intermediate), A (advanced). All movements zero-equipment unless marked OPTIONAL TOOL. No movement requires more than a one-line description.

---

## A1. Naming and structure convention (app-wide, all sports)

Two distinct components. Never merge them. Never call both "warm-up".

| Component | Name in app | What it is | Where it happens | Duration |
|---|---|---|---|---|
| 1 | **Prep** | Short off-equipment movement routine done BEFORE starting the session. Mobilizes and activates. | On land, before getting on the bike / in the water / starting the run | 2-5 min, DEFAULT 3 |
| 2 | **Warm-up** | The easy opening segment INSIDE the session itself. Raises temperature and potentiates. | In-sport (easy jog, easy spin, easy swim) | Per table A3 |

One-line app copy (show on first encounter, then on tap):
- Prep: "A few minutes of movement before you start. Wakes up the muscles the session will use."
- Warm-up: "The easy opening part of the session itself. Already included in your workout time."

Structural rule for workout objects: `prep` is a separate optional block rendered above the session; `warmup` remains the first segment inside the session. Prep time does NOT count toward session duration_minutes. Warm-up time DOES (it already does today).

**Honest answer on easy sessions:** pre-session Prep is NOT physiologically required before an easy aerobic session. The first 10 minutes at easy pace IS the warm-up (Bishop 2003: low-intensity work raises muscle temperature adequately on its own). Rules:
- Easy session, tier B/I/A under age 40: Prep optional. DEFAULT: omit. Show "optional 90-second Prep" link.
- Easy session, age 40+ OR first session of the day within 1 h of waking OR returning from injury: Prep ON. DEFAULT: the 90-second minimal Prep (A4.0).
- Any interval, tempo, race-pace, hill, plyometric, or strength session: Prep ON, always, all tiers.

---

## A2. Principles (the RAMP model, adapted)

A warm-up must accomplish four things (Jeffreys RAMP):
1. **Raise**: elevate muscle temperature, heart rate, blood flow. Achieved by the in-sport Warm-up segment. Target: light sweat, breathing elevated but conversational, roughly 60-70% HRmax by the end.
2. **Activate**: switch on the prime movers and stabilizers the session will load (glutes before running, scapular muscles before swimming). Achieved in Prep.
3. **Mobilize**: take the session's key joints through their working range dynamically. Achieved in Prep. Dynamic only. No static holds over 30 s before intense work (Behm & Chaouachi 2011: static holds >60 s acutely reduce force output; holds under 30 s are neutral).
4. **Potentiate**: progressively expose the body to session intensity (strides, builds, fast-cadence spins, ramp-up sets). Achieved at the end of the in-sport Warm-up (Blazevich & Babault 2019).

Scaling rules:
- Warm-up length scales with session INTENSITY, not session length. Hardest sessions get the longest warm-ups. Races: the shorter the race, the longer the warm-up (a 5K start is near-maximal from the gun; an Ironman start is Z2).
- Age scaling: 40-49 add 25% to the Raise portion; 50+ add 50%. DEFAULT applies to under-40.
- Cold environment (<8 C / 46 F): add 5 min to Raise and keep layers on through Potentiate.
- Morning sessions within 1 h of waking: add 3-5 min easy at the front, DEFAULT 3.

When a warm-up may be SHORT: easy and recovery sessions only. When it must be FULL: any session containing work at or above threshold, any plyometrics, any max-strength lifting, all races.

---

## A3. Warm-up duration table (in-sport Warm-up segment)

| Session type | Intensity | Warm-up (B / I / A) | DEFAULT | Prep required |
|---|---|---|---|---|
| Recovery / easy | Z1-Z2 | first 8-12 min of session ridden/run/swum easy | 10 min | Optional (A1 rules) |
| Steady / long | Z2 | first 10-15 min easy | 10 min | Optional |
| Tempo / sweet spot | Z3 / SS | 12-15 / 15 / 15-20 min | 15 min | Yes, 3 min |
| Threshold intervals | Z4 | 15 / 15-20 / 20 min | 15 min | Yes, 3-5 min, DEFAULT 4 |
| VO2 / anaerobic / hills | Z5+ | 15-20 / 20 / 20-25 min | 20 min | Yes, 5 min |
| Plyometric or sprint work | Max | 15 / 20 / 20 min + extended Potentiate | 20 min | Yes, 5 min |
| Strength session | n/a | built into session (A4.5) | 5-8 min, DEFAULT 6 | Merged into session warm-up |
| Race: 5K-10K, sprint tri | Near-max from gun | 25-35 / 30-40 / 30-40 min total pre-race | 30 min | Included in protocol |
| Race: HM, Olympic tri | Threshold-ish | 15-20 / 20 / 20-25 min | 20 min | Included |
| Race: marathon, 70.3, IM | Z2-Z3 start | 5-15 min, conserve glycogen | 10 min | Included |

---

## A4. Per-sport protocols

Format: DEFAULT protocol (ordered list with reps/durations), then MINIMUM (time-crunched), and the injury sites each movement protects. Injury-site shorthand: [ACH] Achilles/calf, [KNEE] patellofemoral/ITB, [SHIN] medial tibial, [PF] plantar fascia, [HIP] hip flexor/glute, [LB] lower back, [SHO] shoulder, [HS] hamstring.

### A4.0 Minimal Prep (universal 90-second version)
Use for easy sessions where Prep is ON, and as the floor for time-crunched athletes.
1. Leg swings front-to-back x10 each side [HIP][HS]
2. Leg swings side-to-side x10 each side [HIP][KNEE]
3. Bodyweight squats x10 [KNEE][HIP]
Total: ~90 s.

### A4.1 RUNNING

**Easy run / recovery run**
- Prep: per A1 rules (DEFAULT omit; minimal Prep if triggered).
- Warm-up: first 10 min of the run at the very easy end of Z1-Z2. That is the whole protocol. DEFAULT 10 min.

**Interval / tempo / hill day. DEFAULT (full) protocol, ~18 min:**
1. Easy jog 10 min (Raise)
2. Leg swings front-to-back x10 each side [HIP][HS]
3. Leg swings side-to-side x10 each side [HIP][KNEE]
4. Walking lunges x8 each side [HIP][KNEE]
5. Single-leg calf raises x10 each side [ACH][PF]
6. A-skips 2 x 15 m (or high knees 2 x 20 steps in place) [SHIN][PF]
7. Strides: 4 x 20 s building to session pace, 40 s walk between (Potentiate)
Items 2-6 are the Prep content folded mid-warm-up for running; the app may render them as one "drills" block after the jog.
MINIMUM (~9 min): 6 min easy jog, leg swings x10 each direction each side, 2 strides.

**Long run**
- Prep: minimal Prep (A4.0) plus single-leg calf raises x10/side [ACH]. DEFAULT ON for long runs (highest cumulative-load session of the week).
- Warm-up: first 10-15 min at easy-pace floor, DEFAULT 10. No strides needed unless the long run contains race-pace segments, then add 3 strides before the first segment.

**Race day, 5K-10K (DEFAULT 30 min, finish 5-8 min before gun):**
1. Easy jog 12 min
2. Leg swings x10 each direction each side, walking lunges x6/side
3. A-skips 2 x 15 m
4. Strides 4 x 20 s building
5. 2 x 45 s at race pace, 1 min easy between
6. Stay warm, sip fluid, line up.
MINIMUM (15 min): 8 min jog, leg swings, 3 strides.

**Race day, half marathon (DEFAULT 20 min):** 10 min jog, leg swings, lunges x6/side, 3 strides, 1 x 60 s at race pace.
**Race day, marathon (DEFAULT 8 min):** 5 min easy jog, leg swings x10 each side, 2 relaxed strides. Nothing more. Glycogen is the race currency (McGowan 2015: prolonged warm-ups deplete glycogen with no benefit for sub-threshold race starts).

### A4.2 CYCLING

**Easy ride:** no Prep required (A1 rules). Warm-up: first 10 min easy spin, 90+ rpm. DEFAULT 10.

**Interval day (outdoor or trainer). Prep, off the bike, ~4 min DEFAULT:**
1. Leg swings front-to-back x10 each side [HIP]
2. Bodyweight squats x10 [KNEE]
3. Lunge with torso rotation x5 each side [HIP][LB]
4. Cat-cow x6 [LB]
5. Glute bridges x10 [LB][KNEE]
Then on-bike Warm-up, DEFAULT 15 min (Z5 days: 20):
1. 10 min building from very easy to Z2
2. 3 x 1 min fast cadence (100-110 rpm), 1 min easy between (Potentiate, neuromuscular)
3. 1 x 2 min at threshold
4. 3 min easy, then main set.
MINIMUM: Prep items 1-2 only (60 s), on-bike 8 min building plus 2 x 30 s fast cadence.

**Indoor trainer note:** heat builds faster indoors; cap the Raise portion at the DEFAULT, use a fan from minute 0, and shift one fast-cadence effort earlier. Trainer easy rides need no Prep.

**Race day, TT or short tri bike leg:** covered by the tri protocols below and the persona race-day docs; do not duplicate factor logic here.

### A4.3 SWIMMING

**Pool session, all types. Deck Prep, ~3 min DEFAULT:**
1. Arm circles x10 forward, x10 backward each arm [SHO]
2. Scapular push-ups (against wall or floor) x8 [SHO]
3. Trunk rotations x10 each side [LB]
4. OPTIONAL TOOL band pull-aparts x15 (substitute: wall slides x8) [SHO]
In-water Warm-up by session type:
| Session type | In-water warm-up | DEFAULT |
|---|---|---|
| Technique/drill | 200-300 easy mixed strokes | 200 |
| Aerobic/endurance | 300-400 easy + 4 x 50 drill/swim by 25 | 400 total |
| Threshold/CSS | 300 easy + 4 x 50 drill/swim + 4 x 25 build to CSS pace | 500 total |
| Sprint | 300 easy + 4 x 50 drill/swim + 4 x 25 build + 2 x 15 m fast | 550 total |
MINIMUM: deck items 1-2 (60 s), 200 easy, 2 x 25 build.

### A4.4 BRICK / TRIATHLON SESSIONS
- Pre-brick Prep: use the cycling Prep (A4.2). The bike leg is the run's warm-up; no run Prep needed at transition. First 5 min of the brick run at easy effort regardless of prescribed pace (legs re-coordinate; this is a hard rule, all tiers).
- Race-day warm-ups for sprint/Olympic/70.3/IM: race warm-up timing tables and swim-start protocols live in the triathlon persona docs; this doc supplies only the movement content. DEFAULT movement content pre-swim: arm circles x10 each direction, scapular push-ups x8, leg swings x10 each side, 5-10 min easy swim if water access allowed (sprint/Olympic), 3-5 min or skip if not (long course).

### A4.5 STRENGTH / GYM SESSIONS
Session warm-up, built into the session, DEFAULT 6 min:
1. 2 min easy cardio: jumping jacks, brisk stair walk, or OPTIONAL TOOL rower/bike (Raise)
2. Bodyweight squats x10 [KNEE]
3. Glute bridges x10 [LB]
4. Scapular push-ups x8 [SHO]
5. Leg swings front-to-back x10 each side [HIP]
6. Ramp-up sets of the first main lift: 1 x 8 at ~50% working load, 1 x 5 at ~70%, rest 60 s, then working sets (Potentiate; mandatory before any lift at RPE 7+, all tiers).
MINIMUM: items 1, 2, 6.

---

## A5. Cool-downs (what matters, what is myth)

Evidence summary (Van Hooren & Peake 2018): active cool-downs largely do NOT reduce DOMS, do not prevent injury, and do not improve next-day performance. Static stretching after sessions does not reduce soreness (Herbert et al., Cochrane 2011). What a cool-down legitimately does: returns heart rate and blood pressure gradually (avoids post-exercise dizziness after very hard efforts), and gives a psychological close-out. Keep it short and honest.

| Session | Cool-down | DEFAULT |
|---|---|---|
| Easy / recovery (any sport) | None required. Stop. | 0 min |
| Run intervals / tempo / race | 5-10 min easy jog or walk | 5 min jog + 2 min walk |
| Bike intervals / race | 5-10 min easy spin, high cadence | 5 min |
| Swim any hard set | 100-200 easy choice | 100 |
| Strength | None required; optional 2-3 min walk | 0 min |
| Long run / long ride | 3-5 min walking or easy spin at the end | 3 min |

Optional add-on, all sports: 2-3 static stretch holds of 30 s for any site that subjectively feels tight. Framed in app copy as "fine if you enjoy it, not required". Never prescribe post-session ice baths after strength sessions (Roberts et al. 2015: cold-water immersion blunts strength and hypertrophy adaptations). Coach messaging priority for recovery: food within 60-90 min, fluids, sleep. Those three outrank any cool-down ritual.

---

## A6. Encoding notes

- New workout-object fields: `prep` (array of {movement, dose}), `prep_duration_min`, `cooldown` (string), existing `warmup` segment unchanged.
- Prep selection function signature: `pickPrep(sport, session_intensity, athlete_age, tier, time_crunched: bool)` returning A4.0 minimal, sport DEFAULT, or sport FULL.
- Persona scoping: race-day warm-up TIMING tables remain in each persona doc. This doc owns movement content and durations only. Do not let triathlon race-warm-up factors leak into run/bike personas.
- Em-dash check: this document contains none. Maintain that in all generated Coach output.

End of Part A.
