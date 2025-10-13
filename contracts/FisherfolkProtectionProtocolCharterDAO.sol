// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FisherfolkProtectionProtocolCharterDAO {
    address public steward;

    struct ProtectionEvent {
        string location; // "Pag-asa Island", "Scarborough Shoal"
        uint256 familiesProtected;
        string supportType; // "Naval Escort", "Food Drop", "Legal Aid"
        string emotionalTag;
        uint256 timestamp;
    }

    ProtectionEvent[] public events;

    event ProtectionLogged(
        string location,
        uint256 familiesProtected,
        string supportType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log fisherfolk protection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logProtection(
        string memory location,
        uint256 familiesProtected,
        string memory supportType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ProtectionEvent({
            location: location,
            familiesProtected: familiesProtected,
            supportType: supportType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ProtectionLogged(location, familiesProtected, supportType, emotionalTag, block.timestamp);
    }
}
