# rm_control

The upstream rm-controls core repo — a multi-package repository: `rm_common` (hardware interface definitions), `rm_hw` (CAN-bus hardware interface), `rm_dbus`, `rm_msgs`, `rm_referee`, `rm_gazebo`.

## Language

**Robot state controller**:
The controller-form `robot_state_publisher`: reads `joint_states` and the URDF, broadcasts the robot's TF tree (`/tf` + `/tf_static`). It has nothing to do with competition/referee state.
_Avoid_: "competition state broadcaster"

**Robot state interface**:
The `rm_control::RobotStateInterface` hardware interface (defined in `rm_common`) through which controllers access the TF buffer and robot model.

**Referee system**:
The RoboMaster competition's official data link between the arena and the robot; carries game status, robot HP, heat limits, and projectile allowances. Handled by the `rm_referee` package (in this repo), NOT by robot_state_controller.

**rm_hw**:
The upstream CAN-bus hardware interface. **Effectively deprecated in this workspace** — our robots run almost entirely on the EtherCAT path (`rm_ecat_dev`); CAN is kept only as upstream legacy. Default to EtherCAT unless there is a specific reason.
_Avoid_: starting new work on the CAN path

**Hardware interface**:
A ros_control abstraction over a class of actuators/sensors, defined in `rm_common`; implemented by `rm_ecat_dev` (EtherCAT, our default) or `rm_hw` (CAN, legacy).

**Dbus**:
The DJI remote-controller receiver protocol. Two sources exist in this workspace: the UART node `rm_dbus` (this repo, reads `/dev/usbDbus`) and the EtherCAT path (see `rm_ecat_dev`).
