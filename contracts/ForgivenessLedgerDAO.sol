// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForgivenessLedgerDAO {
    address public admin;

    struct ForgivenessEntry {
        string name;
        string transgression;
        string actOfRedemption;
        bool forgiven;
    }

    ForgivenessEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _name, string memory _transgression, string memory _actOfRedemption) external onlyAdmin {
        ledger.push(ForgivenessEntry(_name, _transgression, _actOfRedemption, false));
    }

    function markForgiven(uint256 index) external onlyAdmin {
        ledger[index].forgiven = true;
    }

    function getEntry(uint256 index) external view returns (ForgivenessEntry memory) {
        return ledger[index];
    }
}
