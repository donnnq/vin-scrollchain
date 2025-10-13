// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title PeaceAccordDAO
 * @dev Emotionally tagged smart contract to log peace agreements,
 * ceasefire rituals, and diplomatic breakthroughs — scrollchain-sealed diplomacy.
 */

contract PeaceAccordDAO {
    address public steward;

    struct AccordEvent {
        address initiator;
        string partiesInvolved; // e.g. "Israel–Hamas"
        string agreementType; // "Ceasefire", "Summit", "Humanitarian Aid"
        string location; // e.g. "Cairo", "Tel Aviv"
        string emotionalTag;
        uint256 timestamp;
    }

    AccordEvent[] public events;

    event AccordLogged(address indexed initiator, string partiesInvolved, string agreementType, string location, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log peace accord rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAccord(address initiator, string memory partiesInvolved, string memory agreementType, string memory location, string memory emotionalTag) external onlySteward {
        events.push(AccordEvent({
            initiator: initiator,
            partiesInvolved: partiesInvolved,
            agreementType: agreementType,
            location: location,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AccordLogged(initiator, partiesInvolved, agreementType, location, emotionalTag, block.timestamp);
    }

    function getAccordByIndex(uint256 index) external view returns (address initiator, string memory partiesInvolved, string memory agreementType, string memory location, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AccordEvent memory a = events[index];
        return (a.initiator, a.partiesInvolved, a.agreementType, a.location, a.emotionalTag, a.timestamp);
    }
}
