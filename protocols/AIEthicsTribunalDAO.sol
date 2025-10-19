// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIEthicsTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string entityName;
        string violationType;
        string hearingDate;
        string emotionalTag;
        bool summoned;
        bool adjudicated;
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

    function summonTribunal(string memory entityName, string memory violationType, string memory hearingDate, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(entityName, violationType, hearingDate, emotionalTag, true, false, false));
    }

    function confirmAdjudication(uint256 index) external onlyAdmin {
        entries[index].adjudicated = true;
    }

    function sealTribunalEntry(uint256 index) external onlyAdmin {
        require(entries[index].adjudicated, "Must be adjudicated first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
