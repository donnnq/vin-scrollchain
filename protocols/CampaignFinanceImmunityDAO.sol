// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CampaignFinanceImmunityDAO {
    address public admin;

    struct FinanceEntry {
        string candidateName;
        string donorEntity;
        string fundingChannel;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    FinanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFinance(string memory candidateName, string memory donorEntity, string memory fundingChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(FinanceEntry(candidateName, donorEntity, fundingChannel, emotionalTag, true, false, false));
    }

    function verifyFinance(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealFinance(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getFinanceEntry(uint256 index) external view returns (FinanceEntry memory) {
        return entries[index];
    }
}
