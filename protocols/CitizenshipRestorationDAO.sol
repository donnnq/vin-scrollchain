// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenshipRestorationDAO {
    address public admin;

    struct RestorationEntry {
        string person;
        string originCountry;
        string emotionalTag;
        bool summoned;
        bool restored;
        bool sealed;
    }

    RestorationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRestoration(string memory person, string memory originCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(RestorationEntry(person, originCountry, emotionalTag, true, false, false));
    }

    function restoreCitizenship(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function sealRestoration(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getRestorationEntry(uint256 index) external view returns (RestorationEntry memory) {
        return entries[index];
    }
}
