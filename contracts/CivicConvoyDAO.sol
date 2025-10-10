// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CivicConvoyDAO {
    address public originator;

    struct ConvoyMission {
        string commissionerName;
        string vehicleTag;
        string missionType;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ConvoyMission[] public convoyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logConvoyMission(
        string memory commissionerName,
        string memory vehicleTag,
        string memory missionType,
        bool isScrollchainSealed
    ) external {
        convoyLedger.push(ConvoyMission({
            commissionerName: commissionerName,
            vehicleTag: vehicleTag,
            missionType: missionType,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
