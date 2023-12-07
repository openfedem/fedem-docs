REM SPDX-FileCopyrightText: 2023 SAP SE
REM
REM SPDX-License-Identifier: Apache-2.0
REM
REM This file is part of FEDEM - https://openfedem.org

REM Make TOC
copy fm-begin.hhc fm_.hhc
type htm\introduction\toc.hhc >> fm_.hhc
type htm\mainui\toc.hhc >> fm_.hhc
type htm\dialogbox\toc.hhc >> fm_.hhc
type htm\addons\toc.hhc >> fm_.hhc
type htm\properties\toc.hhc >> fm_.hhc
type htm\plugins\toc.hhc >> fm_.hhc
echo ^</UL^>^</UL^>^</BODY^>^</HTML^> >> fm_.hhc

REM Make joint property pages
cd htm\properties

copy _rigid_joint.htm rigid-joint.htm
type _joint_origin.htm >> rigid-joint.htm
echo ^</body^>^</html^> >> rigid-joint.htm

copy _revolute_joint.htm revolute-joint.htm
type _joint_summary.htm >> revolute-joint.htm
type _revolute_props.htm >> revolute-joint.htm
type _joint_origin.htm >> revolute-joint.htm
type _joint_DOFs_head.htm >> revolute-joint.htm
echo (optionally ^<i^>Tz^</i^> and/or ^<i^>Rz^</i^>). >> revolute-joint.htm
type _joint_DOFs.htm >> revolute-joint.htm
type _joint_results.htm >> revolute-joint.htm
echo ^</body^>^</html^> >> revolute-joint.htm

copy _ball_joint.htm ball-joint.htm
type _joint_summary.htm >> ball-joint.htm
type _ball_props.htm >> ball-joint.htm
type _joint_origin.htm >> ball-joint.htm
type _joint_DOFs_head.htm >> ball-joint.htm
echo (^<i^>Rx-Rz^</i^>). >> ball-joint.htm
type _joint_DOFs.htm >> ball-joint.htm
type _joint_advanced.htm >> ball-joint.htm
type _joint_results.htm >> ball-joint.htm
echo ^</body^>^</html^> >> ball-joint.htm

copy _free_joint.htm free-joint.htm
type _joint_summary.htm >> free-joint.htm
type _free_props.htm >> free-joint.htm
type _joint_origin.htm >> free-joint.htm
type _joint_DOFs_head.htm >> free-joint.htm
echo (^<i^>Tx-Rz^</i^>). >> free-joint.htm
type _joint_DOFs.htm >> free-joint.htm
type _joint_advanced.htm >> free-joint.htm
type _joint_results.htm >> free-joint.htm
echo ^</body^>^</html^> >> free-joint.htm

copy _cylindric_joint.htm cylindric-joint.htm
type _joint_summary.htm >> cylindric-joint.htm
type _cylindric_props.htm >> cylindric-joint.htm
type _joint_DOFs_head.htm >> cylindric-joint.htm
echo (^<i^>Tz^</i^> and ^<i^>Rz^</i^>). >> cylindric-joint.htm
type _joint_DOFs.htm >> cylindric-joint.htm
type _joint_results.htm >> cylindric-joint.htm
echo ^</body^>^</html^> >> cylindric-joint.htm

copy _prismatic_joint.htm prismatic-joint.htm
type _joint_summary.htm >> prismatic-joint.htm
type _prismatic_props.htm >> prismatic-joint.htm
type _joint_DOFs_head.htm >> prismatic-joint.htm
echo (only ^<i^>Tz^</i^>). >> prismatic-joint.htm
type _joint_DOFs.htm >> prismatic-joint.htm
type _joint_results.htm >> prismatic-joint.htm
echo ^</body^>^</html^> >> prismatic-joint.htm

copy _cam_joint.htm cam-joint.htm
type _joint_summary.htm >> cam-joint.htm
type _cam_props.htm >> cam-joint.htm
type _joint_DOFs_head.htm >> cam-joint.htm
echo (^<i^>Tx-Rz^</i^>). >> cam-joint.htm
type _joint_DOFs.htm >> cam-joint.htm
type _joint_results.htm >> cam-joint.htm
echo ^</body^>^</html^> >> cam-joint.htm

cd ..\..
REM Make CHM
"C:\Program Files (x86)\HTML Help Workshop\hhc.exe" fm.hhp
