// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IMFKarmaTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string countryName;
        string IMFProgram;
        string karmicVerdict;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory countryName, string memory IMFProgram, string memory karmicVerdict, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(countryName, IMFProgram, karmicVerdict, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealTribunalEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
