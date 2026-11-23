// L-meta-904, shard 1. Bit i selects the listed direction of edge i.
const N: usize = 13;
const EDGES: [(usize,usize);23] = [(3,5),(4,5),(2,6),(4,6),(1,7),(3,7),(6,7),(1,8),(2,8),(5,8),(0,9),(2,9),(3,9),(0,10),(1,10),(4,10),(0,11),(6,11),(7,11),(0,12),(5,12),(8,12),(11,12)];

struct Candidate {
    // (outside vertex, incident edge index, listed direction points into I)
    arcs: Vec<(usize,usize,bool)>,
    outside_edges: Vec<(usize,usize)>,
}

fn candidates() -> Vec<Candidate> {
    let mut result = Vec::new();
    for set in 0u32..(1<<N) {
        let inside = |v| set & (1u32 << v) != 0u32;
        if EDGES.iter().any(|&(a,b)| inside(a) && inside(b)) { continue; }
        // Any solution extends to a maximal independent solution: existing
        // absorption witnesses stay in the set, and fewer outside edges remain.
        if (0..N).any(|v| !inside(v) && !EDGES.iter().any(|&(a,b)|
            (a==v && inside(b)) || (b==v && inside(a)))) { continue; }
        let mut c = Candidate { arcs: Vec::new(), outside_edges: Vec::new() };
        for (j,&(a,b)) in EDGES.iter().enumerate() {
            if inside(a) { c.arcs.push((b,j,false)); }
            else if inside(b) { c.arcs.push((a,j,true)); }
            else { c.outside_edges.push((a,b)); }
        }
        result.push(c);
    }
    result.sort_by_key(|c| c.outside_edges.len());
    result
}

fn main() {
    let sets = candidates();
    let mut bits = [0u64;23];
    for j in 0..6 {
        for k in 0..64 {
            if (k >> j) & 1 != 0 { bits[j] |= 1u64 << k; }
        }
    }
    let mut examined = 0;
    for base in (0u32..1<<EDGES.len()).step_by(64) {
        for j in 6..EDGES.len() { bits[j] = if (base>>j)&1!=0 { u64::MAX } else { 0 }; }
        let mut remaining = u64::MAX;
        for c in &sets {
            let mut absorbed = [0u64;N];
            for &(v,j,forward) in &c.arcs {
                absorbed[v] |= if forward {bits[j]} else {!bits[j]};
            }
            let mut good = remaining;
            for &(a,b) in &c.outside_edges { good &= absorbed[a] | absorbed[b]; }
            remaining &= !good;
            if remaining==0 { break; }
        }
        if remaining!=0 {
            println!("counterexample orientation {}",base+remaining.trailing_zeros());
            return;
        }
        examined+=64;
    }
    println!("exhausted {} orientations, {} maximal independent sets, zero counterexamples",examined,sets.len());
}
