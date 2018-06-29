//��������
#include "sys.h"
#include "delay.h"  
#include "usart.h"   
#include "led.h"
#include "lcd.h"
#include "key.h"  
#include "usmart.h" 
//¼���벥��
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
//������
#include "remote.h"
//ALIENTEK ̽����STM32F407������ ʵ��44
//¼���� ʵ�� 
//����֧�֣�www.openedv.com
//������������ӿƼ����޹�˾


int main(void)
{ 
	//¼��
	Stm32_Clock_Init(336,8,2,7);//����ʱ��,168Mhz 
	delay_init(168);			//��ʱ��ʼ��  
	uart_init(84,115200);		//��ʼ�����ڲ�����Ϊ115200 
	LED_Init();					//��ʼ��LED 
	usmart_dev.init(84);		//��ʼ��USMART
 	LCD_Init();					//LCD��ʼ��  
 	KEY_Init();					//������ʼ��  
	W25QXX_Init();				//��ʼ��W25Q128
	WM8978_Init();				//��ʼ��WM8978
	WM8978_HPvol_Set(40,40);	//������������
	WM8978_SPKvol_Set(50);		//������������
	
	my_mem_init(SRAMIN);		//��ʼ���ڲ��ڴ��
	my_mem_init(SRAMCCM);		//��ʼ��CCM�ڴ�� 
	exfuns_init();				//Ϊfatfs��ر��������ڴ�  
  f_mount(fs[0],"0:",1); 		//����SD��  
	POINT_COLOR=RED;
	
	//������
	/*
	u8 keys;
	u8 t=0;	
	u8 *str=0; 
 	Remote_Init();				//������ճ�ʼ��	
	*/
	
	POINT_COLOR=RED;//��������Ϊ��ɫ 
	LCD_ShowString(30,50,200,16,16,"Explorer STM32F4");	
	LCD_ShowString(30,70,200,16,16,"REMOTE TEST");	
	LCD_ShowString(30,90,200,16,16,"ATOM@ALIENTEK");
	LCD_ShowString(30,110,200,16,16,"2014/5/7");
  LCD_ShowString(30,130,200,16,16,"KEYVAL:");	
  LCD_ShowString(30,150,200,16,16,"KEYCNT:");	
  LCD_ShowString(30,170,200,16,16,"SYMBOL:");	
	
	while(font_init()) 			//����ֿ�
	{	    
		LCD_ShowString(30,40,200,16,16,"Font Error!");
		delay_ms(200);				  
		LCD_Fill(30,40,240,66,WHITE);//�����ʾ	     
		delay_ms(200);				  
	}  	 
	POINT_COLOR=RED;    
/*  
 	Show_Str(30,40,200,16,"Explorer STM32������",16,0);				    	 
	Show_Str(30,60,200,16,"¼����ʵ��",16,0);				    	 
	Show_Str(30,80,200,16,"����ԭ��@ALIENTEK",16,0);				    	 
	Show_Str(30,100,200,16,"2014��6��6��",16,0); 
	*/
	while(1)
	{ 
		wav_recorder();
		
		
		//Keys
		/*
		keys=Remote_Scan();	
		if(keys)
		{	 
			LCD_ShowNum(86,130,keys,3,16);		//��ʾ��ֵ
			LCD_ShowNum(86,150,RmtCnt,3,16);	//��ʾ��������		  
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
			LCD_Fill(86,170,116+8*8,170+16,WHITE);	//���֮ǰ����ʾ
			LCD_ShowString(86,170,200,16,16,str);	//��ʾSYMBOL
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