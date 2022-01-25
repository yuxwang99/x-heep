/* Copyright 2018 ETH Zurich and University of Bologna.
 * Copyright and related rights are licensed under the Solderpad Hardware
 * License, Version 0.51 (the “License”); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
 * or agreed to in writing, software, hardware and materials distributed under
 * this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 *
 *
 * Description: Contains common system definitions.
 *
 */

package core_v_mini_mcu_pkg;

  import addr_map_rule_pkg::*;

  localparam SYSTEM_XBAR_NMASTER      = 3;
  localparam SYSTEM_XBAR_NSLAVE       = 5;

  //master idx
  localparam CORE_INSTR_IDX           = 0;
  localparam CORE_DATA_IDX            = 1;
  localparam DEBUG_MASTER_IDX         = 2;

  //slave mmap and idx
  localparam ERROR_START_ADDRESS      = 32'hBADACCE5;
  localparam ERROR_SIZE               = 32'h00000001;
  localparam ERROR_END_ADDRESS        = ERROR_START_ADDRESS + ERROR_SIZE;
  localparam ERROR_IDX                = 0;

  localparam RAM0_START_ADDRESS       = 32'h00000000;
  localparam RAM0_SIZE                = 32'h00008000;
  localparam RAM0_END_ADDRESS         = RAM0_START_ADDRESS + RAM0_SIZE;
  localparam RAM0_IDX                 = 1;

  localparam RAM1_START_ADDRESS       = 32'h00008000;
  localparam RAM1_SIZE                = 32'h00008000;
  localparam RAM1_END_ADDRESS         = RAM1_START_ADDRESS + RAM1_SIZE;
  localparam RAM1_IDX                 = 2;

  localparam DEBUG_START_ADDRESS      = 32'h${debug_start_address};
  localparam DEBUG_SIZE               = 32'h${debug_size_address};
  localparam DEBUG_END_ADDRESS        = DEBUG_START_ADDRESS + DEBUG_SIZE;
  localparam DEBUG_IDX                = 3;

  localparam PERIPHERAL_START_ADDRESS = 32'h${peripheral_start_address};
  localparam PERIPHERAL_SIZE          = 32'h${peripheral_size_address};
  localparam PERIPHERAL_END_ADDRESS   = PERIPHERAL_START_ADDRESS + PERIPHERAL_SIZE;
  localparam PERIPHERAL_IDX           = 4;

  localparam addr_map_rule_t [SYSTEM_XBAR_NSLAVE-1:0] XBAR_ADDR_RULES = '{
      '{ idx: RAM0_IDX,       start_addr: RAM0_START_ADDRESS,       end_addr: RAM0_END_ADDRESS  },
      '{ idx: RAM1_IDX,       start_addr: RAM1_START_ADDRESS,       end_addr: RAM1_END_ADDRESS  },
      '{ idx: DEBUG_IDX,      start_addr: DEBUG_START_ADDRESS,      end_addr: DEBUG_END_ADDRESS },
      '{ idx: PERIPHERAL_IDX, start_addr: PERIPHERAL_START_ADDRESS, end_addr: PERIPHERAL_END_ADDRESS },
      '{ idx: ERROR_IDX,      start_addr: ERROR_START_ADDRESS,      end_addr: ERROR_END_ADDRESS }
  };

  localparam int unsigned XBAR_PORT_SEL_WIDTH = SYSTEM_XBAR_NSLAVE > 1 ? $clog2(SYSTEM_XBAR_NSLAVE) : 32'd1;

  //slave encoder
  localparam SYSTEM_NPERIPHERALS      = 1;

  localparam UART_START_ADDRESS       = PERIPHERAL_START_ADDRESS + 32'h${uart_start_offset};
  localparam UART_SIZE                = 32'h${uart_size_address};
  localparam UART_END_ADDRESS         = UART_START_ADDRESS + UART_SIZE;
  localparam UART_IDX                 = 0;

  localparam addr_map_rule_t [SYSTEM_NPERIPHERALS-1:0] PERIPHERALS_ADDR_RULES = '{
      '{ idx: UART_IDX, start_addr: UART_START_ADDRESS, end_addr: UART_END_ADDRESS }
  };

  localparam int unsigned PERIPHERALS_PORT_SEL_WIDTH = PERIPHERALS_ADDR_RULES > 1 ? $clog2(PERIPHERALS_ADDR_RULES) : 32'd1;

endpackage