// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title GroupTechBuddiesDAO
 * @dev Emotionally tagged smart contract to log crew members, game discoveries,
 * optimization rituals, and purok deployments — scrollchain-sealed legend.
 */

contract GroupTechBuddiesDAO {
    address public steward;

    struct CrewMember {
        address initiator;
        string codename;
        string role;
        string purok;
        string emotionalTag;
        uint256 timestamp;
    }

    CrewMember[] public members;

    event CrewMemberLogged(address indexed initiator, string codename, string role, string purok, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log crew members");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMember(address initiator, string memory codename, string memory role, string memory purok, string memory emotionalTag) external onlySteward {
        members.push(CrewMember({
            initiator: initiator,
            codename: codename,
            role: role,
            purok: purok,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CrewMemberLogged(initiator, codename, role, purok, emotionalTag, block.timestamp);
    }

    function getMemberByIndex(uint256 index) external view returns (address initiator, string memory codename, string memory role, string memory purok, string memory emotionalTag, uint256 timestamp) {
        require(index < members.length, "Scrollstorm index out of bounds");
        CrewMember memory m = members[index];
        return (m.initiator, m.codename, m.role, m.purok, m.emotionalTag, m.timestamp);
    }
}
