#include "usb.h"

// device descriptor
const uint8_t Virtual_Com_Port_DeviceDescriptor[] =
{
	0x12, // ������ ������� �����������
	0x01, // ��� ������� ����������� - device descriptor 
	0x00, 0x02, // 2 ����� - ������ usb 2.0
	0x02, // ����� ���������� cdc
	0x00, // ��������
	0x00, // ��������
	USB_MAX_PACKET0, // max ������ ������ ��� ������� �������� �����
	0x83, 0x04, // 2 ����� - VID
	0x40,	0x57,// 2 ����� - PID
	0x00, 0x02,// 2 ����� - ������ (�������) ����������
	0x01, // ������ ������ � ��������� �������������
	0x02, // ������ ������ � ��������� ����������
	0x03, // ������ ������ � �������� ������� ����������
	0x01  // ���������� �������������� ������������
};

// configuration descriptor
const uint8_t Virtual_Com_Port_ConfigDescriptor[] =
{
	/* ============== CONFIGURATION 1 =========== */
	/* Configuration 1 descriptor */
	0x09,   // ������ ����������� ������������
	0x02,   // ��� ����������� - configuration
	0x43,   // 2 ����� - ������ ������ �����������, ������� ��. ����������� 
	0x00,   // (CwTotalLength 2 EP + Control)
	0x02,   // ���������� ����������� (2 ���������� ��� CDC - data � config)
	0x01,   // ����� ������ ������������ (SET_CONFIGURATION)
	0x00,   // ������ ������ ����������� ������ ������������
	0xC0,   // ������� ����, ��������������� ������������
					/*
						 ������������� ���:
						 D7 � ��������������� (����������� � 1);
						 D6 � ������� ������� ������������ ��������� �������;
						 D5 � ������� ���������� ��������� ����� � ������
						 ���������� �� ������ ����;
						 D4...D0 � ��������������� (�������� � 0)
					*/
	0x00,   // max ������������ ��� �� ���� (�������� �� ��������� (50 = 100��))

		/* Communication Class Interface Descriptor Requirement */
		0x09, // ����� �����������
		0x04, // ��� ����������� - ���������
		0x00, // ����� ������� ����������
		0x00, // ����� �������������� ��������� ��� ����������
		0x01, // ���������� ����� ��� ������ �������������� ��������� � ������ ����������
		0x02, // ��� ������(USB-IF)
		0x02, // ��� ���������(USB-IF)
		0x00, // ��� ���������(USB-IF)
		0x01, // ������ ������, ����������� ������ �������������� ��������� ������� ����������

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
		0x07,   // ������ �����������
		0x05,   // ��� ����������� - endpoint
		0x81,   // ������� ���� ������ ����� // IN
						/*
							D7 � ����������� �������� ������ ������ (1 � IN, 0 � OUT);
							D6...D4 � ��������������� (�������� � 0);
							D3...D0 � ����� �����
						*/
		0x03,   // ������� ����, ��������������� �����
						/*
							D7, D6 � ��������������� (�������� � 0);
							D5, D4 � �������, ����������� ������:
								00 � ����� ������;
								01 � ����� �������� �����;
								10 � ����� ������ � ������� �������� ������;
								11 � ���������������
							D3, D2 � ��� ������������� ����� � �����:
								00 � ��� �������������;
								01 � �����������;
								10 � ����������;
								11 � ����������
							D1, D0 � ��� ������ �������:
								00 � �����������;
								01 � ����������;
								10 � bulk;
								11 � interrupt
						*/
		64,	      //2 ����� - ������� ���� 
		//0x08,   //2 ����� - ������� ����, 
						// ��������������� ������ ������ ������������ ������					
		0x00,		/*
							D15�D13 � ��������������� (�������� � 0);
							D12, D11 � ���������� �������������� �������:
								00 � ��� �������������� �������;
								01 � 1 �������������� �������� (����� 2 ��������),
								10 � 2 �������������� �������� (����� 3 ��������);
								11 � ���������������.
							D10...D0 � ������ ������ � ������
						*/
		0xFF,   // �������� ���������� ����� � ������ �������

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
	0x04, // ����� �����������
	0x03, // ��� ����������� - string desc
	0x09, // N ���� ������������� �����
	0x04  /* LangID = 0x0409: U.S. English */
};

const uint8_t Virtual_Com_Port_StringVendor[] =
{
	10, // ����� ����������
	0x03, // ��� ����������� - string desc
	/* ��� */
	'T', 0, 
	'E', 0, 
	'S', 0, 
	'T', 0
};

const uint8_t Virtual_Com_Port_StringProduct[] =
{
	10, // ����� ����������
	0x03, // ��� ����������� - string desc
	/* ��� */
	'T', 0, 
	'E', 0, 
	'S', 0, 
	'T', 0
};

const uint8_t Virtual_Com_Port_StringSerial[] =
{
	10, // ����� ����������
	0x03, // ��� ����������� - string desc
	/* ��� */
	'T', 0, 
	'E', 0, 
	'S', 0, 
	'T', 0
};
