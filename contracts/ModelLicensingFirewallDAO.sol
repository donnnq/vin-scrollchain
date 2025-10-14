// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModelLicensingFirewallDAO {
    address public admin;

    struct FirewallEntry {
        string modelName;
        string licensingEntity;
        string restrictionLevel;
        string emotionalTag;
        bool enforced;
    }

    FirewallEntry[] public firewalls;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _modelName, string memory _licensingEntity, string memory _restrictionLevel, string memory _emotionalTag) external onlyAdmin {
        firewalls.push(FirewallEntry(_modelName, _licensingEntity, _restrictionLevel, _emotionalTag, false));
    }

    function enforceFirewall(uint256 index) external onlyAdmin {
        firewalls[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (FirewallEntry memory) {
        return firewalls[index];
    }
}
