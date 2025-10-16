// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MastermindLocatorPack {
    address public admin;

    struct SuspectProfile {
        string name;
        string assetTrail;
        string agencyLink;
        string emotionalTag;
        bool confirmed;
    }

    SuspectProfile[] public profiles;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProfile(string memory name, string memory assetTrail, string memory agencyLink, string memory emotionalTag) external onlyAdmin {
        profiles.push(SuspectProfile(name, assetTrail, agencyLink, emotionalTag, false));
    }

    function confirmProfile(uint256 index) external onlyAdmin {
        profiles[index].confirmed = true;
    }

    function getProfile(uint256 index) external view returns (SuspectProfile memory) {
        return profiles[index];
    }
}
