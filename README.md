# Space Monkey

Design Document  
2024 Hackathon, by team Exo Scouts

[**Introduction**](#heading)	

[Game Summary](#game-summary-pitch)	

[Player Experience](#player-experience)

[Development Software](#development-software)	

[Genre](#genre)	

[Target Audience](#target-audience)	

[**Concept**](#concept)	

[Gameplay overview](#gameplay-overview)	

[Theme Interpretatio](#theme-interpretation-\(the-discovery-of-exoplanets\))n (Discovery of Exoplanets)         	

[Primary Mechanics](https://docs.google.com/document/d/1J5i4xsYPA68tg5GUW3fNO0dxXLoNTGQLEdolEjADlFY/edit#heading=h.jcjh7x82c5yt)	

[**Art**](#art)	

[Theme Interpretation](https://docs.google.com/document/d/1J5i4xsYPA68tg5GUW3fNO0dxXLoNTGQLEdolEjADlFY/edit#heading=h.d6rhu12civ1h)	

[Design](#design)	

[**Audio**](#audio)	

[Music](#music)	

[Sound Effects](#sound-effects)	

[**Game Experience**](#game-experience)	

[UI](#ui)	

[Controls](#controls)	

**Development Timeline**	

**Links, References and Tools**	

Journal Articles

Online Resources

##  {#heading}

## **Introduction**

### **Game Summary Pitch** {#game-summary-pitch}

	Space Monkey is a short, arcade video game where the player controls a space faring monkey on his spaceship, trying to uncover new Exoplanets via minigames.

### **Player Experience** {#player-experience}

The main gameplay loop consists of the player going into the ship’s terminal and choosing which star system to explore, then, ‘detect’ the planets in said star system via a minigame, into another minigame to ‘discover’ and register the new exoplanet in the monkey’s Planet Book.

### **Development Software** {#development-software}

- Godot Game Engine (for the video game)  
- GIMP, Pixilart (for the art)

### **Genre** {#genre}

Single-player, arcade, minigames

### **Target Audience** {#target-audience}

The game is targeted for young children, mostly in the **elementary school level**, so the experience is meant to have simple mechanics, and easy to understand ideas.

## **Concept** {#concept}

### **Gameplay overview** {#gameplay-overview}

The player controls a monkey in its spaceship, where he can interact with a Terminal, or a Planet Book; the Terminal allows the monkey to explore star systems, detect new planets and uncover them, and finally registering said data in its Planet Book.  
The Planet Book functions as a progress gauge for the player, as well as the main source of information on these exoplanets, as once they are discovered by the monkey all the relevant data is put into the Planet Book.

### **Theme Interpretation (The discovery of Exoplanets)** {#theme-interpretation-(the-discovery-of-exoplanets)}

The game’s minigame for discovering new planets is meant to mirror the real life way of discovering new exoplanets, where scientists notice spots in the selected star and check if the spots are created by the star’s light casting a shadow due to the space the exoplanet occupies.

### **Primary Mechanics**

**Lobby**  
The player will stay in the spaceship lobby, and here he can interact with the terminal  
**Star Map**  
The player will see this screen once interacted with the terminal; the player will click any star system.  
**Planet Detection**  
The player will zoom in to the selected star and press a key to “detect” (render next scene) new planets  
**Planet Discover**   
The Planet Discover scene will trigger a minigame of the zoomed in star and the orbiting planet, and the player has to press Space when the orbiting planet is dead center on the star.  
After that, the next scene would be a close up of the planet, and a prompt saying to check your planet book.

**Planet Book**  
The planet book will show the discovered planets, general information, a detailed picture drawn by Space Monkey, and a fun fact.   
Undiscovered planets would not appear as entries

## **Art** {#art}

### **Design** {#design}

Minimalistic, simple and vibrant pixel art, we want a clean look with proper contrast to bring out the characteristics of each planet, as well as being attractive to our young players that would be playing Space Monkey.

## **Audio** {#audio}

### **Music** {#music}

The music would be lo-fi, bright notes so to evoke the mystifying feeling of space, and to not distract the player from the time-sensitive minigames. 

### **Sound Effects** {#sound-effects}

The sound effects would be simple notes on minigame success and fails, and on button presses, with the intention to fortify the feeling of immersion and grant some feedback on user input.

## **Game Experience** {#game-experience}

### **UI** {#ui}

###     High definition, solid colors' pixel art, the aim is to not overwhelm the eyes but put emphasis exactly where we want it, for example, the planets, the stars, etc.

### **Controls** {#controls}

**Keyboard**  
	Mouse, space bar, arrow keys, E key.

**Development Timeline**  
**Main Loop**  
**Lobby**  
**The player will move in a horizontal plane on a spaceship, from left to right, with the respective arrow key, and will be able to interact with either ‘Terminal’ or ‘Planet book’.**  
**Interacting with either will start a respective new loop for each gameplay element.**  
**In essence:**

- **Player moves left to right with arrow keys**  
- **When near an interactable object, render a ‘Interact to Open’ prompt**  
- **Interacts with ‘Terminal’ or ‘Planet Book’ when near and pressing a key.**  
- **Interacting with either takes you to the next scene and starting ‘Terminal’ loop or ‘Planet Book’ loop.**

		**IF EXTRA:**

- **When near lobby door, render prompt to exit game**  
- **When pressing a key near door, exit game**

**Terminal Loop**  
**1st Scene, Star map**  
**The terminal will render a star map, a rectangle with star systems shown in yellow or other bright colors, and white stars in the background.**   
**The player clicks any star to select which system to ‘explore’.**  
**Clicking on interactable star takes you to its respective star system, with no planets discovered.**  
**In essence:**

- **On start, render an image of interactable stars, with a black background with white dots.**  
- **Render “back” button, to go back to \[Lobby Loop\].**  
- **Initialize choice of star variable to switch on \[Star Discover Loop\]**  
- **Star map loop ends and starts \[Star Discover Loop\]**

**2nd scene, Star Discover Loop**  
**The terminal scene will change to the star and a prompt “Press D to detect new planets” where a minigame consisting of an oscillating up and down line in a vertical rectangle asks you to press space bar when the line is in the center of the rectangle.**  
**On planet discover, the scene takes you to a plane where the planet (a dot) circles around the star, and a minigame starts.**

**In essence:**

- **Use choice of planet variable**  
- **Render star, star name, and detect new planets prompt**  
- **On D key press, start \[Star Discover Minigame\]**  
  - **Star Discover Minigame: A line oscillating up and down on a vertical rectangle; the player must press space bar when the line is in the center of the rectangle.**  
- **On minigame success, start \[Planet Discover\] scene**

	**3rd Scene, Planet Discover scene**  
	**The terminal scene will change to the star and an oscillating dot (the planet) where the player will have to press space bar when the dot is completely in the center of the star.**  
	**On minigame success, show “You discovered a planet\! Check your notes” prompt on screen.**

	**In essence:**

- **On loop start, render image of star in background.**  
- **Render oscillating dot (planet)**  
- **Start logic of dot circling**  
- **When dot is on center and space bar is pressed, show star drawing and “You discovered a new planet” prompt. (When star and planet collide)**  
- **On new planet discover SUCCESS, start new planet discover.**  
- **Rewrite planet variable for {Planet Book Dictionary}**  
- **This repeats until system is complete or user quits out**  
- **When system is complete, go back to terminal**  
- **Mark star system as complete on terminal**

**Planet Book Loop**  
**Planet Book, on interact**  
	**When interacted by the player, open the Planet Book, the planet book consists of a cover, a summary of contents, general information, and finally information about each discovered planet.**  
	**The book will be opened on the cover and the summary of contents**  
	**The book will be able to cycle through pages with the arrow keys or arrow buttons**  
**The summary of contents titles will be clickable**

**In essence:**

- **On interact, start \[Planet Book\]**  
- **\[Planet Book\] will be open on page 0 and 1; cover and summary of contents**  
- **The \[Planet Book\] will have a ‘dictionary’, where all boolean variables reside; each planet holds a boolean that changes from false to true on Planet Discover.**  
- **The book will render images for each page**  
- **The planets’ information will be a drawing of the planet, and general characteristics.**

**Links, References and Tools**

**Journal Articles**

1\. Batalha, N. M., et al. (2013). Kepler's planet-detection mission: Progress in

the first three years. The Astrophysical Journal, 172(3), 217\.

2\. Bonfils, X., et al. (2015). An Earth-sized planet with a dense atmosphere

around GJ 1132\. Nature, 529(7585), 75-78.

3\. Callanan, P. J., et al. (2007). The discovery of the planetary companion to 55

Cancri f. Astronomy & Astrophysics, 467(2), 1007-1015.

4\. Cloutier, R., et al. (2020). The mass and radius of GJ 1132 c: A super-Earth.

Astronomy & Astrophysics, 644, A118.

5\. Doyle, L. R., Fabrycky, D. C., Carter, J. A., Ghosh, S., & Pineda, J. (2011).

Kepler-16: A transiting circumbinary planet. Science, 333(6049), 1602-1606.

6\. Demory, B.-O., et al. (2014). Kepler-186 e: A second Earth in the habitable

zone. The Astrophysical Journal, 789(1), 12\.

7\. Fischer, D. A., Valenti, J., & Howard, A. W. (2002). The 55 Cancri system: A

multi-planet system. The Astrophysical Journal, 570(1), 423-434.

8\. Guillot, T., & Showman, A. P. (2002). Evolution of “51 Pegasus b-like”

planets. Astronomy and Astrophysics, 385(1), 156–165.

https://doi.org/10.1051/0004-6361:20011624

9\. Mayor, M., & Queloz, D. (1995). A Jupiter-mass companion to a solar-type

star. Nature, 378(6555), 355-359.

10\. McArthur, B. E., Benedict, G. F., & Nelan, E. P. (2004). The 55 Cancri

system: A multi-planet system. The Astrophysical Journal, 614(1), L81-L84.

11\. Muirhead, P. S., et al. (2015). Characterizing the Kepler-186 system: A

multispecies planetary system. The Astrophysical Journal, 801(1), 12\.

12\. Quintana, E. V., et al. (2014). An Earth-sized planet in the habitable zone of

a cool star. Science, 344(6181), 277-280.

13\. Winn, J. N., et al. (2014). The hot super-Earth 55 Cancri e. The

Astrophysical Journal, 787(2), 85\.

14\. Wu, Y., et al. (2015). Characteristics of the Kepler-186 f planet. The

Astrophysical Journal, 810(1), 12\.

**Online Resources**

Eyes on Exoplanets \- NASA/JPL. (2024). Nasa.gov.

https://eyes.nasa.gov/apps/exo/\#/

Eyes on Exoplanets \- NASA/JPL. (2024). Nasa.gov.

https://eyes.nasa.gov/apps/exo/\#/system/Kepler-16

Eyes on Exoplanets \- NASA/JPL. (2024). Nasa.gov.

https://eyes.nasa.gov/apps/exo/\#/system/55\_Cnc

Eyes on Exoplanets \- NASA/JPL. (2024). Nasa.gov.

https://eyes.nasa.gov/apps/exo/\#/system/Kepler-186

Eyes on Exoplanets \- NASA/JPL. (2024). Nasa.gov.

https://eyes.nasa.gov/apps/exo/\#/system/51\_Peg

Eyes on Exoplanets \- NASA/JPL. (2024). Nasa.gov.

https://eyes.nasa.gov/apps/exo/\#/system/GJ\_1132

Exoplanets \- NASA Science. (2023, June 7). Nasa.gov.

https://science.nasa.gov/exoplanets/

