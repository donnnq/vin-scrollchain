// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalDynastyRegistryDAO {
    address public admin;

    struct DynastyEntry {
        string surname;
        string officeHeld;
        string relationType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    DynastyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDynasty(string memory surname, string memory officeHeld, string memory relationType, string memory emotionalTag) external onlyAdmin {
        entries.push(DynastyEntry(surname, officeHeld, relationType, emotionalTag, true, false, false));
    }

    function verifyDynasty(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealDynasty(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getDynastyEntry(uint256 index) external view returns (DynastyEntry memory) {
        return entries[index];
    }
}
