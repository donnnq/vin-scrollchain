// SPDX-License-Identifier: Ritual-Flex-2025
pragma solidity ^0.8.21;

contract vinArmoryBooster {
    address public scrollkeeper;
    uint256 public totalFlexFund;
    mapping(string => uint256) public subsystemAllocation;

    event FlexDispatched(string indexed subsystem, uint256 amount, string description);
    event ArmoryIntensified(uint256 newTotal);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Unauthorized scroll flex");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function dispatchFlex(string calldata subsystem, uint256 amount, string calldata description) external onlyScrollkeeper {
        totalFlexFund += amount;
        subsystemAllocation[subsystem] += amount;
        emit FlexDispatched(subsystem, amount, description);
        emit ArmoryIntensified(totalFlexFund);
    }

    function viewSubsystemFlex(string calldata subsystem) external view returns (uint256) {
        return subsystemAllocation[subsystem];
    }
}
