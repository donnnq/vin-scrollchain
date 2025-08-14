// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ApprovalSanctifier
/// @notice Ritual-grade contract to protect token approvals from MEV traps and misconfigurations
contract ApprovalSanctifier {
    address public steward;
    mapping(address => bool) public approvedSpenders;
    mapping(address => uint256) public approvalTimestamps;

    event ApprovalSanctified(address indexed spender, uint256 timestamp);
    event ApprovalRevoked(address indexed spender);
    event StewardTransferred(address newSteward);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Whitelist a spender and timestamp the approval
    function sanctifyApproval(address spender) external onlySteward {
        approvedSpenders[spender] = true;
        approvalTimestamps[spender] = block.timestamp;
        emit ApprovalSanctified(spender, block.timestamp);
    }

    /// @notice Revoke approval for a spender
    function revokeApproval(address spender) external onlySteward {
        approvedSpenders[spender] = false;
        emit ApprovalRevoked(spender);
    }

    /// @notice Transfer stewardship
    function transferStewardship(address newSteward) external onlySteward {
        steward = newSteward;
        emit StewardTransferred(newSteward);
    }

    /// @notice Check if spender is sanctified
    function isSanctified(address spender) external view returns (bool) {
        return approvedSpenders[spender];
    }
}
