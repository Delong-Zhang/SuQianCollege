//公共部分
#include "sys.h"
#include "delay.h"  
#include "usart.h"   
#include "led.h"
#include "lcd.h"
#include "key.h"  
#include "usmart.h" 
//录音与播放
#include "sram.h"   
#include "malloc.h" 
#include "w25qxx.h"    
#include "sdio_sdcard.h"
#include "ff.h"  
#include "exfuns.h"    
#include "fontupd.h"
#include "text.h"	 
#include "wm8978.h"	 
#include "audioplay.h"	
#include "recorder.h"
//红外线
#include "remote.h"
//ALIENTEK 探索者STM32F407开发板 实验44
//录音机 实验 
//技术支持：www.openedv.com
//广州市星翼电子科技有限公司


int main(void)
{ 
	//录音
	Stm32_Clock_Init(336,8,2,7);//设置时钟,168Mhz 
	delay_init(168);			//延时初始化  
	uart_init(84,115200);		//初始化串口波特率为115200 
	LED_Init();					//初始化LED 
	usmart_dev.init(84);		//初始化USMART
 	LCD_Init();					//LCD初始化  
 	KEY_Init();					//按键初始化  
	W25QXX_Init();				//初始化W25Q128
	WM8978_Init();				//初始化WM8978
	WM8978_HPvol_Set(40,40);	//耳机音量设置
	WM8978_SPKvol_Set(50);		//喇叭音量设置
	
	my_mem_init(SRAMIN);		//初始化内部内存池
	my_mem_init(SRAMCCM);		//初始化CCM内存池 
	exfuns_init();				//为fatfs相关变量申请内存  
  f_mount(fs[0],"0:",1); 		//挂载SD卡  
	POINT_COLOR=RED;
	
	//红外线
	/*
	u8 keys;
	u8 t=0;	
	u8 *str=0; 
 	Remote_Init();				//红外接收初始化	
	*/
	
	POINT_COLOR=RED;//设置字体为红色 
	LCD_ShowString(30,50,200,16,16,"Explorer STM32F4");	
	LCD_ShowString(30,70,200,16,16,"REMOTE TEST");	
	LCD_ShowString(30,90,200,16,16,"ATOM@ALIENTEK");
	LCD_ShowString(30,110,200,16,16,"2014/5/7");
  LCD_ShowString(30,130,200,16,16,"KEYVAL:");	
  LCD_ShowString(30,150,200,16,16,"KEYCNT:");	
  LCD_ShowString(30,170,200,16,16,"SYMBOL:");	
	
	while(font_init()) 			//检查字库
	{	    
		LCD_ShowString(30,40,200,16,16,"Font Error!");
		delay_ms(200);				  
		LCD_Fill(30,40,240,66,WHITE);//清除显示	     
		delay_ms(200);				  
	}  	 
	POINT_COLOR=RED;    
/*  
 	Show_Str(30,40,200,16,"Explorer STM32开发板",16,0);				    	 
	Show_Str(30,60,200,16,"录音机实验",16,0);				    	 
	Show_Str(30,80,200,16,"正点原子@ALIENTEK",16,0);				    	 
	Show_Str(30,100,200,16,"2014年6月6日",16,0); 
	*/
	while(1)
	{ 
		wav_recorder();
		
		
		//Keys
		/*
		keys=Remote_Scan();	
		if(keys)
		{	 
			LCD_ShowNum(86,130,keys,3,16);		//显示键值
			LCD_ShowNum(86,150,RmtCnt,3,16);	//显示按键次数		  
			switch(keys)
			{
				case 0:str="ERROR";break;			   
				case 162:str="POWER";break;	    
				case 98:str="UP";break;	    
				case 2:str="PLAY";break;		 
				case 226:str="ALIENTEK";break;		  
				case 194:str="RIGHT";break;	   
				case 34:str="LEFT";break;		  
				case 224:str="VOL-";break;		  
				case 168:str="DOWN";break;		   
				case 144:str="VOL+";break;		    
				case 104:str="1";break;		  
				case 152:str="2";break;	   
				case 176:str="3";break;	    
				case 48:str="4";break;		    
				case 24:str="5";break;		    
				case 122:str="6";break;		  
				case 16:str="7";break;			   					
				case 56:str="8";break;	 
				case 90:str="9";break;
				case 66:str="0";break;
				case 82:str="DELETE";break;		 
			}
			LCD_Fill(86,170,116+8*8,170+16,WHITE);	//清楚之前的显示
			LCD_ShowString(86,170,200,16,16,str);	//显示SYMBOL
		}else delay_ms(10);	  
		t++;
		if(t==20)
		{
			t=0;
			LED0=!LED0;
		}
		*/
	} 
}