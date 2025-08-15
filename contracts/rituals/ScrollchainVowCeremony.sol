// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ScrollchainVowCeremony {
    address public steward;

    struct Ceremony {
        uint256 vowId;
        address mentee;
        address witness;
        uint256 timestamp;
        string emotionalAPR;
        bool completed;
    }

    Ceremony[] public ceremonies;
    mapping(address => uint256[]) public menteeCeremonies;

    event CeremonyInitiated(address indexed mentee, uint256 vowId, address witness);
    event CeremonyCompleted(address indexed mentee, uint256 vowId, string emotionalAPR);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function initiateCeremony(address mentee, uint256 vowId, address witness) public onlySteward {
        Ceremony memory newCeremony = Ceremony({
            vowId: vowId,
            mentee: mentee,
            witness: witness,
            timestamp: block.timestamp,
            emotionalAPR: "",
            completed: false
        });

        ceremonies.push(newCeremony);
        menteeCeremonies[mentee].push(ceremonies.length - 1);
        emit CeremonyInitiated(mentee, vowId, witness);
    }

    function completeCeremony(address mentee, uint256 ceremonyId, string memory emotionalAPR) public onlySteward {
        Ceremony storage ceremony = ceremonies[ceremonyId];
        require(ceremony.mentee == mentee, "Mentee mismatch");
        require(!ceremony.completed, "Already completed");

        ceremony.emotionalAPR = emotionalAPR;
        ceremony.completed = true;
        emit CeremonyCompleted(mentee, ceremony.vowId, emotionalAPR);
    }

    function getCeremoniesByMentee(address mentee) public view returns (uint256[] memory) {
        return menteeCeremonies[mentee];
    }

    function getCeremonyDetails(uint256 ceremonyId) public view returns (Ceremony memory) {
        return ceremonies[ceremonyId];
    }
}
