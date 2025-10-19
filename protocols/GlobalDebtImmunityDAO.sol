// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalDebtImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string countryName;
        string crisisType;
        string bufferStrategy;
        string emotionalTag;
        bool summoned;
        bool activated;
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

    function summonImmunity(string memory countryName, string memory crisisType, string memory bufferStrategy, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(countryName, crisisType, bufferStrategy, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
