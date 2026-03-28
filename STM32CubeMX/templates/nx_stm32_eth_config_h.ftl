[#ftl]
/**************************************************************************/
/*                                                                        */
/*       Copyright (c) Microsoft Corporation. All rights reserved.        */
/*                                                                        */
/*       This software is licensed under the Microsoft Software License   */
/*       Terms for Microsoft Azure RTOS. Full text of the license can be  */
/*       found in the LICENSE file at https://aka.ms/AzureRTOS_EULA       */
/*       and in the root directory of this software.                      */
/*                                                                        */
/**************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef NX_STM32_ETH_CONFIG_H
#define NX_STM32_ETH_CONFIG_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "${FamilyName?lower_case}xx_hal.h"
[#if RTEdatas??]
[#list RTEdatas as define]
[#if define?contains("LAN8742")]
#include "lan8742.h"
[/#if]
[/#list]
[/#if]

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
[#assign eth_enabled = "0"]

[#if RTEdatas??]
[#list RTEdatas as define]
[#if define?contains("LAN8742") || define?contains("NX_ETH_INTERFACE_ENABLED")]

[#assign eth_enabled = "1"]

[/#if]
[/#list]
[/#if]

[#if eth_enabled == "1"]
/* This define enables the call of nx_eth_init() from the interface layer.*/
/* #define NX_DRIVER_ETH_HW_IP_INIT */

[/#if]
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
[#if eth_enabled == "1"]

extern ETH_HandleTypeDef heth;

#define eth_handle  heth

#ifdef NX_DRIVER_ETH_HW_IP_INIT
extern void MX_ETH_Init(void);
#define nx_eth_init MX_ETH_Init
#endif /* #define NX_DRIVER_ETH_HW_IP_INIT */

[#if "${FamilyName?lower_case}" == "stm32f4"]
 /* Enable the legacy Ethernet API for STM32F4 */
 #define STM32_ETH_HAL_LEGACY
[/#if]
[/#if]
/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */


#ifdef __cplusplus
}
#endif

#endif /* NX_STM32_ETH_CONFIG_H */


