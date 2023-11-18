# frozen_string_literal: true

class Album < ApplicationRecord
  validates :artist, :name, :release_date, :stars, :sales, presence: true

  normalizes :artist, :name, with: -> str { str.strip }
  normalizes :artist, :name, with: -> title { formalize(title) }


  private

  def self.formalize(title)
    return title unless title =~ /\A(The|A)/i

    [
      title.titleize.gsub(/\A(The|A)/i, "").strip,
      "(#{$1})"
    ].join(" ")
  end
end
