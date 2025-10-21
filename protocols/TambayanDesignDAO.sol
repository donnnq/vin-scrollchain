// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TambayanDesignDAO {
    address public admin;

    struct TambayanEntry {
        string location;
        string featureType; // "Benches", "Shade", "Charging Station", "WiFi Zone"
        string designClause;
        string emotionalTag;
        bool summoned;
        bool installed;
        bool sealed;
    }

    TambayanEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTambayan(string memory location, string memory featureType, string memory designClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TambayanEntry(location, featureType, designClause, emotionalTag, true, false, false));
    }

    function confirmInstallation(uint256 index) external onlyAdmin {
        entries[index].installed = true;
    }

    function sealTambayanEntry(uint256 index) external onlyAdmin {
        require(entries[index].installed, "Must be installed first");
        entries[index].sealed = true;
    }

    function getTambayanEntry(uint256 index) external view returns (TambayanEntry memory) {
        return entries[index];
    }
}
