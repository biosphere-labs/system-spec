// Alloy 6: relations and rules only. Field types live in domain/schemas.
sig User {}
sig Item { owner: one User }

-- INV_every_item_has_one_owner: every item belongs to exactly one user.
fact INV_every_item_has_one_owner { all i: Item | one i.owner }
