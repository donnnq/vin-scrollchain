// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankingCollapseDAO {
    address public admin;

    struct CollapseEntry {
        string institution;
        string triggerEvent;
        string valuationLoss;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    CollapseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCollapse(string memory institution, string memory triggerEvent, string memory valuationLoss, string memory emotionalTag) external onlyAdmin {
        entries.push(CollapseEntry(institution, triggerEvent, valuationLoss, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealCollapseEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getCollapseEntry(uint256 index) external view returns (CollapseEntry memory) {
        return entries[index];
    }
}
