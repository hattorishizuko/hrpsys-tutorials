Þ    M            ì      ì  `   í  <   N  H     ­   Ô       º   ¢  J   ]     ¨  %   »     á     ï  "   ÷  	     3   $     X     x       º     ,   Y	     	  u   	  h  
  S   t  å   È  P   ®  ?   ÿ  h   ?     ¨     °     Ä  #   Ý      x     a     g   r  B   Ú  6     -   T  D     6   Ç  F   þ     E  N   É          2     I  0   \  C    Z   Ñ     ,  :   L  \        ä  g     ;   i     ¥  M   :       V     :   k  >  ¦  3   å  2        L  a   \  E   ¾  Y     ¢   ^  K        M  w   Y     Ñ    ñ  '   þ  B   &  2   i      ®      u   Ë   X   A!  þ   !  -   "  ô   Ç"     ¼#     A$  9   `$     $     ¡$  5   ·$     í$  B   õ$  ;   8%  -   t%     ¢%  Á   »%  _   }&     Ý&  Ð   ö&  |  Ç'     D)  A  Æ)  ~   +  r   +     ú+     ,  $   ,     ¹,  '   Õ,  /  ý,     -/     ¼/     ?0  c   Ô0  e   81  J   1     é1  e   r2  [   Ø2  Ë   43      4  *   4  *   Ê4     õ4  H   5    W5  w   Ü6     T7  Q   j7  |   ¼7  2   98     l8  x    9     y9  x   :     :     ;  b   ³;    <  S   ¬=  W    >     X>      k>  F   ?  V   S?  þ   ª?  |   ©@  +   &A  ³   RA  #   B  ·  *B  '   âC  B   
D  2   MD   Add following lines to mysimulation.xml  to instantiate and connect the **svcontrol** component. After the editor is opened, you will see following contents. As a result, following system will be generated from this configuration: As we have learned in previous tutorial, project file in hrpsys-gazebo-simulatior is written in xml format. You can use your favorite text editor to create the project file. Basic structure of project file Before proceed, create configuration file named "rtc.conf" under the current folder (or place it to /etc/rtc.conf if you want to apply the configuration globally) with following content. Before running the simulation, open new terminal and run roscore service:: Change robot model Clone most recent source from github. Configuration Connect Connect with original RT-component Contents: Convert the robot model and create simulation world Create instance of RT-component Create your own project Endless mode. For example, we first setup a pipeline to apply image processing (image undistortion based on the camera parameter) to the original virtual camera input by using "image_proc" ros stack:: For project file, copy from hrpsys samples:: Headless mode. Here, we create original RT-component named "svcontrol". First invoke following command to generate a skeleton code:: In  **com.generalrobotix.ui.item.GrxRTSItem** configuration item type, the name "*.period" is used to specify execution cycle of each RT-components. The name "*.factory" is used to specify the name of shared library used to create the instance of the component (described later). Properties with name "connection" specify the connection between the components. In the next tutorial, we will learn how to connect the robot to our own controller. In the previous tutorial, we have configured our project to use "simple_vehicle_with_camera" robot model which has virtual camera interface. In this tutorial, let's use **CameraImageViewer** component to monitor the camera input. In this tutorial, we will learn how to connect simulation to our own controller. In this tutorial, we will learn how to create your own project. In this tutorial, we will use "simple_vehicle_with_camera" robot model which comes from OpenHRP samples. Install Install from source Integrate with ros stack Interact with the simulation window Next, we configure each properties applied to the robot model. **rtcName** and **in[out]port** are the properties to create interface for the robot model as a RT-component. For **rtcName**, let's set the value to "vehicle0". For **in[out]port**, just copy the property from the original is fine (these properties mean we can get full position, velocity, acceleration based control interface to the robot). Now, we have finished configuring our system. Let's open the project in hrpsys-gazebo-simulator and confirm the result:: Now, we have finished configuring our system. Let's open the project in hrpsys-gazebo-simulator:: Now, we have finished creating our own simulation project. Let's open the project in hrpsys-simulator:: Open the project and simulation world in hrpsys-gazebo-simulator:: Open the project file with your favorite text editor:: Open the project file with your text editor:: Or refer to this page to install gazebo with DRC plugins and models: Please finish :doc:`project` tutorial, before proceed. Please refer to this page to see list of all the available components: Project file in hrpsys-gazebo-simulator is written in xml format. You can use your favorite text editor to create the project file. Run following command to convert the robot model and create simulation world:: Run your first simulation Running sample project Show help message. Simulation window is just as same as the gazebo. Specifically for this model, we can also use virtual camera. The final outport definition in below example is for the virtual camera. "/simple_vehicle_with_camera/VISION_SENSOR1/left/image_raw" is the name of the ros topic, which is published by the gazebo-ros plugin. The last "VISION_SENSOR" part specifies the data type. Subscription to ros topic in hrpsys-gazebo-simulator can be targeted to any of the topics. Synchronize to real world time. The hrpsys-gazebo-simulator command has following options: The hrpsys-gazebo-simulator command loads and runs a simulation. It is called like follows:: Then compile the component:: Then modify the topic name defined in the previous project file from "image_raw" to "image_rect_color": Then, run cmake and make to configure, compile and install. Then, we also define a connection from "VISION_SENSOR1" port of "vehicle0" robot model to "imageIn" port of "CameraImageViewer0" component instance. This component will give constant power to all the joints of the robot model. To connect the simulator to the external control process, we will modify **com.generalrobotix.ui.item.GrxRTSItem** configuration item type. To install from source, we first need to install depending hrpsys-base with libraries. To translate the simulation world **left click and drag**. To use the component, we first define the **factory** property to create an instance of the component. In below example, "CameraImageViewer0" is the name of the instance. "CameraImageViewer" is the name of the component itself. We also define the **period** property to set the execution cycle to 0.5 (twice a second). Uncomment and add following lines in svcontrol.cpp: Uncomment following line in generated svcontrol.h: Use with Gazebo We also need to install gazebo. Please refer to following page for installation of gazebo itself: We first, modify the model name and the url. Edit the following line: We will first copy the sample project file to local directory to create our own project:: Where **project file** is the xml file which defines system configuration (explained later). **gazebo world file** is the xml file which defines simulation world. You can rotate the simulation world by **shift key + left click and drag**. as follows: hrpsys-base is not only a simulation environment, but also provide various components which can be used in your system. hrpsys-gazebo-simulator command hrpsys-gazebo-simulator internally use gazebo simulator, so we can use any robot model distributed in sdf format, but here we will use the same robot model introduced in previous tutorials. Run following command to convert the robot model and create simulation world:: http://fkanehiro.github.io/hrpsys-base/ http://gazebosim.org/tutorials?tut=install_ubuntu&cat=installation https://bitbucket.org/osrf/drcsim/wiki/DRC/Install Project-Id-Version: hrpsys tutorials 0.0.1
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-12-11 02:11+0900
PO-Revision-Date: 2015-02-12 14:16+0900
Last-Translator: Yosuke Matsusaka <yosuke.matsusaka@gmail.com>
Language-Team: <yosuke.matsusaka@gmail.com>
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 1.5.4
 **svcontrol** ã³ã³ãã¼ãã³ããã¤ã³ã¹ã¿ã³ã¹åããã·ãã¥ã¬ã¼ã¿ã«æ¥ç¶ããããã«ãmysimulation.xmlã«ä»¥ä¸ã®è¨­å®ãè¿½å ãã¦ãã ããã ãã­ã¹ãã¨ãã£ã¿ã§ãã­ã¸ã§ã¯ããã¡ã¤ã«ãéãã¨ä»¥ä¸ã®åå®¹ã«ãªã£ã¦ããã¯ãã§ãã çµæã¨ãã¦ããã®è¨­å®ããä»¥ä¸ã®ãããªã·ã¹ãã ãçæããã¾ã: åã®ãã¥ã¼ããªã¢ã«ã§å­¦ç¿ããããã«hrpsys-gazebo-simulatorã®ãã­ã¸ã§ã¯ããã¡ã¤ã«ã¯XMLå½¢å¼ã®ãã¡ã¤ã«ã§ãããã­ã¸ã§ã¯ããã¡ã¤ã«ã®ç·¨éã«ã¯å¥½ããªãã­ã¹ãã¨ãã£ã¿ãä½¿ããã¨ãã§ãã¾ãã ãã­ã¸ã§ã¯ããã¡ã¤ã«ã®åºæ¬æ§æ ãã®åã«é²ãåã«ãä»¥ä¸ã®åå®¹ã® "rtc.conf" ãã¡ã¤ã«ãã«ã¬ã³ããã©ã«ãã«ä½æãã¦ãã ããï¼/etc/rtc.confã«ä½æãããã¨ã§åãè¨­å®ãã³ã³ãã¥ã¼ã¿å¨ä½ã«é©ç¨ãããã¨ãã§ãã¾ãï¼ã ã·ãã¥ã¬ã¼ã·ã§ã³ãå®è¡ããåã«ãæ°ããã¿ã¼ããã«ãéãã¦roscoreãµã¼ãã¹ãå®è¡ãã¦ãã ãã:: ã­ãããã¢ãã«ã®å¤æ´ githubããææ°ã®ã½ã¼ã¹ãã¯ã­ã¼ã³ãã¾ãã è¨­å® æ¥ç¶ã«ããæ¡å¼µ ãªãªã¸ãã«ã®RTã³ã³ãã¼ãã³ãã¨ã®æ¥ç¶ ç®æ¬¡: ã­ãããã¢ãã«ã®å¤æã¨ã¯ã¼ã«ããã¡ã¤ã«ã®ä½æ RTã³ã³ãã¼ãã³ãã®ã¤ã³ã¹ã¿ã³ã¹ãä½æãã ãªãªã¸ãã«ã®ãã­ã¸ã§ã¯ãã®ä½æ ã¨ã³ãã¬ã¹ã¢ã¼ã ä¾ã¨ãã¦ã"image_proc" rosã¹ã¿ãã¯ãç¨ããç»åå¦çãã¤ãã©ã¤ã³ï¼ã«ã¡ã©ãã©ã¡ã¼ã¿ãå©ç¨ãããã£ã¹ãã¼ã·ã§ã³é¤å»ãã£ã«ã¿ï¼ãèµ·åãã¾ãã ãã­ã¸ã§ã¯ããã¡ã¤ã«ã«ã¤ãã¦ã¯hrpsysä»å±ã®ãµã³ãã«ãã³ãã¼ãã¾ã:: ãããã¬ã¹ã¢ã¼ã ããã§ã¯"svcontrol"ã¨ããååã®ãªãªã¸ãã«ã®ã³ã³ãã¼ãã³ããä½æãã¾ããã¾ãã¯ã¹ã±ã«ãã³ã³ã¼ããçæããããã«ä»¥ä¸ã®ã³ãã³ããå®è¡ãã¦ãã ãã:: **com.generalrobotix.ui.item.GrxRTSItem** è¨­å®é ç®ã§ã¯ã"*.period"ãåRTã³ã³ãã¼ãã³ãã®å®è¡å¨æãè¨­å®ãã¾ãã"*.factory"ã¯ã³ã³ãã¼ãã³ãã®ã¤ã³ã¹ã¿ã³ã¹ãä½æããã®ã«ç¨ããããå±æã©ã¤ãã©ãªãè¨­å®ãã¾ãï¼è©³ç´°ã¯ãã¨ã§èª¬æãã¾ãï¼ã"connection"ã¯ã³ã³ãã¼ãã³ãéã®æ¥ç¶ãè¨­å®ãã¾ãã æ¬¡ã®ãã¥ã¼ããªã¢ã«ã§ã¯ããªãªã¸ãã«ã®ã³ã³ãã­ã¼ã©ã«ã­ããããæ¥ç¶ããæ¹æ³ãå­¦ç¿ãã¾ãã åã®ãã¥ã¼ããªã¢ã«ã§ã¯ä»®æ³ã«ã¡ã©ãæã£ã"simple_vehicle_with_camera"ã­ãããã¢ãã«ãä½¿ãããã«ãã­ã¸ã§ã¯ããè¨­å®ãã¾ãããä»åã®ãã¥ã¼ããªã¢ã«ã§ã¯ã **CameraImageViewer** ã³ã³ãã¼ãã³ããä½¿ã£ã¦ã«ã¡ã©ããã®å¥åãè¡¨ç¤ºãã¦ã¿ã¾ãããã ãã®ãã¥ã¼ããªã¢ã«ã§ã¯ãã·ãã¥ã¬ã¼ã¿ãèªä½ã®ã³ã³ãã­ã¼ã©ã«æ¥ç¶ããæ¹æ³ãå­¦ç¿ãã¾ãã ãã®ãã¥ã¼ããªã¢ã«ã§ã¯ããªãªã¸ãã«ã®ãã­ã¸ã§ã¯ããä½æããæ¹æ³ãå­¦ç¿ãã¾ãã ãã®ãã¥ã¼ããªã¢ã«ã§ã¯OpenHRPãµã³ãã«ã«ä»å±ãã"simple_vehicle_with_camera"ã­ãããã¢ãã«ãä½¿ãã¾ãã ã¤ã³ã¹ãã¼ã« ã½ã¼ã¹ããã®ã¤ã³ã¹ãã¼ã« rosã¹ã¿ãã¯ã¨ã®æ¥ç¶ ã·ãã¥ã¬ã¼ã·ã§ã³ç»é¢ã®æä½ æ¬¡ã«ãã­ãããã¢ãã«ã®åãã­ããã£ãè¨­å®ãã¦ããã¾ãã **rtcName** ã¨ **in[out]port** ãã­ããã£ã¯ãã­ãããã¢ãã«ã«RTã³ã³ãã¼ãã³ãã¨ãã¦ã®ã¤ã³ã¿ã¼ãã§ã¼ã¹ãä½æããããã®è¨­å®ã§ãã ããã§ã¯ **rtcName** ã"vehicle0"ã¨è¨­å®ãã¾ãããã **in[out]port** ãã­ããã£ã¯ãåã®ãã¡ã¤ã«ã®ã¾ã¾ã«ãã¦ããã¦ãã ããï¼ãã®è¨­å®ã¯ãé¢ç¯è§ãè§éåº¦ãè§å éåº¦ã®åå¶å¾¡ãã­ãããã¢ãã«ã«å ãããã¨ãã§ããè¨­å®ã§ãï¼ã ã·ã¹ãã ã®è¨­å®ã¯ããã§çµäºã§ããhrpsys-gazebo-simulatorã§ãã­ã¸ã§ã¯ããéãã¦çµæãç¢ºèªãã¦ã¿ã¾ããã:: ã·ã¹ãã ã®è¨­å®ã¯ããã§çµäºã§ããhrpsys-gazebo-simulatorãä½¿ã£ã¦ãã­ã¸ã§ã¯ããéãã¦ã¿ã¾ããã:: ã·ãã¥ã¬ã¼ã·ã§ã³ãã­ã¸ã§ã¯ãã®ä½æãçµãã£ãã®ã§ãhrpsys-gazebo-simulatorã§ãã­ã¸ã§ã¯ããéãã¦ã¿ã¾ããã:: hrpsys-gazebo-simulaorã§ãã­ã¸ã§ã¯ãã¨ã·ãã¥ã¬ã¼ã·ã§ã³ã¯ã¼ã«ããéãã¾ã:: å¥½ããªãã­ã¹ãã¨ãã£ã¿ãä½¿ã£ã¦ãã­ã¸ã§ã¯ããã¡ã¤ã«ãéãã¦ãã ãã:: ãã­ã¹ããã¡ã¤ã«ã§ãã­ã¸ã§ã¯ããã¡ã¤ã«ãéãã¾ã:: gazeboã¨DRCé¢é£ã®ãã©ã°ã¤ã³ã¨ã¢ãã«ãä¸¡æ¹ã¤ã³ã¹ãã¼ã«ããå ´åã¯ä»¥ä¸ã®ãã¼ã¸ãåç§ãã¦ãã ãã: :doc:`project`ããã¥ã¼ããªã¢ã«ãæ¸ã¾ãã¦ããªãäººã¯åã«å­¦ç¿ãã¦ãã ããã ãã¹ã¦ã®ã³ã³ãã¼ãã³ãã®ãªã¹ããä»¥ä¸ã®ãã¼ã¸ããä¸è¦§ã§ãã¾ã: hrpsys-gazebo-simulatorã®ãã­ã¸ã§ã¯ããã¡ã¤ã«ã¯XMLå½¢å¼ã®ãã¡ã¤ã«ã§ãããã­ã¸ã§ã¯ããã¡ã¤ã«ã®ä½æã«ã¯å¥½ããªãã­ã¹ãã¨ãã£ã¿ãä½¿ããã¨ãã§ãã¾ãã ã­ãããã¢ãã«ãå¤æãã¦ã·ãã¥ã¬ã¼ã·ã§ã³ã¯ã¼ã«ããã¡ã¤ã«ãä½æããããã«ä»¥ä¸ã®ã³ãã³ããå¥åãã¦ãã ãã:: æåã®ã·ãã¥ã¬ã¼ã·ã§ã³ã®å®è¡ ãµã³ãã«ãã­ã¸ã§ã¯ãã®ã­ã¼ã ãã«ããè¡¨ç¤ºãã ã·ãã¥ã¬ã¼ã·ã§ã³ç»é¢ã¯gazeboã®ãã®ã¨å¨ãåãã§ãã ãã®ã­ãããã¢ãã«ã«ã¤ãã¦ã¯ä»®æ³ã«ã¡ã©ãç¨ãããã¨ãã§ãã¾ããä»¥ä¸ã®ä¾ã«ããæå¾ã®outportå®ç¾©ã¯ä»®æ³ã«ã¡ã©ã«é¢ãããã®ã§ãã"/simple_vehicle_with_camera/VISION_SENSOR1/left/image_raw"ã¯gazebo-rosãã©ã°ã¤ã³ã«ãã£ã¦ä½æãããrosãããã¯ã§ããæå¾ã®"VISION_SENSOR"ã®é¨åã¯ãã¼ã¿åãå®ç¾©ãã¾ãã hrpsys-gazebo-simulatorãä½¿ã£ãrosãããã¯ã®è³¼èª­ã¯ä»»æã®å¯¾è±¡ã«å¯¾ãã¦è¡ããã¨ãã§ãã¾ãã å®æéã¸ã®åæ hrpsys-gazebo-simulatorã³ãã³ãã«ã¯ä»¥ä¸ã®ãªãã·ã§ã³ãããã¾ã: hrpsys-gazebo-simulatorã³ãã³ãã¯ã·ãã¥ã¬ã¼ã¿ãã­ã¼ããå®è¡ãã¾ããä»¥ä¸ã®ããã«å®è¡ãã¾ã:: ã³ã³ãã¼ãã³ããã³ã³ãã¤ã«ãã¾ã:: ååä½æãããã­ã¸ã§ã¯ããã¡ã¤ã«ãç·¨éãã¦ãè³¼èª­ãããããã¯ã"image_raw"ãã"image_rect_color"ã«å¤æ´ãã¾ã: è¨­å®ãã³ã³ãã¤ã«ãã¤ã³ã¹ãã¼ã«ãè¡ãããã«cmakeã³ãã³ãã¨makeã³ãã³ããå®è¡ãã¾ãã ããã¦ã"vehicle0"ã³ã³ãã¼ãã³ãã®"VISION_SENSOR1"ãã¼ãã¨"CameraImageViewer0"ã³ã³ãã¼ãã³ãã® "imageIn"ãã¼ããæ¥ç¶ãã¾ãã ãã®ã³ã³ãã¼ãã³ãã¯ã­ãããã¢ãã«ã®ãã¹ã¦ã®é¢ç¯ã«ä¸å®ã®åãå ããå¶å¾¡ããã¾ãã ã·ãã¥ã¬ã¼ã¿ãå¤é¨ã®å¶å¾¡ãã­ã»ã¹ã«æ¥ç¶ããããã« **com.generalrobotix.ui.item.GrxRTSItem** ãç·¨éãã¾ãã ã½ã¼ã¹ããã¤ã³ã¹ãã¼ã«ããããã«ã¯ãã¾ãhrpsys-baseã¨ä¾å­ããã©ã¤ãã©ãªãã¤ã³ã¹ãã¼ã«ããå¿è¦ãããã¾ãã **å·¦ã¯ãªãã¯ã¨ãã©ãã°** ã§ã·ãã¥ã¬ã¼ã·ã§ã³ä¸çãå¹³è¡ç§»åã§ãã¾ãã RTã³ã³ãã¼ãã³ããä½¿ãããã«ã¯ãã¾ã **factory** ãã­ããã£ãè¨­å®ãã¦ã³ã³ãã¼ãã³ãã®ã¤ã³ã¹ã¿ã³ã¹ãä½æãã¾ããä»¥ä¸ã®ä¾ã§ã¯"CameraImageViewer0"ãã¤ã³ã¹ã¿ã³ã¹ã®ååã§ãã"CameraImageViewer"ã¯ã³ã³ãã¼ãã³ãã®ååã§ããã³ã³ãã¼ãã³ãã®å®è¡å¨æãè¨­å®ããããã« **period** ãã­ããã£ãå®ç¾©ãã¾ãã ãã¡ã¤ã«svcontrol.cppã®ä»¥ä¸ã®é¨åãã¢ã³ã³ã¡ã³ããè¿½è¨ãã¾ã: çæããããã¡ã¤ã«svcontrol.hã®ä»¥ä¸ã®é¨åãã¢ã³ã³ã¡ã³ããã¾ã: Gazeboã¨ã®æ¥ç¶ ã¾ããgazeboãã¤ã³ã¹ãã¼ã«ããå¿è¦ãããã¾ããgazeboæ¬ä½ã®ã¤ã³ã¹ãã¼ã«ã«ã¤ãã¦ã¯ä»¥ä¸ã®ãã¼ã¸ãåç§ãã¦ãã ãã: ã¾ãã¯ãã¢ãã«åã¨URLãå¤æ´ãã¾ããä»¥ä¸ã®é¨åã: ãµã³ãã«ãã­ã¸ã§ã¯ããã­ã¼ã«ã«ãã£ã¬ã¯ããªã«ã³ãã¼ãã¾ã:: **ãã­ã¸ã§ã¯ããã¡ã¤ã«** ã¯ã·ã¹ãã ã®è¨­å®ãå®ç¾©ããXMLå½¢å¼ã®ãã¡ã¤ã«ã§ãï¼ãã¨ã§èª¬æãã¾ãï¼ã **gazeboã¯ã¼ã«ããã¡ã¤ã«** ã¯ã·ãã¥ã¬ã¼ã·ã§ã³ä¸çãå®ç¾©ããXMLå½¢å¼ã®ãã¡ã¤ã«ã§ãã **shiftã­ã¼ + å·¦ã¯ãªãã¯ã¨ãã©ãã°** ã§ã·ãã¥ã¬ã¼ã·ã§ã³ä¸çãåè»¢ããããã¨ãã§ãã¾ãã ä»¥ä¸ã®ããã«å¤æ´ãã¦ãã ãã: hrpsys-baseã¯ã·ãã¥ã¬ã¼ã·ã§ã³ç°å¢ãæä¾ããã ãã§ãªããã·ã¹ãã æ§ç¯ã«å©ç¨ãããã¨ãã§ããæ§ããªã³ã³ãã¼ãã³ããæä¾ãã¾ãã hrpsys-gazebo-simulatorã³ãã³ã hrpsys-gazebo-simulatorã¯åé¨ã§gazeboã·ãã¥ã¬ã¼ã¿ãä½¿ã£ã¦ãã¾ãããã®ããsdfå½¢å¼ã§éå¸ããã¦ããæ§ããªã­ãããã¢ãã«ãå©ç¨ãããã¨ãã§ãã¾ãããããã§ã¯åã®ãã¥ã¼ããªã¢ã«ã§ä½¿ã£ã¦ãããã®ã¨åãã­ãããã¢ãã«ãä½¿ãã¾ããä»¥ä¸ã®ã³ãã³ããå®è¡ãã¦ã­ãããã¢ãã«ã®å¤æã¨ã¯ã¼ã«ããã¡ã¤ã«ã®ä½æãè¡ã£ã¦ãã ãã:: http://fkanehiro.github.io/hrpsys-base/ http://gazebosim.org/tutorials?tut=install_ubuntu&cat=installation https://bitbucket.org/osrf/drcsim/wiki/DRC/Install 