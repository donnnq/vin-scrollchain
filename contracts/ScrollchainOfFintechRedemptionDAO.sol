// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfFintechRedemptionDAO {
    address public admin;

    struct RedemptionEntry {
        string fintechLabel;
        string redemptionClause;
        string emotionalTag;
        bool sealed;
    }

    RedemptionEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _fintechLabel, string memory _redemptionClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(RedemptionEntry(_fintechLabel, _redemptionClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        ledger[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (RedemptionEntry memory) {
        return ledger[index];
    }
}
