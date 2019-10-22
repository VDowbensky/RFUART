#include "type.h"

#ifndef __USB_H
#define __USB_H

#define USB_BASE_ADDR   0x40005C00 
#define USB_PMA_ADDR    0x40006000

#define REG(x)  (*((volatile unsigned int *)(x)))

#define EPxREG(x)       REG(USB_BASE_ADDR + 4*(x))
#define CNTR    REG(USB_BASE_ADDR + 0x40)   
#define ISTR    REG(USB_BASE_ADDR + 0x44)   
#define FNR     REG(USB_BASE_ADDR + 0x48)   
#define DADDR   REG(USB_BASE_ADDR + 0x4C)   
#define BTABLE  REG(USB_BASE_ADDR + 0x50) 

// CNTR control register bits definitions                         
#define CNTR_CTRM   (0x8000) /* Correct TRansfer Mask */
#define CNTR_DOVRM  (0x4000) /* DMA OVeR/underrun Mask */
#define CNTR_ERRM   (0x2000) /* ERRor Mask */
#define CNTR_WKUPM  (0x1000) /* WaKe UP Mask */
#define CNTR_SUSPM  (0x0800) /* SUSPend Mask */
#define CNTR_RESETM (0x0400) /* RESET Mask   */
#define CNTR_SOFM   (0x0200) /* Start Of Frame Mask */
#define CNTR_ESOFM  (0x0100) /* Expected Start Of Frame Mask */
#define CNTR_RESUME (0x0010) /* RESUME request */
#define CNTR_FSUSP  (0x0008) /* Force SUSPend */
#define CNTR_LPMODE (0x0004) /* Low-power MODE */
#define CNTR_PDWN   (0x0002) /* Power DoWN */
#define CNTR_FRES   (0x0001) /* Force USB RESet */

#define  VECTACTIVE      (0x000001FF)
#define  rNVIC_ICSR      (*((volatile unsigned int*)0xE000ED04))

/* EPxREG: EndPoint Registers Bit Definitions */
#define EP_CTR_RX       0x8000      /* Correct RX Transfer */
#define EP_DTOG_RX      0x4000      /* RX Data Toggle */
#define EP_STAT_RX      0x3000      /* RX Status */
#define EP_SETUP        0x0800      /* EndPoint Setup */
#define EP_TYPE         0x0600      /* EndPoint Type */
#define EP_KIND         0x0100      /* EndPoint Kind */
#define EP_CTR_TX       0x0080      /* Correct TX Transfer */
#define EP_DTOG_TX      0x0040      /* TX Data Toggle */
#define EP_STAT_TX      0x0030      /* TX Status */
#define EP_EA           0x000F      /* EndPoint Address */

/* EndPoint Register Mask (No Toggle Fields) */
#define EP_MASK         (EP_CTR_RX|EP_SETUP|EP_TYPE|EP_KIND|EP_CTR_TX|EP_EA)



#define EP_ADDR_MASK    0xFFFE      /* Address Mask */
#define EP_COUNT_MASK   0x03FF      /* Count Mask */

/* EP_STAT_RX: RX Status */
#define EP_RX_DIS       0x0000      /* Disabled */
#define EP_RX_STALL     0x1000      /* Stalled */
#define EP_RX_NAK       0x2000      /* NAKed */
#define EP_RX_VALID     0x3000      /* Valid */

#define REG(x)  (*((volatile unsigned int *)(x)))
#define EPxREG(x)       REG(USB_BASE_ADDR + 4*(x))

#define EP_BUF_ADDR     (sizeof(EP_BUF_DSCR) * 3) // Endpoint Buffer Start Address

#define EP_CTR_RX       0x8000      
#define EP_DTOG_RX      0x4000      
#define EP_STAT_RX      0x3000      
#define EP_SETUP        0x0800      
#define EP_TYPE         0x0600      
#define EP_KIND         0x0100      
#define EP_CTR_TX       0x0080      
#define EP_DTOG_TX      0x0040      
#define EP_STAT_TX      0x0030      
#define EP_EA           0x000F      

#define EP_MASK         (EP_CTR_RX|EP_SETUP|EP_TYPE|EP_KIND|EP_CTR_TX|EP_EA)

#define USB_EP_EVENT        0x0003

/* EP_STAT_TX: TX Status */
#define EP_TX_DIS       0x0000      /* Disabled */
#define EP_TX_STALL     0x0010      /* Stalled */
#define EP_TX_NAK       0x0020      /* NAKed */
#define EP_TX_VALID     0x0030      /* Valid */

/* EP_TYPE: EndPoint Types */
#define EP_BULK         0x0000      /* BULK EndPoint */
#define EP_CONTROL      0x0200      /* CONTROL EndPoint */
#define EP_ISOCHRONOUS  0x0400      /* ISOCHRONOUS EndPoint */
#define EP_INTERRUPT    0x0600      /* INTERRUPT EndPoint */

/* DADDR: Device Address Register Bit Definitions */
#define DADDR_EF        0x0080      /* Enable Function */
#define DADDR_ADD       0x007F      /* Device Address */


/* USB_COUNTn_RX */
#define BLSIZE        			  0x8000 //<< 16)
#define NUM_BLOCK_1_BYTE			0x0400 //<< 16)
#define NUM_BLOCK_2_BYTE			0x0800 //<< 16)
#define NUM_BLOCK_3_BYTE			0x1000 //<< 16)
#define NUM_BLOCK_4_BYTE			0x2000 //<< 16)
#define NUM_BLOCK_5_BYTE			0x4000 //<< 16)


#define USB_PMA_ADDR    0x40006000
#define USB_IF_NUM          4
#define USB_EP_NUM          4
#define USB_MAX_PACKET0     0x40

/********************************************************************/


#define USB_EVT_SETUP       1   /* Setup Packet */
#define USB_EVT_OUT         2   /* OUT Packet */
#define USB_EVT_IN          3   /*  IN Packet */

/* bmRequestType.Type */
#define REQUEST_STANDARD           0
#define REQUEST_CLASS              1
#define REQUEST_VENDOR             2
#define REQUEST_RESERVED           3

/* bmRequestType.Recipient */
#define REQUEST_TO_DEVICE          0
#define REQUEST_TO_INTERFACE       1
#define REQUEST_TO_ENDPOINT        2
#define REQUEST_TO_OTHER           3

/* USB Standard Request Codes */
#define USB_REQUEST_GET_STATUS                 0
#define USB_REQUEST_CLEAR_FEATURE              1
#define USB_REQUEST_SET_FEATURE                3
#define USB_REQUEST_SET_ADDRESS                5
#define USB_REQUEST_GET_DESCRIPTOR             6
#define USB_REQUEST_SET_DESCRIPTOR             7
#define USB_REQUEST_GET_CONFIGURATION          8
#define USB_REQUEST_SET_CONFIGURATION          9
#define USB_REQUEST_GET_INTERFACE              10
#define USB_REQUEST_SET_INTERFACE              11
#define USB_REQUEST_SYNC_FRAME                 12

// CDC class request
#define SET_LINE_CODING 0x20
#define GET_LINE_CODING 0x21
#define SET_CONTROL_LINE_STATE 0x22
#define CDC_SEND_BREAK  0x23

/* USB Descriptor Types */
#define USB_DEVICE_DESCRIPTOR_TYPE             1
#define USB_CONFIGURATION_DESCRIPTOR_TYPE      2
#define USB_STRING_DESCRIPTOR_TYPE             3
#define USB_INTERFACE_DESCRIPTOR_TYPE          4
#define USB_ENDPOINT_DESCRIPTOR_TYPE           5
#define USB_DEVICE_QUALIFIER_DESCRIPTOR_TYPE   6
#define USB_OTHER_SPEED_CONFIG_DESCRIPTOR_TYPE 7
#define USB_INTERFACE_POWER_DESCRIPTOR_TYPE    8

#define USB_CONFIG_SELF_POWERED                0xC0
#define USB_GETSTATUS_SELF_POWERED             0x01

#define USB_ENDPOINT_DIRECTION_MASK            0x80

#define USB_DBL_BUF_EP      0x0000

/* bmAttributes in Endpoint Descriptor */
#define USB_ENDPOINT_TYPE_MASK                 0x03
#define USB_ENDPOINT_TYPE_CONTROL              0x00
#define USB_ENDPOINT_TYPE_ISOCHRONOUS          0x01
#define USB_ENDPOINT_TYPE_BULK                 0x02
#define USB_ENDPOINT_TYPE_INTERRUPT            0x03
#define USB_ENDPOINT_SYNC_MASK                 0x0C
#define USB_ENDPOINT_SYNC_NO_SYNCHRONIZATION   0x00
#define USB_ENDPOINT_SYNC_ASYNCHRONOUS         0x04
#define USB_ENDPOINT_SYNC_ADAPTIVE             0x08
#define USB_ENDPOINT_SYNC_SYNCHRONOUS          0x0C
#define USB_ENDPOINT_USAGE_MASK                0x30
#define USB_ENDPOINT_USAGE_DATA                0x00
#define USB_ENDPOINT_USAGE_FEEDBACK            0x10
#define USB_ENDPOINT_USAGE_IMPLICIT_FEEDBACK   0x20
#define USB_ENDPOINT_USAGE_RESERVED            0x30


extern USB_EP_DATA EP0Data;
extern USB_SETUP_PACKET SetupPacket;
extern BYTE  USB_DeviceAddress;
extern LineCoding com_port_option;
extern uint32_t FreeBufAddr;
extern EP_BUF_DSCR *pBUF_DSCR;

extern const uint8_t Virtual_Com_Port_DeviceDescriptor[];
extern const uint8_t Virtual_Com_Port_ConfigDescriptor[];
extern const uint8_t Virtual_Com_Port_StringLangID[];
extern const uint8_t Virtual_Com_Port_StringVendor[];
extern const uint8_t Virtual_Com_Port_StringProduct[];
extern const uint8_t Virtual_Com_Port_StringSerial[];

#endif
