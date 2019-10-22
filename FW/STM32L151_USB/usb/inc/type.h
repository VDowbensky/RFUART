typedef unsigned char  BYTE;
typedef unsigned short WORD;
typedef unsigned long  DWORD;
typedef unsigned int   BOOL;

typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;

#ifndef __TYPE_H
#define __TYPE_H
typedef __packed union {
  WORD W;
  __packed struct {
    BYTE L;
    BYTE H;
  } WB;
} WORD_BYTE;

/* bmRequestType Definition */
// 1 байт из USB_SETUP_PACKET
typedef __packed union _REQUEST_TYPE {
  __packed struct _BM {
    BYTE Recipient : 5; // код получателя
		/*
		0 - usb устр.
		1 - интерфейс
		2 - др. получатель
		4-31 - зарезервированно
		*/
    BYTE Type      : 2; // тип запроса
		/*
		0 - стандартный
		1 - специфический для данного класса
		2 - специфический запрос изготовителя
		3 - зарезервированно
		*/
    BYTE Dir       : 1; // направление (0-от хоста, 1-к хосту)
  } BM;
  BYTE B;
} REQUEST_TYPE;

/* USB Default Control Pipe Setup Packet */
typedef __packed struct _USB_SETUP_PACKET {
  REQUEST_TYPE bmRequestType; // тип запроса
  BYTE         bRequest; // код запроса
  WORD_BYTE    wValue; // параметр запроса
  WORD_BYTE    wIndex; // индекс или смещение
  WORD         wLength; // число байт для передачи
} USB_SETUP_PACKET;

typedef struct _EP_BUF_DSCR {
  uint32_t ADDR_TX;
  uint32_t COUNT_TX;
  uint32_t ADDR_RX;
  uint32_t COUNT_RX;
} EP_BUF_DSCR;

/* USB Endpoint Data Structure */
typedef struct _USB_EP_DATA {
  BYTE  *pData;
  WORD   Count;
} USB_EP_DATA;

/* USB Standard Device Descriptor */
typedef __packed struct _USB_DEVICE_DESCRIPTOR {
  BYTE  bLength;
  BYTE  bDescriptorType;
  WORD  bcdUSB;
  BYTE  bDeviceClass;
  BYTE  bDeviceSubClass;
  BYTE  bDeviceProtocol;
  BYTE  bMaxPacketSize0;
  WORD  idVendor;
  WORD  idProduct;
  WORD  bcdDevice;
  BYTE  iManufacturer;
  BYTE  iProduct;
  BYTE  iSerialNumber;
  BYTE  bNumConfigurations;
} USB_DEVICE_DESCRIPTOR;

/* USB 2.0 Device Qualifier Descriptor */
typedef __packed struct _USB_DEVICE_QUALIFIER_DESCRIPTOR {
  BYTE  bLength;
  BYTE  bDescriptorType;
  WORD  bcdUSB;
  BYTE  bDeviceClass;
  BYTE  bDeviceSubClass;
  BYTE  bDeviceProtocol;
  BYTE  bMaxPacketSize0;
  BYTE  bNumConfigurations;
  BYTE  bReserved;
} USB_DEVICE_QUALIFIER_DESCRIPTOR;

/* USB Standard Configuration Descriptor */
typedef __packed struct _USB_CONFIGURATION_DESCRIPTOR {
  BYTE  bLength;
  BYTE  bDescriptorType;
  WORD  wTotalLength;
  BYTE  bNumInterfaces;
  BYTE  bConfigurationValue;
  BYTE  iConfiguration;
  BYTE  bmAttributes;
  BYTE  bMaxPower;
} USB_CONFIGURATION_DESCRIPTOR;

/* USB Standard Interface Descriptor */
typedef __packed struct _USB_INTERFACE_DESCRIPTOR {
  BYTE  bLength;
  BYTE  bDescriptorType;
  BYTE  bInterfaceNumber;
  BYTE  bAlternateSetting;
  BYTE  bNumEndpoints;
  BYTE  bInterfaceClass;
  BYTE  bInterfaceSubClass;
  BYTE  bInterfaceProtocol;
  BYTE  iInterface;
} USB_INTERFACE_DESCRIPTOR;

/* USB Standard Endpoint Descriptor */
typedef __packed struct _USB_ENDPOINT_DESCRIPTOR {
  BYTE  bLength;
  BYTE  bDescriptorType;
  BYTE  bEndpointAddress;
  BYTE  bmAttributes;
  WORD  wMaxPacketSize;
  BYTE  bInterval;
} USB_ENDPOINT_DESCRIPTOR;

/* USB String Descriptor */
typedef __packed struct _USB_STRING_DESCRIPTOR {
  BYTE  bLength;
  BYTE  bDescriptorType;
  WORD  bString/*[]*/;
} USB_STRING_DESCRIPTOR;

/* USB Common Descriptor */
typedef __packed struct _USB_COMMON_DESCRIPTOR {
  BYTE  bLength;
  BYTE  bDescriptorType;
} USB_COMMON_DESCRIPTOR;

typedef struct {
	DWORD DTERRate;
	BYTE CharFormat;
	BYTE ParityType;
	BYTE DataBits;
} LineCoding;

#define FALSE   (0)
#define TRUE    (1)
#define NULL    ((void *)0)

#endif







