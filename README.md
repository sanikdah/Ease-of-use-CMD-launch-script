# About the project

This is just something I whipped up when I just wanted to make a script  
that would turn the text color of my Command Prompt to terminal green  
whenever I launch the Command Prompt. This is nothing fancy currently,  
lacking a good menu, completely lacking a help screen, and only having  
a placeholder tutorial.

# Warning

This project is still in beta and many things (especially the debug menu)  
are dangerous to either the script, your PC, or both.

# Setup

## Installing

### 1. Downloading

You will typically want to download the version from the releases section,  
as these are garunteed to at least work. However you can also get it directly  
from the source, for the essentially "beta" version. These might have more  
features that aren't in the latest release, typically because they are unfinished.

### 2. Installation

Now that you have the script downloaded, launch the script, and go through the  
[first time setup](#First-Time-Setup).

## Customization

### 1. Ease of use (Part 1)

Now that you have launched the script, you can safely delete the downloaded file.  
You should now set it up for better ease of use.

### 2. Ease of use (Part 2, warning for setting up auto-run)

For launching the script easier, I included 2 (DANGEROUS!) methods that you can use.  
NOTE: You use these methods at your own risk, as they involve basic modification of the system.  
I have tested both, and I can confirm that they do not break anything (major).  
The safer option is likely the best one to go with, as it involves launching the script  
via a command, rather than launching automatically whenever you load a Command Prompt window.  
That more dangerous option will break any other batch scripts that run.

### 3. Ease of use (Part 3, actually setting it up)

If this is your first time launching the program, you can set it up from the first time setup.  
For the rest of you who have been using this program already, you can go to Settings (8) and  
Auto-Run (3) to enter the auto-run settings menu.

### 4. Ease of use (Part 3, actually setting it up 2)

Now that you are in that menu, I highly recommend that you choose the safer option,  
as this involves adding it to the system PATH, which is 10x safer than the more dangerous option.  
Anyways, to use the [safer](#5-The-much-safer-way) option, press <kbd>S</kbd>, to use the more [dangerous](#6-The-more-dangerous-way) option (and please don't),  
press <kbd>D</kbd>.

### 5. The much safer way

I highly recommend creating a system restore point at this time, so that just in case something  
happens to go wrong while doing this (it really shouldn't but just to be safe), for convinience,  
an option to open the system restore GUI is built in to this menu, I HIGHLY recommend using it,  
and following the instructions to create a restore point before attempting this. You can open  
the GUI by pressing <kbd>S</kbd>.

### 5. The much safer way **2**

Now that you (hopefully) have a system restore point, you can continue setting it up,  
To advance to the next screen, press <kbd>C</kbd>. Wait for it to finish,  
(it includes an intentional extrememly long delay so the nobody can sue me because,  
say, they ran it on an ancient PC with barely enough CPU to run windows, it delays  
for long enough that there is no potentintial way that everything isn't updated  
before setting the variable.) and then once it is done, save any unsaved work,  
and restart your PC. You can then run it by typing `AutoRunWithCMD` (not case sensitive).  
You can [change](#Change-the-name-of-the-script) this command later on.

### 6. The more dangerous way

Should you ever want to have the script run automatically with Command Prompt,  
and please don't, here's how you can do that! Make sure that you did [Installing](#installing) [1](#1-downloading)-[2](#2-installation),  
and [Customization](#customization) [1](#1-ease-of-use-part-1)-[4](#4-ease-of-use-part-3-actually-setting-it-up-2). Then rather than pressing <kbd>S</kbd> when it asks you which method to use,  
press <kbd>D</kbd>.

# Parts of the program

## First time setup

This is what happens when you open the program and the data folder for the program doesn't exist.  
Here you can set up the auto run settings, and view a tutorial, that's all that it is for now.
