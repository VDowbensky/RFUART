#include "usb.h"

// device descriptor
const uint8_t Virtual_Com_Port_DeviceDescriptor[] =
{
	0x12, // размер данного дескриптора
	0x01, // тип данного дескриптора - device descriptor 
	0x00, 0x02, // 2 байта - версия usb 2.0
	0x02, // класс устройства cdc
	0x00, // подкласс
	0x00, // протокол
	USB_MAX_PACKET0, // max размер пакета для нулевой конечной точки
	0x83, 0x04, // 2 байта - VID
	0x40,	0x57,// 2 байта - PID
	0x00, 0x02,// 2 байта - версия (ревизия) устройства
	0x01, // индекс строки с названием производителя
	0x02, // индекс строки с названием устройства
	0x03, // индекс строки с серийным номером устройства
	0x01  // количество поддерживаемых конфигураций
};

// configuration descriptor
const uint8_t Virtual_Com_Port_ConfigDescriptor[] =
{
	/* ============== CONFIGURATION 1 =========== */
	/* Configuration 1 descriptor */
	0x09,   // размер дескриптора конфигурации
	0x02,   // тип дескриптора - configuration
	0x43,   // 2 байта - полный размер дескриптора, включая др. дескрипторы 
	0x00,   // (CwTotalLength 2 EP + Control)
	0x02,   // количество интерфейсов (2 интерфейса для CDC - data и config)
	0x01,   // номер данной конфигурации (SET_CONFIGURATION)
	0x00,   // индекс строки описывающий данную конфигурацию
	0xC0,   // битовое поле, характеризующее конфигурацию
					/*
						 Распределение бит:
						 D7 – зарезервировано (установлено в 1);
						 D6 – признак наличия собственного источника питания;
						 D5 – признак разрешения сообщения хосту о выходе
						 устройства из режима «сна»;
						 D4...D0 – зарезервированы (сброшены в 0)
					*/
	0x00,   // max потребляемый ток от шины (половина от реального (50 = 100мА))

		/* Communication Class Interface Descriptor Requirement */
		0x09, // длина дескриптора
		0x04, // тип дескриптора - интерфейс
		0x00, // номер данного интерфейса
		0x00, // номер альтернативной установки для интерфейса
		0x01, // количество точек для данной альтернативной установки в данном интерфейсе
		0x02, // код класса(USB-IF)
		0x02, // код подкласса(USB-IF)
		0x00, // код протокола(USB-IF)
		0x01, // индекс строки, описывающей данную альтернативную установку данного интерфейса

	/* Header Functional Descriptor */
	0x05, // bFunction Length
	0x24, // bDescriptor type: CS_INTERFACE
	0x00, // bDescriptor subtype: Header Func Desc
	0x10, // bcdCDC:1.1
	0x01,

	/*Call Management Functional Descriptor */
  0x05,                              /* bFunctionLength */
  0x24,                              /* bDescriptorType: CS_INTERFACE */
  0x01,               /* bDescriptorSubtype: Call Management Func Desc */
  0x00,                              /* bmCapabilities: device handles call management */ //!!!!!!!!!!!!!!!!!!1
  0x01,                              /* bDataInterface: CDC data IF ID */

		/* ACM Functional Descriptor */
		0x04, // bFunctionLength
		0x24, // bDescriptor Type: CS_INTERFACE
		0x02, // bDescriptor Subtype: ACM Func Desc
		0x02, // bmCapabilities

	/* Union Functional Descriptor */
	0x05, // bFunctionLength
	0x24, // bDescriptorType: CS_INTERFACE
	0x06, // bDescriptor Subtype: Union Func Desc
	0x00, // bMasterInterface: Communication Class Interface
	0x01, // bSlaveInterface0: Data Class Interface

		/* Endpoint 1 descriptor */
		0x07,   // размер дескриптора
		0x05,   // тип дескриптора - endpoint
		0x81,   // битовое поле адреса точки // IN
						/*
							D7 – направление передачи данных точкой (1 – IN, 0 – OUT);
							D6...D4 – зарезервированы (сброшены в 0);
							D3...D0 – адрес точки
						*/
		0x03,   // битовое поле, характеризующее точку
						/*
							D7, D6 – зарезервированы (сброшены в 0);
							D5, D4 – функция, выполняемая точкой:
								00 – точка данных;
								01 – точка обратной связи;
								10 – точка данных с неявной обратной связью;
								11 – зарезервировано
							D3, D2 – тип синхронизации хоста и точки:
								00 – без синхронизации;
								01 – асинхронный;
								10 – адаптивный;
								11 – синхронный
							D1, D0 – тип обмена данными:
								00 – контрольный;
								01 – изохронный;
								10 – bulk;
								11 – interrupt
						*/
		64,	      //2 байта - битовое поле 
		//0x08,   //2 байта - битовое поле, 
						// характеризующее размер пакета передаваемых данных					
		0x00,		/*
							D15…D13 – зарезервированы (сброшены в 0);
							D12, D11 – количество дополнительных передач:
								00 – нет дополнительных передач;
								01 – 1 дополнительная передача (всего 2 передачи),
								10 – 2 дополнительные передачи (всего 3 передачи);
								11 – зарезервировано.
							D10...D0 – размер пакета в байтах
						*/
		0xFF,   // интервал готовности точки к обмену данными

	/* Data Class Interface Descriptor Requirement */
	0x09, // bLength
	0x04, // bDescriptorType
	0x01, // bInterfaceNumber
	0x00, // bAlternateSetting
	0x02, // bNumEndpoints
	0x0A, // bInterfaceClass
	0x00, // bInterfaceSubclass
	0x00, // bInterfaceProtocol
	0x04, // iInterface

	
	/* Endpoint 2 descriptor */
	0x07,   // bLength
	0x05,   // bDescriptorType
	0x02,   // bEndpointAddress, Endpoint 01 - OUT
	0x02,   // bmAttributes      BULK
	64,   // wMaxPacketSize
	0x00,
	0x00,   // bInterval

	/* Endpoint 3 descriptor */
	0x07,   // bLength
	0x05,   // bDescriptorType
	0x83,   // bEndpointAddress, Endpoint 02 - IN
	0x02,   // bmAttributes      BULK
	64,     // wMaxPacketSize
	0x00,
	0x00    // bInterval
};

/* USB String Descriptors */
const uint8_t Virtual_Com_Port_StringLangID[] =
{
	0x04, // длина дескриптора
	0x03, // тип дескриптора - string desc
	0x09, // N байт индетификатор языка
	0x04  /* LangID = 0x0409: U.S. English */
};

const uint8_t Virtual_Com_Port_StringVendor[] =
{
	10, // длина дескриптра
	0x03, // тип дескриптора - string desc
	/* имя */
	'T', 0, 
	'E', 0, 
	'S', 0, 
	'T', 0
};

const uint8_t Virtual_Com_Port_StringProduct[] =
{
	10, // длина дескриптра
	0x03, // тип дескриптора - string desc
	/* имя */
	'T', 0, 
	'E', 0, 
	'S', 0, 
	'T', 0
};

const uint8_t Virtual_Com_Port_StringSerial[] =
{
	10, // длина дескриптра
	0x03, // тип дескриптора - string desc
	/* имя */
	'T', 0, 
	'E', 0, 
	'S', 0, 
	'T', 0
};
