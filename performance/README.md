# Assignment 1: Frogger Optimization

Optimized game located at http://adempsey.github.io/frogger

### Optimization Techniques

- Combined all images into single sprite sheet
- Compressed images and audio files
- Removed jQuery file
- Added JavaScript links to bottom of body instead of head
- Compressed all code using Minifiers 
- Utilizes HTML5 offline application cache

### Offline Application Cache

To use the offline application cache, the HTML tag was edited to include the manifest attribute as follows: 

	<html manifest="cache.manifest">
	
A manifest file located in the game's root directory called "cache.manifest" was created, with content:

	CACHE MANIFEST
	style.css
	game.js
	assets/dead.mp3
	assets/jump.mp3
	assets/win.mp3
	assets/frogger_sprites.png
	
which represent the entirety of the game's static content files.

To ensure the cache was working, the page was first loaded, and then the computer was disconnected from the internet. The page was then refreshed, and the game still continued to function, thus showing that the offline application cache was active and functioning.

### Tools

The application was initially tested using Yahoo!'s YSlow Chrome extension. However, YSlow gave the unoptimized application an 'A' grade; the only suggestions provided were to 1. Use a CDN (not applicable) and 2. Add Expiry Headers (hosted on Github web hosting; no access to server configuration). Thus, YSlow was not particularly helpful.

Other data collection was conducted through Chrome Developer Tools.

### Performance
**Pre-Optimization (no files cached):**

- **Requests**: 13
- **Data Transferred**: 189 KB

**Post-Optimization (no files cached):**

- **Requests**: 10
- **Data Transferred**: 30.7 KB

Data transfer was reduced by roughly 83% from optimization.

### Issues

At the moment, the application still has to load three separate audio files, all of which are fairly small. Most likely, these audio files could be combined into one, and then JavaScript logic could isolate the cues at which each sound should be played. This would save loading time, but may result in decreased runtime performance while playing. Because sounds need to be played very quickly and often, having to execute extra code to find the proper place to play and where to stop produces overhead that may impede game performance. Thus, this optimization was not included in order to save game performance at the potential expense of loading performance.