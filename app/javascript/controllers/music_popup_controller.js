import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["popup", "title", "links"];

  connect() {
    console.log("🎵 MusicPopupController is connected!");
  }

  open(event) {
    const song = event.currentTarget.dataset.song;

    const musicLinks = {
     "child": {
        title: "Child - Aron Hannes",
        links: {
          Spotify: "https://open.spotify.com/track/4krgdvPJd5VaCqeVQ7pux3",
          "Apple Music": "https://music.apple.com/us/album/child/1702521356?i=1702521361",
          Deezer: "https://www.deezer.com/track/476188905",
          Tidal: "https://tidal.com/browse/track/310739997",
          "Amazon Music": "https://music.amazon.com/albums/B09KQ9QX4D"
        }
      },
      "those-were-the-times": {
        title: "Those Were The Times - INKT ft. Aron Hannes",
        links: {
          Spotify: "https://open.spotify.com/track/example",
          "Apple Music": "https://music.apple.com/us/album/example",
          Deezer: "https://www.deezer.com/track/example",
          Tidal: "https://tidal.com/browse/track/example",
          "Amazon Music": "https://music.amazon.com"
        }
      },
      "twenties-album": {
        title: "Twenties - Aron Hannes",
        links: {
          Spotify: "https://open.spotify.com/album/example",
          "Apple Music": "https://music.apple.com/us/album/example",
          Deezer: "https://www.deezer.com/album/example",
          Tidal: "https://tidal.com/browse/album/example",
          "Amazon Music": "https://music.amazon.com"
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

    this.popupTarget.style.display = "flex";
  }

  close() {
    this.popupTarget.style.display = "none";
  }
}
