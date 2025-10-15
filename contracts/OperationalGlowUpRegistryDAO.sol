// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperationalGlowUpRegistryDAO {
    address public admin;

    struct GlowUpEntry {
        string factoryName;
        string upgradeType;
        string emotionalTag;
        bool completed;
    }

    GlowUpEntry[] public upgrades;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitUpgrade(string memory _factoryName, string memory _upgradeType, string memory _emotionalTag) external onlyAdmin {
        upgrades.push(GlowUpEntry(_factoryName, _upgradeType, _emotionalTag, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        upgrades[index].completed = true;
    }

    function getUpgrade(uint256 index) external view returns (GlowUpEntry memory) {
        return upgrades[index];
    }
}
