// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaSovereigntyLedgerDAO {
    address public admin;

    struct SovereigntyEntry {
        string diasporaRegion;
        string contributionType;
        string emotionalTag;
        string reinvestmentPath;
        bool validated;
    }

    SovereigntyEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _diasporaRegion, string memory _contributionType, string memory _emotionalTag, string memory _reinvestmentPath) external onlyAdmin {
        ledger.push(SovereigntyEntry(_diasporaRegion, _contributionType, _emotionalTag, _reinvestmentPath, false));
    }

    function validateEntry(uint256 index) external onlyAdmin {
        ledger[index].validated = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return ledger[index];
    }
}
