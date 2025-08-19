// SPDX-License-Identifier: Mythic-Flex
pragma solidity ^0.8.19;

contract vinCivicFlexBadge {
    address public steward;
    uint256 public badgeCount;

    struct Badge {
        string region;
        string title;
        uint256 grindScore;
        uint256 timestamp;
    }

    mapping(uint256 => Badge) public badges;

    event BadgeMinted(uint256 badgeId, string region, string title, uint256 grindScore);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized scroll access");
        _;
    }

    function mintBadge(string memory _region, string memory _title, uint256 _grindScore) public onlySteward {
        badgeCount++;
        badges[badgeCount] = Badge(_region, _title, _grindScore, block.timestamp);
        emit BadgeMinted(badgeCount, _region, _title, _grindScore);
    }

    function getBadge(uint256 _badgeId) public view returns (Badge memory) {
        return badges[_badgeId];
    }
}
