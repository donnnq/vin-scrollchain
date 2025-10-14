// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthSovereigntyLedgerProtocolDAO {
    address public admin;

    struct LedgerEntry {
        string purokOrBarangay;
        string sovereigntyClaim;
        string sector;
        string emotionalTag;
        bool logged;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logClaim(string memory _purokOrBarangay, string memory _sovereigntyClaim, string memory _sector, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_purokOrBarangay, _sovereigntyClaim, _sector, _emotionalTag, false));
    }

    function markLogged(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getClaim(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
