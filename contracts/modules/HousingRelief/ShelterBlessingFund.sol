// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ShelterBlessingFund
/// @author Vinvin
/// @notice Funds interest subsidies and shelter restoration for displaced families
contract ShelterBlessingFund {
    address public steward;
    mapping(address => uint256) public blessingsReceived;
    event BlessingFunded(address indexed recipient, uint256 amount, string message, uint256 timestamp);

    constructor() {
        steward = msg.sender;
    }

    function fundBlessing(address recipient, uint256 amount, string calldata message) external {
        require(amount > 0, "Blessing must have value");
        blessingsReceived[recipient] += amount;
        emit BlessingFunded(recipient, amount, message, block.timestamp);
    }

    function getBlessingTotal(address recipient) external view returns (uint256) {
        return blessingsReceived[recipient];
    }
}
