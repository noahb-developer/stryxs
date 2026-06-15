# Race Result Projection: Defensible Methodology

Scope: convert synced training data (pace/speed, HR, power, cadence, distance, duration, splits, elevation) plus logged PBs and a goal race into a finish time and target pace per discipline. Every threshold is grounded in a named source. No em-dashes. Factor tables are scoped per discipline and must not leak across personas.

## Part 0: The shared engine (read first)

### 0.1 The three families of model, and where each is valid
| Model | Type | Best validity window | Breaks down |
|---|---|---|---|
| Daniels VDOT | Regression on %VO2max + economy | Running 1500m to ~HM | Optimistic at marathon for low-mileage; weak at mile (anaerobic) and ultra |
| Riegel power law `T2 = T1 * (D2/D1)^k` | Empirical (Riegel 1981) | Running ~3.5 min to ~4 h | Exponent NOT constant; collapses below 1500m and beyond ~4 h |
| Critical Power / Critical Speed `P(t) = CP + W'/t` | Mechanistic 2-param (Monod/Scherrer 1965; Hill 1993; Jones) | Any sport, ~2 to ~40 min maximal | Underestimates above CP duration unless W' well fit; assumes CP stationary |

Extremes (mile, ultra, Ironman bike) are exactly where you must NOT trust a single power-law extrapolation.

### 0.2 The pipeline (use everywhere)
1. Anchor = single best, recent, MAXIMAL fitness number (PB, or modeled threshold). A ceiling, not an average.
2. Distance conversion = move anchor to goal distance with the right model+exponent for that sport and level.
3. ONE correction stack = durability, terrain, environment, drafting, fueling, transitions applied exactly once. Do NOT stack a race factor on an anchor that is already a sustainable threshold.
4. Confidence band = widen by extrapolation distance, anchor age, missing durability data.

### 0.3 Hard rule: anchor from peaks, never from averages
A threshold modeled from average training (which includes easy/recovery) is a lowball. Always peak-detect: best 20-min power, fastest sustained 5 km, last-20-min HR of a TT. This single rule prevents most "projection reads too low" complaints.

## Part 1: Running
- VDOT default cross-distance currency 1500m to HM. Riegel default k=1.06 when level unknown.
- LTHR = avg HR of final 20 min of a 30-min solo TT (Friel).
- Mile: anchor from mile/1500 PB, else 400/800 reps -> vVO2max (mile ~105-110% vVO2max) -> 5K via VDOT (flag wide). Never extrapolate the mile from HM/marathon. Conf: direct +/-1-2%, from 5K +/-4-8%.
- 5K: VDOT gold standard; Riegel k=1.06. Conf +/-1-3%.
- 10K: VDOT; k=1.06. Conf +/-2-3%.
- Half: Riegel from 10K k=1.06-1.08; VDOT HM optimistic for amateurs. Durability real past 75-90 min, small 1-2% fade. Conf +/-2-4%.
- Marathon: VDOT/Riegel MOST overpredict. Use k=1.10-1.15 sub-elite, 1.06-1.08 only high-mileage. Durability is THE correction (decoupling, longest run vs 32 km, weekly volume). Fueling <60 g carb/h on 3h+ adds wall-risk fade. Heat steep. Conf first/thin +/-5-10%, durable +/-3-5%.
- Ultra: no clean speed anchor; recent ultra/long trail on similar terrain best. Riegel collapses past 4-6 h (k 1.2+). Use GAP (Minetti 2002), ~100 m climb ~0.6-1.0 km flat-equiv, hike above 15-20% grade. Conf +/-10-20%+, express as window.

## Part 2: Cycling
Power is the cleanest signal (direct mechanical output). Speed-only band 2-3x wider.
- FTP-target: anchor FTP (60-min direct -> 20-min x0.95 -> CP from 3+ efforts -> ramp ~75% 1-min peak). Read sustainable power for target DURATION off power-duration curve, then physics (mass, CdA, Crr, rho, gradient) to speed. Most accurate path in any sport. Durability: FTP fades with accumulated kJ. Conf +/-3-5% (recent FTP), +/-5-7% (sparse CP).
- TT: FTP/CP; 40 km ~90-100% FTP. CdA dominant. Conf +/-3-5% known CdA, +/-8% assumed.
- Gran fondo/century: IF 0.65-0.78 (100 mi 0.65-0.72). DRAFTING is the largest correction and the usual reason a solo projection reads too slow: group saves ~25-40% power. Conf +/-5-10% with group assumption stated.
- Speed-only (no power): speed at LTHR on flat windless solo only. Conf +/-10-15%; tell user a power meter is the biggest accuracy upgrade.

## Part 3: Swimming
- Pool CSS (Wakayoshi 1992): from 400m+200m TT, `CSS(m/s)=(400-200)/(t400-t200)`, `pace/100=(t400-t200)/2`. 200-1500 on the line; sprints faster (anaerobic); beyond ~1500 add +1-3 s/100 per doubling. Conf +/-2-4%.
- Open water: from pool CSS then correct. No walls ~+1-2 s/100; sighting cost + line inefficiency; wetsuit ~3-7% faster (~5-10 s/100, often offsets no-walls); draft on feet saves ~10-20%; chop/current/temp situational. Conf +/-4-8%.

## Part 4: Triathlon
Bike and run raced BELOW fresh single-sport bests: run never fresh (follows bike), bike capped to protect run, cumulative fatigue+fueling, durability. Per-leg pacing = % of open-discipline ability. Keep these tables scoped to tri personas only.

| Distance | Swim (% CSS) | Bike (IF, NP/FTP) | Run (% of fresh open pace) |
|---|---|---|---|
| Sprint | 95-100% | 0.90-0.95 | ~95-100% open 5K |
| Olympic | 90-95% | 0.80-0.88 | ~92-96% open 10K |
| 70.3 | 85-90% | 0.78-0.83 | ~88-92% open HM |
| Ironman | 80-85% | 0.68-0.75 | ~80-88% open-marathon equiv |

Transitions: fixed adds 30 s-4 min each. Brick: first 1-3 km off bike ~10-30 s/km slower, then settles; IM run most fade-prone (model: open-marathon-equiv pace -> tri-run % -> brick/durability fade scaled by bike IF). Race bike/run sits below training bests by design (FTP is fresh 60-min; IM bike is 5-6 h at low IF to bank glycogen).

## Part 5: Cross-cutting

### 5.6 Why a projection reads "too low", and the fix
| Cause | Why | Fix |
|---|---|---|
| Anchor diluted by easy sessions | threshold/FTP from average training | Peak-detect: best efforts only |
| Wrong percentage applied | IM IF on an Olympic, marathon fade on a half | Scope every factor table per persona+distance |
| Conservative factor stacked on conservative anchor | sustainable anchor x race factor x durability x environment | Anchor is a MAX, then ONE correction stack |
| Durability over-penalty | steep marathon fade on a durable high-mileage athlete | Scale fade by long-run history, volume, decoupling |

### 5.7 Reconciling with the training-trend chart
Trend chart shows easy/aerobic paces; projection is a threshold-derived max. They differ (correct), but UI must be legible: overlay recent BEST hard-effort pace next to projected race pace; normalize trend with GAP; never imply average training pace = race pace.

### 5.8 Explainability strings (templated from the factor that moved it most, no em-dashes)
See per-sport strings in the anchors doc Part C.

## Appendix A: Confidence bands (default +/- on finish time)
| Situation | Band |
|---|---|
| Recent PB at goal distance, matching conditions | +/-1-2% |
| Modeled from training threshold, same sport | +/-3-5% |
| Cross-distance extrapolation (Riegel/VDOT) | +/-3-8% (wider with distance) |
| Cycling speed-only (no power) | +/-8-15% |
| Ultra / first marathon / no durability data | +/-10-20%+ |

## Appendix B: Training-data cleanliness gates
| Signal | Gate |
|---|---|
| GPS pace | filter auto-pauses; prefer lap/segment splits; moving time |
| HR | account for lag/drift/heat ceiling; LTHR=final-20-min avg of 30-min TT |
| Power | require zero-offset calibration; don't mix uncalibrated trainer power |
| Anchoring effort | must be maximal/near-maximal; pure easy data cannot anchor a threshold |

## Appendix C: Default constants block
```
RIEGEL_K:        { elite: 1.05, trained: 1.06, recreational: 1.08, marathon_subelite: 1.12 }  // DEFAULT 1.06
VDOT_RANGE:      1500m .. half_marathon  // outside: flag
CSS_FORMULA:     (D2 - D1) / (T2 - T1)   // 400/200 TT, m/s
FTP_FROM_20MIN:  0.95
CP_MODEL:        P(t) = CP + W'/t        // fit >= 3 maximal efforts
TRI_BIKE_IF:     { sprint:[0.90,0.95], olympic:[0.80,0.88], halfim:[0.78,0.83], ironman:[0.68,0.75] }
TRI_SWIM_CSS:    { sprint:[0.95,1.00], olympic:[0.90,0.95], halfim:[0.85,0.90], ironman:[0.80,0.85] }
HEAT_FADE:       ~ +2-3% pace per 5C above ~15C optimal (steeper in extreme heat)
ALTITUDE:        VO2max -1-2% per 300m above ~1500m
WETSUIT_CREDIT:  3-7% faster (~5-10 s/100m)
DRAFT_SAVING:    bike 25-40% power; swim feet 10-20% energy
```

KEY ENCODE NOTE (the bike "reads too low" bug): the tri/cycling bike % (IF) is on POWER, not speed. Power scales ~cube of speed, so a 0.70 IF does NOT mean 0.70 x FTP-speed. Apply the fraction to power (IF x FTP), then run the physics solver for speed. Worked: 175 W (0.70 of 250 FTP) -> 32.9 km/h, vs ~36.9 km/h at full FTP (only a few % slower, NOT 30% slower). Speed-only fallback (no power) uses the wide-band path and must be flagged.

Build order: lock anchor + peak-detection first (kills "reads too low"), then per-sport conversion, then ONE correction stack, then confidence band.
