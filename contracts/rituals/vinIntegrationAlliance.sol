// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Integration Alliance
/// @notice Logs cross-cultural collaboration rituals and mutual effort contracts
contract vinIntegrationAlliance {
    struct AlliancePing {
        uint256 timestamp;
        address initiator;
        string hostCommunity;
        string foreignGroup;
        string initiativeType;     // e.g. "Language Exchange", "Civic Project"
        string outcomeNote;
    }

    address public scrollkeeper;
    uint256 public allianceCount;
    mapping(uint256 => AlliancePing) public alliances;

    event AllianceLogged(
        uint256 indexed id,
        address indexed initiator,
        string hostCommunity,
        string foreignGroup
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logAlliance(
        string memory _hostCommunity,
        string memory _foreignGroup,
        string memory _initiativeType,
        string memory _outcomeNote
    ) public {
        alliances[allianceCount] = AlliancePing({
            timestamp: block.timestamp,
            initiator: msg.sender,
            hostCommunity: _hostCommunity,
            foreignGroup: _foreignGroup,
            initiativeType: _initiativeType,
            outcomeNote: _outcomeNote
        });

        emit AllianceLogged(allianceCount, msg.sender, _hostCommunity, _foreignGroup);
        allianceCount++;
    }

    function getAlliance(uint256 _id) public view returns (AlliancePing memory) {
        require(_id < allianceCount, "No alliance found");
        return alliances[_id];
    }
}
