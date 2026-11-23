import Mathlib

namespace Orientation904

-- Shard 1 uses these 23 undirected edges on the vertices numbered 0 through 12.
def edges : List (Nat × Nat) := [(3, 5), (4, 5), (2, 6), (4, 6), (1, 7), (3, 7), (6, 7), (1, 8), (2, 8), (5, 8), (0, 9), (2, 9), (3, 9), (0, 10), (1, 10), (4, 10), (0, 11), (6, 11), (7, 11), (0, 12), (5, 12), (8, 12), (11, 12)]

inductive Tree where
  | leaf (mask : Nat)
  | branch (a b : Nat) (backward forward : Tree)

def containsVertex (mask vertex : Nat) : Bool := mask.testBit vertex

def leafOK (mask : Nat) (arcs : List (Nat × Nat)) : Bool :=
  edges.all fun (a,b) =>
    !(containsVertex mask a && containsVertex mask b) &&
    (containsVertex mask a || containsVertex mask b ||
      arcs.any (fun (v,i) => (v == a || v == b) && containsVertex mask i))

def checked : Tree → List (Nat × Nat) → Bool
  | .leaf m, arcs => leafOK m arcs
  | .branch a b back fwd, arcs =>
    edges.contains (a,b) && checked back ((b,a)::arcs) && checked fwd ((a,b)::arcs)

def certificate : Tree :=
  (.branch 5 12
  (.branch 8 12
  (.branch 7 11
  (.branch 2 9
  (.branch 4 10
  (.branch 5 8
  (.branch 6 7
  (.branch 4 5
  (.branch 2 6
  (.leaf 1188)
  (.branch 2 8
  (.leaf 149)
  (.leaf 912)))
  (.leaf 1188))
  (.leaf 1188))
  (.branch 6 7
  (.branch 2 8
  (.branch 4 6
  (.leaf 912)
  (.branch 4 5
  (.leaf 149)
  (.leaf 1188)))
  (.leaf 912))
  (.leaf 912)))
  (.branch 2 8
  (.leaf 1188)
  (.branch 5 8
  (.leaf 1188)
  (.leaf 1920))))
  (.branch 4 10
  (.branch 4 5
  (.leaf 912)
  (.branch 5 8
  (.leaf 1696)
  (.leaf 912)))
  (.branch 1 10
  (.branch 1 7
  (.branch 5 8
  (.leaf 1696)
  (.leaf 1920))
  (.leaf 1696))
  (.leaf 1696))))
  (.branch 2 9
  (.branch 6 11
  (.branch 4 10
  (.branch 2 6
  (.branch 2 8
  (.leaf 3108)
  (.branch 5 8
  (.leaf 3108)
  (.leaf 2832)))
  (.branch 4 5
  (.branch 4 6
  (.leaf 2832)
  (.branch 2 8
  (.branch 6 7
  (.branch 1 10
  (.leaf 610)
  (.leaf 1632))
  (.branch 0 9
  (.leaf 401)
  (.leaf 912)))
  (.leaf 2832)))
  (.branch 1 10
  (.leaf 2086)
  (.leaf 3108))))
  (.branch 2 8
  (.leaf 3108)
  (.branch 5 8
  (.leaf 3108)
  (.leaf 3840))))
  (.branch 5 8
  (.leaf 3108)
  (.leaf 3840)))
  (.branch 4 10
  (.branch 5 8
  (.branch 4 5
  (.leaf 2832)
  (.leaf 3616))
  (.leaf 2832))
  (.branch 5 8
  (.leaf 3616)
  (.leaf 3840)))))
  (.branch 4 10
  (.branch 3 9
  (.branch 6 11
  (.branch 3 5
  (.branch 1 10
  (.leaf 4170)
  (.leaf 5192))
  (.branch 4 6
  (.branch 4 5
  (.branch 7 11
  (.leaf 4752)
  (.branch 11 12
  (.leaf 2078)
  (.leaf 4126)))
  (.branch 5 8
  (.branch 1 10
  (.leaf 610)
  (.leaf 1632))
  (.branch 7 11
  (.branch 3 7
  (.branch 0 9
  (.leaf 401)
  (.leaf 912))
  (.leaf 4752))
  (.branch 0 11
  (.branch 11 12
  (.leaf 2328)
  (.leaf 4126))
  (.leaf 2086)))))
  (.branch 1 10
  (.leaf 4170)
  (.leaf 5192))))
  (.branch 7 11
  (.branch 3 5
  (.branch 3 7
  (.branch 11 12
  (.leaf 2078)
  (.leaf 4126))
  (.branch 2 9
  (.leaf 4244)
  (.leaf 4752)))
  (.branch 1 10
  (.branch 2 9
  (.leaf 2086)
  (.leaf 2594))
  (.branch 2 9
  (.leaf 3108)
  (.leaf 3616))))
  (.branch 5 8
  (.leaf 3616)
  (.branch 11 12
  (.leaf 2328)
  (.branch 0 11
  (.branch 0 9
  (.branch 0 10
  (.branch 2 9
  (.branch 1 10
  (.leaf 2086)
  (.leaf 3108))
  (.branch 1 10
  (.leaf 2594)
  (.leaf 3616)))
  (.leaf 3336))
  (.leaf 2832))
  (.leaf 2328))))))
  (.branch 4 6
  (.branch 11 12
  (.branch 7 11
  (.leaf 4752)
  (.leaf 2832))
  (.leaf 4626))
  (.branch 6 11
  (.branch 1 10
  (.leaf 4674)
  (.leaf 5696))
  (.branch 11 12
  (.branch 7 11
  (.branch 1 8
  (.leaf 2578)
  (.leaf 2832))
  (.leaf 2832))
  (.branch 2 9
  (.branch 6 7
  (.leaf 5696)
  (.leaf 4752))
  (.leaf 4752))))))
  (.branch 3 9
  (.branch 3 7
  (.branch 11 12
  (.branch 6 11
  (.leaf 5192)
  (.leaf 3336))
  (.leaf 5132))
  (.branch 7 11
  (.branch 2 9
  (.leaf 5252)
  (.leaf 5760))
  (.branch 11 12
  (.branch 6 11
  (.branch 2 8
  (.leaf 3084)
  (.leaf 3336))
  (.leaf 3336))
  (.branch 1 10
  (.branch 6 7
  (.leaf 5192)
  (.leaf 5760))
  (.leaf 5192)))))
  (.branch 6 11
  (.branch 1 10
  (.branch 6 7
  (.leaf 5696)
  (.branch 4 6
  (.branch 5 8
  (.leaf 610)
  (.branch 1 8
  (.leaf 610)
  (.branch 0 10
  (.branch 0 9
  (.leaf 329)
  (.leaf 1856))
  (.leaf 1856))))
  (.leaf 4674)))
  (.leaf 5696))
  (.branch 1 10
  (.branch 5 8
  (.leaf 2594)
  (.branch 1 8
  (.leaf 2594)
  (.branch 2 9
  (.branch 2 8
  (.branch 7 11
  (.leaf 1188)
  (.leaf 2086))
  (.branch 0 11
  (.branch 0 9
  (.leaf 401)
  (.leaf 2832))
  (.leaf 2328)))
  (.leaf 2594))))
  (.branch 2 9
  (.branch 5 8
  (.leaf 3616)
  (.branch 7 11
  (.leaf 1188)
  (.leaf 3108)))
  (.leaf 3616)))))))
  (.branch 6 11
  (.branch 1 10
  (.branch 8 12
  (.branch 2 9
  (.branch 1 8
  (.branch 3 9
  (.leaf 4170)
  (.leaf 4674))
  (.branch 2 6
  (.branch 2 8
  (.branch 7 11
  (.leaf 5252)
  (.branch 11 12
  (.leaf 2078)
  (.leaf 4126)))
  (.branch 5 8
  (.branch 7 11
  (.branch 1 7
  (.branch 0 9
  (.leaf 99)
  (.leaf 610))
  (.leaf 5252))
  (.branch 0 11
  (.branch 11 12
  (.leaf 2086)
  (.leaf 4126))
  (.leaf 2086)))
  (.branch 3 9
  (.leaf 1352)
  (.leaf 1856))))
  (.branch 3 9
  (.leaf 4170)
  (.leaf 4674))))
  (.branch 1 7
  (.leaf 4674)
  (.branch 3 9
  (.branch 6 7
  (.leaf 4674)
  (.branch 7 11
  (.leaf 5760)
  (.branch 1 8
  (.leaf 4170)
  (.branch 2 6
  (.branch 5 8
  (.branch 3 5
  (.leaf 1352)
  (.branch 0 9
  (.leaf 99)
  (.leaf 610)))
  (.leaf 1352))
  (.leaf 4170)))))
  (.leaf 4674))))
  (.branch 6 7
  (.leaf 4674)
  (.branch 3 9
  (.leaf 4170)
  (.leaf 4674))))
  (.branch 3 9
  (.branch 8 12
  (.branch 2 6
  (.branch 2 9
  (.branch 5 8
  (.branch 0 10
  (.branch 0 9
  (.branch 0 12
  (.leaf 165)
  (.leaf 5252))
  (.branch 3 5
  (.leaf 1352)
  (.leaf 1632)))
  (.leaf 5252))
  (.leaf 1352))
  (.branch 6 7
  (.leaf 5696)
  (.branch 5 8
  (.branch 3 5
  (.leaf 1352)
  (.branch 0 9
  (.branch 0 10
  (.leaf 99)
  (.leaf 1632))
  (.leaf 1632)))
  (.leaf 1352))))
  (.leaf 5192))
  (.leaf 5192))
  (.branch 2 6
  (.branch 2 9
  (.branch 8 12
  (.branch 5 8
  (.branch 0 10
  (.branch 0 9
  (.branch 4 10
  (.branch 4 6
  (.branch 7 11
  (.leaf 165)
  (.leaf 2832))
  (.leaf 1856))
  (.leaf 1856))
  (.leaf 1632))
  (.leaf 1632))
  (.leaf 1856))
  (.leaf 5696))
  (.leaf 5696))
  (.leaf 5696))))
  (.branch 11 12
  (.branch 1 10
  (.branch 7 11
  (.branch 3 9
  (.branch 1 7
  (.branch 0 12
  (.branch 1 8
  (.leaf 2078)
  (.branch 2 9
  (.leaf 2086)
  (.leaf 2594)))
  (.branch 1 8
  (.leaf 2078)
  (.branch 8 12
  (.branch 2 6
  (.leaf 4126)
  (.leaf 4170))
  (.leaf 4170))))
  (.branch 3 5
  (.leaf 2078)
  (.branch 2 9
  (.leaf 2086)
  (.leaf 2594))))
  (.branch 1 8
  (.leaf 2578)
  (.branch 2 9
  (.branch 5 8
  (.leaf 2594)
  (.leaf 3840))
  (.leaf 2594))))
  (.branch 5 8
  (.leaf 2594)
  (.leaf 3840)))
  (.branch 3 9
  (.branch 3 5
  (.leaf 3084)
  (.branch 5 8
  (.leaf 3616)
  (.leaf 3336)))
  (.branch 5 8
  (.leaf 3616)
  (.leaf 3840))))
  (.branch 1 10
  (.branch 8 12
  (.branch 2 9
  (.branch 1 8
  (.branch 0 11
  (.branch 1 7
  (.leaf 4126)
  (.branch 3 9
  (.leaf 4170)
  (.leaf 4674)))
  (.branch 1 7
  (.leaf 2086)
  (.branch 7 11
  (.branch 3 5
  (.leaf 2078)
  (.leaf 2086))
  (.leaf 2086))))
  (.branch 2 6
  (.leaf 4126)
  (.branch 3 9
  (.leaf 4170)
  (.leaf 4674))))
  (.branch 1 7
  (.leaf 4626)
  (.branch 3 9
  (.branch 6 7
  (.leaf 4674)
  (.leaf 5760))
  (.leaf 4674))))
  (.branch 6 7
  (.leaf 4674)
  (.leaf 5760)))
  (.branch 2 9
  (.branch 2 6
  (.leaf 5132)
  (.branch 6 7
  (.leaf 5696)
  (.leaf 5252)))
  (.branch 6 7
  (.leaf 5696)
  (.leaf 5760)))))))

lemma sound (D : Nat → Nat → Prop)
    (orient : ∀ e ∈ edges, D e.1 e.2 ∨ D e.2 e.1)
    (t : Tree) (arcs : List (Nat × Nat))
    (known : ∀ e ∈ arcs, D e.1 e.2 ∧ (e ∈ edges ∨ e.swap ∈ edges))
    (valid : checked t arcs = true) :
    ∃ I : Finset Nat, (∀ i ∈ I, i < 13) ∧
      (∀ e ∈ edges, ¬ (e.1 ∈ I ∧ e.2 ∈ I)) ∧
      ∀ e ∈ edges, e.1 ∉ I → e.2 ∉ I →
        ∃ v i, (v = e.1 ∨ v = e.2) ∧ i ∈ I ∧ D v i ∧ ((v,i) ∈ edges ∨ (i,v) ∈ edges) := by
  induction t generalizing arcs with
  | leaf m =>
    let I := (Finset.range 13).filter (fun i => containsVertex m i = true)
    have memI (i : Nat) (hi : i < 13) : i ∈ I ↔ containsVertex m i = true := by simp [I, hi]
    have bounded : ∀ e ∈ edges, e.1 < 13 ∧ e.2 < 13 := by decide
    have hr := List.all_eq_true.mp (show leafOK m arcs = true from valid)
    refine ⟨I, ?_, ?_, ?_⟩
    · intro i hi
      exact Finset.mem_range.mp (Finset.mem_filter.mp hi).1
    · intro e he both
      obtain ⟨a,b⟩ := e
      have q := hr (a,b) he
      have bounds := bounded (a,b) he
      have ha := (memI a bounds.1).mp both.1
      have hb := (memI b bounds.2).mp both.2
      simp [ha,hb] at q
    · rintro ⟨a,b⟩ he ha hb
      have q := hr (a,b) he
      obtain ⟨ba,bb⟩ := bounded (a,b) he
      have na : containsVertex m a = false := by simpa [memI a ba] using ha
      have nb : containsVertex m b = false := by simpa [memI b bb] using hb
      simp [na,nb,List.any_eq_true] at q
      obtain ⟨v,i,hin,hv,hi⟩ := q
      obtain ⟨hd,hedge⟩ := known (v,i) hin
      have bi : i < 13 := hedge.elim (fun h => (bounded _ h).2) (fun h => (bounded _ h).1)
      exact ⟨v,i,hv,(memI i bi).mpr hi,hd,hedge⟩
  | branch a b back fwd ih0 ih1 =>
    simp only [checked, Bool.and_eq_true, List.contains_iff_mem] at valid
    obtain ⟨⟨he,h0⟩,h1⟩ := valid
    rcases orient (a,b) he with h | h
    · apply ih1 ((a,b)::arcs) _ h1
      intro e hmem
      rcases List.mem_cons.mp hmem with rfl | hmem
      · exact ⟨h,Or.inl he⟩
      · exact known _ hmem
    · apply ih0 ((b,a)::arcs) _ h0
      intro e hmem
      rcases List.mem_cons.mp hmem with rfl | hmem
      · exact ⟨h,Or.inr he⟩
      · exact known _ hmem

set_option maxRecDepth 100000 in
set_option maxHeartbeats 10000000 in
theorem shard_one (D : Nat → Nat → Prop)
    (orient : ∀ e ∈ edges, D e.1 e.2 ∨ D e.2 e.1) :
    ∃ I : Finset Nat, (∀ i ∈ I, i < 13) ∧
      (∀ e ∈ edges, ¬ (e.1 ∈ I ∧ e.2 ∈ I)) ∧
      ∀ e ∈ edges, e.1 ∉ I → e.2 ∉ I →
        ∃ v i, (v = e.1 ∨ v = e.2) ∧ i ∈ I ∧ D v i ∧ ((v,i) ∈ edges ∨ (i,v) ∈ edges) :=
  sound D orient certificate [] (by simp) (by decide)

end Orientation904
