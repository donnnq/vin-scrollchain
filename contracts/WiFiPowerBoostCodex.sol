// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WiFiPowerBoostCodex {
    address public admin;

    struct BoostEntry {
        string deviceLabel;
        string cloudProvider;
        string emotionalTag;
        bool activated;
    }

    BoostEntry[] public boosts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBoost(string memory deviceLabel, string memory cloudProvider, string memory emotionalTag) external onlyAdmin {
        boosts.push(BoostEntry(deviceLabel, cloudProvider, emotionalTag, false));
    }

    function activateBoost(uint256 index) external onlyAdmin {
        boosts[index].activated = true;
    }

    function getBoost(uint256 index) external view returns (BoostEntry memory) {
        return boosts[index];
    }
}
