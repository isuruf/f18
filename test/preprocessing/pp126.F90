! Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.

! \ newline works in #define
      integer, parameter :: KWM = 666
#define KWM 77\
7
      if (KWM .eq. 777) then
        print *, 'pp126.F90 pass'
      else
        print *, 'pp126.F90 FAIL: ', KWM
      end if
      end
