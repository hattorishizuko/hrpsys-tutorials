Þ          ¼       \      \     ]     m  	     C     6   Ø  M     0   ]       I     L   f  T   ³          &  6   D     {       )        É  H   Û    $  	   ¤  %   ®     Ô  J   Ü  A   '  X   i  Q   Â  Õ     A   ê  M   ,	  q   z	  3   ì	  -    
  A   N
  '   
  $   ¸
  ;   Ý
       g   3   Advanced Topics Below is the example script: Contents: Create rotation joint and set each physical properties (line 13-19) Create second cube connected to the joint (line 20-22) Create the body model by using cube primitive and color it as red (line 7-11) Import hrpsys and hrpsysext libraries (line 1-2) In the previous tutorials, we have defined our simulation project in xml. But, you can use python script to configure the simulation as well. Initialize and run the simulation for one second time period (line 14-15) Initialize and run the simulation for three seconds time period (line 24-25) Invoke pkg-config command as a child process to get OpenHRP sample folder (line 5-6) Load the simulator (line 4-5) Load the simulator (line 8-9) Load two box models and set its locations (line 10-12) Offline simulation Python scripting Set collision between the boxes (line 13) This script will: You can also construct whole the simulation world only by python script: Project-Id-Version: hrpsys tutorials 0.0.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-12-11 02:11+0900
PO-Revision-Date: 2014-12-11 05:04+0900
Last-Translator: Yosuke Matsusaka <yosuke.matsusaka@gmail.com>
Language-Team: <yosuke.matsusaka@gmail.com>
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 1.5.4
 å¿ç¨ç·¨ ä»¥ä¸ã¯ã¹ã¯ãªããã®ä¾ã§ã: ç®æ¬¡: é¢ç¯ãä½æãåç©çãã©ã¡ã¼ã¿ãè¨­å®ããï¼13-19è¡ç®ï¼ ï¼ã¤ç®ã®ç®±ãä½æãé¢ç¯ã§æ¥ç¶ããï¼20-22è¡ç®ï¼ ããªããã£ããä½¿ã£ã¦èµ¤è²ã§ç®±åã®ã¢ãã«ãä½æããï¼7-11è¡ç®ï¼ hrpsysã©ã¤ãã©ãªã¨hrpsysextã©ã¤ãã©ãªãã¤ã³ãã¼ãï¼1-2è¡ç®ï¼ åã®ãã¥ã¼ããªã¢ã«ã§ã¯ãã·ãã¥ã¬ã¼ã·ã§ã³ãã­ã¸ã§ã¯ããXMLå½¢å¼ã§è¨è¿°ãã¾ããããPythonã¹ã¯ãªãããä½¿ã£ã¦ã·ãã¥ã¬ã¼ã·ã§ã³ãè¨­å®ãããã¨ãã§ãã¾ãã ã·ãã¥ã¬ã¼ã·ã§ã³ãï¼ç§éå®è¡ããï¼14-15è¡ç®ï¼ ã·ãã¥ã¬ã¼ã·ã§ã³ãåæåãï¼ç§éå®è¡ããï¼24-25è¡ç®ï¼ pkg-configã³ãã³ããå­ãã­ã»ã¹ã¨ãã¦èµ·åãOpenHRPãµã³ãã«ãã©ã«ããåå¾ï¼5-6è¡ç®ï¼ ã·ãã¥ã¬ã¼ã¿ãã­ã¼ãããï¼4-5è¡ç®ï¼ ã·ãã¥ã¬ã¼ã¿ã®ã­ã¼ãï¼8-9è¡ç®ï¼ ï¼ã¤ã®ç®±ãä½æããä½ç½®ãè¨­å®ããï¼10-12è¡ç®ï¼ ãªãã©ã¤ã³ã·ãã¥ã¬ã¼ã·ã§ã³ Pythonã«ããã¹ã¯ãªããä½æ ç®±ã®éã®å¹²æ¸ãã§ãã¯ãè¨­å®ããï¼13è¡ç®ï¼ ãã®ã¹ã¯ãªããã¯: Pythonã¹ã¯ãªããã®ã¿ã§ã·ãã¥ã¬ã¼ã·ã§ã³ä¸çå¨ä½ãè¨è¿°ãããã¨ãã§ãã¾ã: 