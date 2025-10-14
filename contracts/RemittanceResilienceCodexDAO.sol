// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemittanceResilienceCodexDAO {
    address public admin;

    struct RemittanceEntry {
        string senderCountry;
        string recipientBarangay;
        string dollarAmount;
        string reinvestmentPath;
        bool sealed;
    }

    RemittanceEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _senderCountry, string memory _recipientBarangay, string memory _dollarAmount, string memory _reinvestmentPath) external onlyAdmin {
        codex.push(RemittanceEntry(_senderCountry, _recipientBarangay, _dollarAmount, _reinvestmentPath, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (RemittanceEntry memory) {
        return codex[index];
    }
}
