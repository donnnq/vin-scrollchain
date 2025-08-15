// SPDX-License-Identifier: Mythic-License
pragma solidity ^0.8.0;

contract BlessingScroll {
    address public steward;
    mapping(address => Blessing) public blessings;

    struct Blessing {
        string reformVow;
        string emotionalAPR;
        string civicRole;
        uint256 timestamp;
        bool soulbound;
    }

    event BlessingEncoded(address indexed reformee, string civicRole, string emotionalAPR);

    constructor() {
        steward = msg.sender;
    }

    function encodeBlessing(
        address _reformee,
        string memory _reformVow,
        string memory _emotionalAPR,
        string memory _civicRole
    ) public {
        require(msg.sender == steward, "Only steward can encode blessings");
        blessings[_reformee] = Blessing(_reformVow, _emotionalAPR, _civicRole, block.timestamp, true);
        emit BlessingEncoded(_reformee, _civicRole, _emotionalAPR);
    }

    function getBlessing(address _reformee) public view returns (Blessing memory) {
        return blessings[_reformee];
    }
}
