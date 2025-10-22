// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalProphecyImmunityGrid {
    address public admin;

    struct ImmunityEntry {
        string broadcaster; // "Sangkay Janjan"
        string prophecyType; // "ICC arrest rumor"
        string immunityScope; // "Speculative commentary", "Public discourse"
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

    function declareImmunity(string memory broadcaster, string memory prophecyType, string memory immunityScope, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(broadcaster, prophecyType, immunityScope, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
