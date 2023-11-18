# frozen_string_literal: true

Album.create!(
  artist: "R.E.M",
  name: "Automatic for the People",
  release_date: Date.new(1992, 10, 5),
  sales: 2_270_332,
  stars: 5
)
Album.new(
  artist: "Jeff Buckley",
  name: "Grace",
  release_date: Date.new(1994, 8, 23),
  sales: 600_000,
  stars: 4
)
Album.create!(
  artist: "Nick Cave and the Bad Seeds",
  name: "Boatman's Call (The)",
  release_date: Date.new(1997, 3, 3),
  sales: 100_000,
  stars: 4.5
)
Album.create!(
  artist: "Garbage",
  name: "Version 2.0",
  release_date: Date.new(1998, 5, 11),
  sales: 579_912,
  stars: 4
)
Album.create!(
  artist: "Blur",
  name: "Parklife",
  release_date: Date.new(1994, 4, 25),
  sales: 1_143_785,
  stars: 5
)
