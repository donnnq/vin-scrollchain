// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokSovereigntyFirewallRegistryDAO {
    address public admin;

    struct FirewallEntry {
        string purokOrBarangay;
        string firewallClause;
        string emotionalTag;
        bool activated;
    }

    FirewallEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitFirewall(string memory _purokOrBarangay, string memory _firewallClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(FirewallEntry(_purokOrBarangay, _firewallClause, _emotionalTag, false));
    }

    function activateFirewall(uint256 index) external onlyAdmin {
        registry[index].activated = true;
    }

    function getFirewall(uint256 index) external view returns (FirewallEntry memory) {
        return registry[index];
    }
}
