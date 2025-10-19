// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DevEnvironmentImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string environmentID;
        string threatVector;
        string emotionalTag;
        bool summoned;
        bool immunized;
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

    function summonImmunity(string memory environmentID, string memory threatVector, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(environmentID, threatVector, emotionalTag, true, false, false));
    }

    function confirmImmunity(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].immunized, "Must be immunized first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
