实验器材:
	探索者STM32F4开发板
	
实验目的:
	进一步学习WM8978和STM32 IIS功能的使用，实现一个简单的WAV录音机.
	
硬件资源:
	1,DS0(连接在PF9)
	2,串口1(波特率:115200,PA9/PA10连接在板载USB转串口芯片CH340上面)
	3,ALIENTEK 2.8/3.5/4.3/7寸TFTLCD模块(通过FSMC驱动,FSMC_NE4接LCD片选/A6接RS)
	4,按键KEY0(PE4)/KEY2(PE2)/KEY_UP(PA0,也称之为WK_UP) 
	5,WM8978音频CODEC芯片(连接关系见STM32F4开发指南,48.2节)
	6,IIS音频接口(用于驱动WM8978)  
	7,SD卡,通过SDIO(SDIO_D0~D4(PC8~PC11),SDIO_SCK(PC12),SDIO_CMD(PD2))连接 

实验现象:
	本实验开机后，先初始化各外设，然后检测字库是否存在，如果检测无问题，再检测SD卡根目录是否
	存在RECORDER文件夹，如果不存在则创建，如果创建失败，则报错。在找到SD卡的RECORDER文件夹
	后，即进入录音模式（包括配置WM8978和I2S等），此时可以在耳机（或喇叭）听到采集到的音频。
	KEY0用于开始/暂停录音，KEY2用于保存并停止录音，KEY_UP用于播放最近一次的录音。
	
    当我们按下KEY0的时候，可以在屏幕上看到录音文件的名字、码率以及录音时间等，然后通过KEY2可
	以保存该文件，同时停止录音（文件名和时间也都将清零），在完成一段录音后，我们可以通过按
	KEY_UP按键，来试听刚刚的录音。DS0用于提示程序正在运行，DS1用于提示是否处于暂停录音状态。 

注意事项: 
	1,4.3寸和7寸屏需要比较大电流,USB供电可能不足,请用外部电源适配器(推荐外接12V 1A电源).
	2,本例程在LCD_Init函数里面(在ILI93xx.c),用到了printf,如果不初始化串口1,将导致液晶无法显示!!
	3,本实验需要自备SD卡一张、耳机一副（非必须）。
	4,如果喇叭/耳机产生啸叫，请将喇叭/耳机放远一点（离开咪头越远越好）。 
  

					正点原子@ALIENTEK
					2014-10-25
					广州市星翼电子科技有限公司
					电话：020-38271790
					传真：020-36773971
					购买：http://shop62103354.taobao.com
					http://shop62057469.taobao.com
					公司网站：www.alientek.com
					技术论坛：www.openedv.com
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					