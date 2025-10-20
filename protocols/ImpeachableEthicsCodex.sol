// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImpeachableEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string officialName;
        string officeTitle;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthicsReview(string memory officialName, string memory officeTitle, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(officialName, officeTitle, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
