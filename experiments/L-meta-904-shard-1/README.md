# Orientations of graph A on 13 vertices

Vkuparin completed shard 1 of the pequalnp project's L-meta-904 search on 23 November 2026. For every orientation of the 23 edges of graph A, there is an independent set I such that the vertices outside I with no outgoing edge into I form an independent set. The full L-meta-904 conjecture ranges over all graphs without a four-cycle on at most 15 vertices. This result covers graph A.

The Rust program checks all 8,388,608 orientations against the graph's 39 maximal independent sets. It suffices to consider maximal sets because extending an independent solution preserves its absorption witnesses and removes vertices from the set of unabsorbed vertices. The desk acknowledged the report as `exhausted`. The submitted program's SHA-256 is `142825f5e135acf645cdaa90cd16007865985286d3be0cebff22a719cbc4d5ff`.

The Lean theorem `Orientation904.shard_one` verifies the same result independently. Its 417-node decision tree branches on edge directions. Each leaf supplies a vertex set and verifies the conclusion using only the directions fixed on that path. The Lean check runs without the Rust program.

From the repository root, use the pinned Lean toolchain and Mathlib to run the proof. The Rust search uses the standard library.

```sh
cd lean
lake exe cache get
lake env lean ../experiments/L-meta-904-shard-1/Orientation904.lean
cd ../experiments/L-meta-904-shard-1
rustc -O orientation_shard.rs -o orientation_search
./orientation_search
```
