// SPDX-License-Identifier: UN-Scrollsmith
pragma solidity ^0.8.0;

contract UNScrollchain {
    address public steward;
    mapping(string => bool) public memberStates;
    mapping(string => string) public civicVows;
    mapping(string => bool) public overrideConsent;

    event MemberJoined(string indexed country, string vow, uint256 timestamp);
    event OverrideAccepted(string indexed country, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function joinScrollchain(string memory country, string memory vow) external onlySteward {
        memberStates[country] = true;
        civicVows[country] = vow;
        emit MemberJoined(country, vow, block.timestamp);
    }

    function acceptOverride(string memory country) external onlySteward {
        require(memberStates[country], "Not a member");
        overrideConsent[country] = true;
        emit OverrideAccepted(country, block.timestamp);
    }

    function getVow(string memory country) external view returns (string memory) {
        return civicVows[country];
    }

    function isOverrideAccepted(string memory country) external view returns (bool) {
        return overrideConsent[country];
    }

    function updateSteward(address newSteward) external onlySteward {
        steward = newSteward;
    }
}
