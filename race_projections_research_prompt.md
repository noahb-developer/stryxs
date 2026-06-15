# Stryxs — Race Projections Research Prompt

Noah: paste ROUND 1 into a fresh research chat, then ROUND 2. Paste both answers back to me and I'll encode them precisely into the projection engine (the deterministic `compute*Projection` functions in the coach edge), with unit tests. Same workflow as the coach-persona research.

Goal: race projections that are PRECISE and EXPLAINABLE. People check them constantly for reassurance about progress, so they must (a) reflect real fitness, (b) not read low/wrong for the paces someone is actually holding, and (c) come with a plain-language "why". No em-dashes in any user-facing copy.

---

## ROUND 1 — Methodology (how projections SHOULD be computed, per sport)

You are a sports scientist + endurance coach. For an app that predicts an athlete's race result from their training data (synced workouts: pace/speed, HR, power, cadence, distance, duration, splits, elevation) plus any logged PBs and a goal race, define the CORRECT, defensible way to project a finish time / race pace for each case below. Cite the established model where one exists (Daniels VDOT, Riegel endurance exponent, Critical Power / Critical Swim Speed, Coggan power-duration, Friel/Sutton tri pacing, etc.) and say where each breaks down.

For EACH discipline, answer:
1. **Anchor**: what's the single best fitness anchor (a recent PB? a modeled threshold from training? CSS/FTP/VDOT?), and the fallback order when the best anchor is missing (e.g. no PB -> model from training paces at known HR).
2. **Distance conversion**: how to convert the anchor to the goal distance (e.g. Riegel `T2 = T1 * (D2/D1)^k` -> what k per sport/level? VDOT equivalent tables? CSS fade for long swims?).
3. **Correction factors** and realistic magnitudes for each: fatigue/freshness, endurance durability (decay over long distance), terrain/elevation, environment (heat, wind, altitude), course type, drafting (tri/cycling), fueling, and (tri) transitions + the brick effect (run off the bike).
4. **Training-data-only path**: if the athlete has NO race PB, how to estimate the anchor from training (e.g. aerobic speed at a given % LTHR, threshold from a tempo session, best 20-min power -> FTP). How clean must the data be?
5. **Confidence/range**: how to express uncertainty (a +/- band) and what shrinks it.

Disciplines to cover:
- **Running**: 5K, 10K, half, marathon, the mile (anaerobic/speed-biased), and ultra (time-on-feet + vert).
- **Cycling**: time trial, gran fondo / century, FTP-target. Power-based vs speed-only (no power meter).
- **Swimming**: pool (per-100m at distance) and open water (sighting/no-walls/wetsuit).
- **Triathlon**: Ironman, 70.3, Olympic, sprint — per-leg pacing (% of open-discipline ability), transitions, and why the race bike/run pace sits BELOW fresh training bests.

Then answer the cross-cutting questions:
6. **Why projections can read "too low"**: common reasons a projection understates a fit athlete (anchor diluted by easy sessions, wrong % applied, conservative race factor, durability over-penalty). How to avoid each.
7. **Reconciliation**: how the race projection should relate to a simple "training pace/speed trend" chart so the two don't look contradictory to the user.
8. **Explainability**: for each projection, the 1-2 line "why" the app should show (which factors moved it).

## ROUND 2 — Numbers + unit-test anchors (so I can encode + verify)

Now give the ENCODABLE specifics:
- Exact constants: Riegel k per sport/level; VDOT or equivalent conversion points; CSS fade coefficients; tri race-pace % of open ability (swim/bike/run, per IM/70.3/Olympic/sprint); cycling sustainable %FTP by duration; terrain/heat/wind multipliers with ranges.
- The fallback defaults when data is missing (per experience tier + sex where relevant).
- 8-15 WORKED EXAMPLES per discipline as `input -> expected output` anchors I can unit-test against (e.g. "Run: 5K PB 20:00, intermediate -> marathon ~3:14 (Riegel k=1.06)"; "Tri: aerobic bike 28.5 km/h, IM -> race 26.9 km/h via 0.97 factor, 180K in ~6:41"). Include at least one no-PB / training-data-only example per sport.
- For each, the one-line user-facing "why" string (no em-dashes).

Keep every number defensible and cite the source/model. Flag anything you're estimating vs established.
