// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalDeploymentSatireRegistry {
    address public admin;

    struct SatireEntry {
        string initiator; // "Trump Treasury"
        string target; // "George Soros"
        string satireContext; // "IRS weaponization", "Audit theater"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    SatireEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerSatire(string memory initiator, string memory target, string memory satireContext, string memory emotionalTag) external onlyAdmin {
        entries.push(SatireEntry(initiator, target, satireContext, emotionalTag, true, false));
    }

    function sealSatireEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getSatireEntry(uint256 index) external view returns (SatireEntry memory) {
        return entries[index];
    }
}
