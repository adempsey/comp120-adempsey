# Assignment 1: Frogger Optimization

### Optimization Techniques

- Combined all images into single sprite sheet
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

### Tools

The application was initially tested using Yahoo!'s YSlow Chrome extension. However, YSlow gave the unoptimized application an 'A' grade; the only suggestions provided were to 1. Use a CDN (not applicable) and 2. Add Expiry Headers (hosted on Github web hosting; no access to server configuration). Thus, YSlow was not particularly helpful.

Other data collection was conducted through Chrome Developer Tools.

### Performance
**Pre-Optimization:**

- **Requests**: 13
- **Data Transferred**: 189 KB

**Post-Optimization:**

- **Requests**: 12
- **Data Transferred**: 143 KB

Data transfer was reduced by roughly 25% from optimization.

### Issues

Unfortunately, despite making fewer requests and, overall, having less data to transfer, the post-optimization version of the game ocasionally still took longer to load than the pre-optimization. Given that the original total filesize of the game was 189 KB, the optimizations become negligible at the hands of server performance. Because the game is hosted on Github's web hosting, there were not optimizations available to be made at this point. As a result, the optimizations, while good practice, did not necessarily produce a significant result with this application.
