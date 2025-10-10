// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AuditVanSanctumDAO {
    address public originator;

    struct VanMission {
        string commissionerName;
        string missionType;
        string locationTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    VanMission[] public vanLedger;

    constructor() {
        originator = msg.sender;
    }

    function logVanMission(
        string memory commissionerName,
        string memory missionType,
        string memory locationTag,
        bool isScrollchainSealed
    ) external {
        vanLedger.push(VanMission({
            commissionerName: commissionerName,
            missionType: missionType,
            locationTag: locationTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
