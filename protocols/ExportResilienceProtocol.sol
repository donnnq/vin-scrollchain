// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExportResilienceProtocol {
    address public admin;

    struct ResilienceEntry {
        string sector; // "Electronics", "Semiconductors"
        string threat; // "US tariffs", "Sectoral levies"
        string mitigation; // "FTA diversification", "Lobbying exclusion"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployResilience(string memory sector, string memory threat, string memory mitigation, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(sector, threat, mitigation, emotionalTag, true, false));
    }

    function sealResilienceEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
