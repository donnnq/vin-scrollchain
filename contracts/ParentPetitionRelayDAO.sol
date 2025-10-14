// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ParentPetitionRelayDAO {
    address public steward;

    struct PetitionEvent {
        string schoolZone; // "Malolos", "Northville 8", "San Rafael"
        string petitionType; // "Online Class Request", "Modular Mode Demand", "Safety Audit Call"
        string emotionalTag;
        uint256 timestamp;
    }

    PetitionEvent[] public events;

    event PetitionLogged(
        string schoolZone,
        string petitionType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log parent petition rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logPetition(
        string memory schoolZone,
        string memory petitionType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(PetitionEvent({
            schoolZone: schoolZone,
            petitionType: petitionType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit PetitionLogged(schoolZone, petitionType, emotionalTag, block.timestamp);
    }
}
