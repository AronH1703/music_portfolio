import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["popup", "title", "links"];

  connect() {
    console.log("🎵 MusicPopupController is connected!");
  }

  open(event) {
    const song = event.currentTarget.dataset.song;

    const musicLinks = {

      "little-me": {
        title: "Little Me - Aron Hannes ft. Snny",
        links: {
          Spotify: "https://open.spotify.com/track/040XmcipGce3NYEKkJDgfa",
          "Apple Music": "https://geo.music.apple.com/nl/album/_/1796929157?app=music&at=1000lHKX&ct=linktree_http&i=1796929287&itscg=30200&itsct=lt_m&ls=1&mt=1",
          Deezer: "https://www.deezer.com/track/476188905",
          Tidal: "https://listen.tidal.com/album/418547352/track/418547353",
          "Amazon Music": "https://music.amazon.com/albums/B0DXJCLX4R?trackAsin=B0DXJ9KBC4"
        }
      },

      "child": {
        title: "Child - Aron Hannes",
        links: {
          Spotify: "https://open.spotify.com/track/4krgdvPJd5VaCqeVQ7pux3",
          "Apple Music": "https://music.apple.com/us/album/child/1702521356?i=1702521361",
          Deezer: "https://www.deezer.com/track/476188905",
          Tidal: "https://tidal.com/browse/track/310739997",
          "Amazon Music": "https://music.amazon.com/albums/B0CFM5H6QG"
        }
      },
      "those-were-the-times": {
        title: "Those Were The Times - INKT ft. Aron Hannes",
        links: {
          Spotify: "https://open.spotify.com/track/2vQwvuPDgsxyJyzsg8bKNG?si=f86bffca758347a2",
          "Apple Music": "https://music.apple.com/us/album/those-were-the-times-single/1699380849",
          Deezer: "https://deezer.page.link/HTzVk7THkqZ98qBV9",
          Tidal: "https://tidal.com/browse/track/307289435",
          "Amazon Music": "https://music.amazon.com/tracks/B0CCVR2SLY?marketplaceId=A3K6Y4MI8GDYMT&musicTerritory=NL&ref=dm_sh_x6K7RPbaKfzJU7Q57T9hxcVjI"
        }
      },
      "twenties-album": {
        title: "Twenties - Aron Hannes",
        links: {
          Spotify: "https://open.spotify.com/album/3udzLBW2ax27oLtvTEW2Ac?si=dHY1ua6GRcuEr6_c7fjONA",
          "Apple Music": "https://music.apple.com/us/album/twenties-ep/1642285479",
          Deezer: "https://deezer.page.link/WTZ3432eWX3USLuW6",
          Tidal: "https://tidal.com/browse/album/245472703",
          "Amazon Music": "https://music.amazon.com/albums/B0BC8L8G4R?marketplaceId=A3K6Y4MI8GDYMT&musicTerritory=NL&ref=dm_sh_kgctZjyJE4GqmR4HqRSt6XyJy"
        }
      }
    };

    if (!musicLinks[song]) return;

    this.titleTarget.innerText = musicLinks[song].title;
    this.linksTarget.innerHTML = "";

    Object.entries(musicLinks[song].links).forEach(([platform, url]) => {
      const li = document.createElement("li");
      const platformClass = platform.toLowerCase().replace(/\s/g, "-"); // Converts "Apple Music" → "apple-music"
      li.innerHTML = `<a href="${url}" target="_blank" class="platform-link ${platformClass}">${platform}</a>`;
      this.linksTarget.appendChild(li);
    });

    if (musicLinks[song]) {
      const moreLinksButton = document.createElement("button");
      moreLinksButton.innerText = "More Links";
      moreLinksButton.className = "more-links-button";
      moreLinksButton.onclick = () => {
        window.location.href = `/songs/${song}`;
      };
      this.linksTarget.appendChild(moreLinksButton);
    }

    this.popupTarget.style.display = "flex";
  }

  close() {
    this.popupTarget.style.display = "none";
  }
}
