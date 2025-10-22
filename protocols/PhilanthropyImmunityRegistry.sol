// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhilanthropyImmunityRegistry {
    address public admin;

    struct ImmunityEntry {
        string foundationName; // "Open Society Foundations"
        string founder; // "George Soros"
        string threatVector; // "IRS audit", "Tax-exempt revocation"
        string emotionalTag;
        bool immune;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function declareImmunity(string memory foundationName, string memory founder, string memory threatVector, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(foundationName, founder, threatVector, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
