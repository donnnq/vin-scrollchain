// SPDX-License-Identifier: Mythic-License
pragma solidity ^0.8.0;

contract ReformDeck {
    address public steward;
    mapping(address => ReformPath) public reformees;

    struct ReformPath {
        bool verified;
        string originScroll; // e.g., "UndergroundHustle.sol"
        string civicVow;
        uint256 timestamp;
        string blessing;
    }

    event ReformInitiated(address indexed reformee, string originScroll);
    event ReformBlessed(address indexed reformee, string civicVow, string blessing);

    constructor() {
        steward = msg.sender;
    }

    function initiateReform(address _reformee, string memory _originScroll) public {
        require(msg.sender == steward, "Only steward can initiate");
        reformees[_reformee] = ReformPath(false, _originScroll, "", block.timestamp, "");
        emit ReformInitiated(_reformee, _originScroll);
    }

    function blessReform(address _reformee, string memory _civicVow, string memory _blessing) public {
        require(msg.sender == steward, "Only steward can bless");
        ReformPath storage path = reformees[_reformee];
        require(bytes(path.originScroll).length > 0, "Reform not initiated");
        path.verified = true;
        path.civicVow = _civicVow;
        path.blessing = _blessing;
        emit ReformBlessed(_reformee, _civicVow, _blessing);
    }

    function getReformPath(address _reformee) public view returns (ReformPath memory) {
        return reformees[_reformee];
    }
}
