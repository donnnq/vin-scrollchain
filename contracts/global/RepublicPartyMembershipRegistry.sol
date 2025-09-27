// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title RepublicPartyMembershipRegistry
/// @notice Immortalizes Republic Party members and civic pledges
/// @dev Anchors validator-grade identity, emotional consequence, and restoration commitment

contract RepublicPartyMembershipRegistry {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct Member {
        uint256 id;
        address wallet;
        string name;
        string region; // e.g., "Central Luzon", "Visayas", "Mindanao"
        string emotionalTag; // e.g., "Republic sanctum seeded"
        string civicPledge; // e.g., "I commit to validator-grade restoration and nonviolent consequence"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => Member> public members;

    event ValidatorSet(address indexed account, bool status);
    event MemberRegistered(uint256 indexed id, address wallet, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function registerMember(
        address wallet,
        string calldata name,
        string calldata region,
        string calldata emotionalTag,
        string calldata civicPledge
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        members[id] = Member({
            id: id,
            wallet: wallet,
            name: name,
            region: region,
            emotionalTag: emotionalTag,
            civicPledge: civicPledge,
            timestamp: block.timestamp
        });
        emit MemberRegistered(id, wallet, emotionalTag);
    }

    function getMember(uint256 id) external view returns (Member memory) {
        return members[id];
    }
}
