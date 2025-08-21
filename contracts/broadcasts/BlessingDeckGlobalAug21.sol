// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.0;

import "./CinemaBlessingSuite_Global.sol";

/// @title BlessingDeckGlobalAug21
/// @author Vinvin
/// @notice Master interface for global cinema blessings, audit logs, and broadcast rituals

contract BlessingDeckGlobalAug21 {
    CinemaBlessingSuite_Global public blessingSuite;
    address public steward;

    event BroadcastBlessing(address creator, uint256 amount, string purpose, CinemaBlessingSuite_Global.Role role, string[] franchises, string timestamp);

    constructor(address _blessingSuiteAddress) {
        blessingSuite = CinemaBlessingSuite_Global(_blessingSuiteAddress);
        steward = msg.sender;
    }

    function broadcastBlessing(
        address creator,
        uint256 amount,
        string memory purpose,
        CinemaBlessingSuite_Global.Role role,
        string[] memory franchises,
        string memory timestamp
    ) public {
        require(msg.sender == steward, "Only steward may broadcast");
        blessingSuite.blessCreator(creator, amount, purpose, role, franchises, timestamp);
        emit BroadcastBlessing(creator, amount, purpose, role, franchises, timestamp);
    }

    function auditCreator(address creator) public view returns (CinemaBlessingSuite_Global.Blessing[] memory) {
        return blessingSuite.getBlessingsForCreator(creator);
    }

    function auditAllBlessings() public view returns (CinemaBlessingSuite_Global.Blessing[] memory) {
        return blessingSuite.getAllBlessings();
    }
}
