// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLedBudgetDAO {
    address public admin;

    struct BudgetEntry {
        string youthCouncilName;
        string region;
        string proposalTitle;
        uint256 proposedAmount;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool sealed;
    }

    BudgetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBudgetProposal(string memory youthCouncilName, string memory region, string memory proposalTitle, uint256 proposedAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(BudgetEntry(youthCouncilName, region, proposalTitle, proposedAmount, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealBudgetEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
