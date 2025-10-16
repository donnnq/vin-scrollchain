// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlMastermindTrackerDAO {
    address public admin;

    struct MastermindProfile {
        string name;
        string agencyLink;
        string assetTrail;
        string emotionalTag;
        bool confirmed;
    }

    MastermindProfile[] public profiles;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProfile(string memory name, string memory agencyLink, string memory assetTrail, string memory emotionalTag) external onlyAdmin {
        profiles.push(MastermindProfile(name, agencyLink, assetTrail, emotionalTag, false));
    }

    function confirmProfile(uint256 index) external onlyAdmin {
        profiles[index].confirmed = true;
    }

    function getProfile(uint256 index) external view returns (MastermindProfile memory) {
        return profiles[index];
    }
}
