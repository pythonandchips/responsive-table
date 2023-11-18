# frozen_string_literal: true

require "rails_helper"

RSpec.describe "AlbumsControllers", type: :request do
  include Rails.application.routes.url_helpers

  describe "PUT" do
    it "redirect to the referer with the new album id" do
      post(
        albums_path,
        params: {
          album: {
            artist: "Manic Street Preachers",
            name: "Generation Terrorists",
            release_date: "1993-10-30",
            sales: "100000",
            stars: "4.5"
          }
        },
        headers: {
          referer: albums_url(order: :artist)
        }
      )

      expect(response).to have_http_status(:redirect)

      album = Album.last
      expect(response).to redirect_to(
        albums_path(new_album_id: album.id, order: :artist)
      )
    end
  end
end
