// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaReinvestmentProtocolDAO {
    address public admin;

    struct ReinvestmentEntry {
        string senderCountry;
        string recipientRegion;
        string reinvestmentPath;
        uint256 reinvestedAmount;
        bool sealed;
    }

    ReinvestmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _senderCountry, string memory _recipientRegion, string memory _reinvestmentPath, uint256 _reinvestedAmount) external onlyAdmin {
        entries.push(ReinvestmentEntry(_senderCountry, _recipientRegion, _reinvestmentPath, _reinvestedAmount, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        entries[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ReinvestmentEntry memory) {
        return entries[index];
    }
}
